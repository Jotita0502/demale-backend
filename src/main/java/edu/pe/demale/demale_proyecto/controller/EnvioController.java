package edu.pe.demale.demale_proyecto.controller;

import edu.pe.demale.demale_proyecto.dto.EnvioCreacionDto;
import edu.pe.demale.demale_proyecto.models.*;
import edu.pe.demale.demale_proyecto.repositories.*;

import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api/envios")
@CrossOrigin(origins = "http://localhost:4200")
public class EnvioController {

    private final EnvioRepository envioRepository;
    private final ConductorRepository conductorRepository;
    private final VehiculoRepository vehiculoRepository;
    private final RutaRepository rutaRepository;
    private final EstadoEnvioRepository estadoEnvioRepository;
    private final IProductosRepository productosRepository;
    private final JdbcTemplate jdbcTemplate;

    public EnvioController(
            EnvioRepository envioRepository,
            ConductorRepository conductorRepository,
            VehiculoRepository vehiculoRepository,
            RutaRepository rutaRepository,
            EstadoEnvioRepository estadoEnvioRepository,
            IProductosRepository productosRepository,
            JdbcTemplate jdbcTemplate) {
        this.envioRepository = envioRepository;
        this.conductorRepository = conductorRepository;
        this.vehiculoRepository = vehiculoRepository;
        this.rutaRepository = rutaRepository;
        this.estadoEnvioRepository = estadoEnvioRepository;
        this.productosRepository = productosRepository;
        this.jdbcTemplate = jdbcTemplate;
    }

    @GetMapping
    public List<Map<String, Object>> listar() {
        String sql = """
            SELECT
                e.IdEnvio AS idEnvio,
                e.IdEnvio AS codigo,
                e.FechSalida AS fechaSalida,
                e.FechLlegada AS fechaLlegada,
                e.Observacion AS observacion,
                ee.Estado AS estadoEnvioNombre,
                CONCAT(p.Nombres, ' ', p.Apellidos) AS conductorNombre,
                CONCAT(v.Placa, ' - ', v.Marca, ' ', v.Modelo) AS vehiculoDescripcion,
                CONCAT(r.SerialRuta, ' - ', r.Ruta) AS rutaDescripcion,
                (
                    SELECT pa.NombreAcopio
                    FROM detalleEnvios de
                    JOIN producto pr ON pr.IdProducto = de.IdProducto
                    JOIN puntoAcopio pa ON pa.IdPuntoAcopio = pr.IdPuntoAcopio
                    WHERE de.IdEnvio = e.IdEnvio
                    LIMIT 1
                ) AS puntoAcopioNombre,
                (
                    SELECT d.Distrito
                    FROM detalleEnvios de
                    JOIN producto pr ON pr.IdProducto = de.IdProducto
                    JOIN distrito d ON d.IdDistrito = pr.IdDistrito
                    WHERE de.IdEnvio = e.IdEnvio
                    LIMIT 1
                ) AS destino
            FROM envios e
            JOIN conductor c ON c.IdConductor = e.IdConductor
            JOIN persona p ON p.IdPersona = c.IdConductor
            JOIN vehiculos v ON v.IdVehiculo = e.IdVehiculo
            JOIN rutas r ON r.IdRuta = e.IdRuta
            JOIN estadosEnvio ee ON ee.IdEstadoEnvio = e.IdEstadoEnvio
            ORDER BY e.IdEnvio DESC
        """;

        return jdbcTemplate.queryForList(sql);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> obtenerPorId(@PathVariable Integer id) {
        Envio envio = envioRepository.findById(id).orElse(null);

        if (envio == null) {
            return ResponseEntity.notFound().build();
        }

        Map<String, Object> response = new HashMap<>();
        response.put("idEnvio", envio.getIdEnvio());
        response.put("idConductor", envio.getConductor().getIdConductor());
        response.put("idVehiculo", envio.getVehiculo().getIdVehiculo());
        response.put("idRuta", envio.getRuta().getIdRuta());
        response.put("idEstadoEnvio", envio.getEstadoEnvio().getIdEstadoEnvio());
        response.put("fechSalida", envio.getFechSalida());
        response.put("fechaSalida", envio.getFechSalida());
        response.put("fechLlegada", envio.getFechLlegada());
        response.put("fechaLlegada", envio.getFechLlegada());
        response.put("observacion", envio.getObservacion());

        return ResponseEntity.ok(response);
    }

    @PostMapping
    @Transactional
    public Map<String, Object> crearEnvio(@RequestBody EnvioCreacionDto dto) {

        if (dto.getProductosIds() == null || dto.getProductosIds().isEmpty()) {
            throw new RuntimeException("Debe seleccionar al menos un producto.");
        }

        Conductor conductor = conductorRepository.findById(dto.getIdConductor())
                .orElseThrow(() -> new RuntimeException("Conductor no encontrado"));

        Vehiculo vehiculo = vehiculoRepository.findById(dto.getIdVehiculo())
                .orElseThrow(() -> new RuntimeException("Vehículo no encontrado"));

        Ruta ruta = rutaRepository.findById(dto.getIdRuta())
                .orElseThrow(() -> new RuntimeException("Ruta no encontrada"));

        EstadoEnvio estadoTransito = estadoEnvioRepository.findById(2)
                .orElseThrow(() -> new RuntimeException("Estado En tránsito no encontrado"));

        Envio envio = new Envio();
        envio.setConductor(conductor);
        envio.setVehiculo(vehiculo);
        envio.setRuta(ruta);
        envio.setEstadoEnvio(estadoTransito);
        envio.setFechSalida(dto.getFechaSalida());
        envio.setFechLlegada(dto.getFechaLlegada());
        envio.setObservacion(dto.getObservacion());

        Envio guardado = envioRepository.save(envio);

        for (Integer idProducto : dto.getProductosIds()) {
            Productos producto = productosRepository.findById(idProducto)
                    .orElseThrow(() -> new RuntimeException("Producto no encontrado: " + idProducto));

            jdbcTemplate.update(
                    "INSERT INTO detalleEnvios (IdEnvio, IdProducto) VALUES (?, ?)",
                    guardado.getIdEnvio(),
                    idProducto
            );

            producto.setEstadoEnvio(estadoTransito);
            productosRepository.save(producto);
        }

        Map<String, Object> response = new HashMap<>();
        response.put("mensaje", "Envío creado correctamente");
        response.put("idEnvio", guardado.getIdEnvio());
        return response;
    }
    @PutMapping("/{id}")
@Transactional
public ResponseEntity<Map<String, Object>> actualizar(
        @PathVariable Integer id,
        @RequestBody Map<String, Object> dto) {

    Envio envio = envioRepository.findById(id).orElse(null);

    if (envio == null) {
        return ResponseEntity.notFound().build();
    }

    if (dto.get("idConductor") != null) {
        Integer idConductor = Integer.valueOf(dto.get("idConductor").toString());
        conductorRepository.findById(idConductor).ifPresent(envio::setConductor);
    }

    if (dto.get("idVehiculo") != null) {
        Integer idVehiculo = Integer.valueOf(dto.get("idVehiculo").toString());
        vehiculoRepository.findById(idVehiculo).ifPresent(envio::setVehiculo);
    }

    if (dto.get("idRuta") != null) {
        Integer idRuta = Integer.valueOf(dto.get("idRuta").toString());
        rutaRepository.findById(idRuta).ifPresent(envio::setRuta);
    }

    Object fechaSalida = dto.get("fechSalida");
    if (fechaSalida == null) {
        fechaSalida = dto.get("fechaSalida");
    }

    if (fechaSalida != null && !fechaSalida.toString().isBlank()) {
        envio.setFechSalida(java.time.LocalDate.parse(fechaSalida.toString()));
    }

    Object observacion = dto.get("observacion");
    if (observacion != null) {
        envio.setObservacion(observacion.toString());
    }

    envioRepository.save(envio);

    Map<String, Object> response = new HashMap<>();
    response.put("mensaje", "Envío actualizado correctamente");
    response.put("idEnvio", envio.getIdEnvio());

    return ResponseEntity.ok(response);
}
    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<Map<String, Object>> eliminar(@PathVariable Integer id) {
        if (!envioRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }

        List<Integer> productosIds = jdbcTemplate.queryForList(
                "SELECT IdProducto FROM detalleEnvios WHERE IdEnvio = ?",
                Integer.class,
                id
        );

        EstadoEnvio estadoAlmacen = estadoEnvioRepository.findById(1)
                .orElseThrow(() -> new RuntimeException("Estado En Almacén no encontrado"));

        for (Integer idProducto : productosIds) {
            productosRepository.findById(idProducto).ifPresent(producto -> {
                producto.setEstadoEnvio(estadoAlmacen);
                productosRepository.save(producto);
            });
        }

        jdbcTemplate.update("DELETE FROM detalleEnvios WHERE IdEnvio = ?", id);
        envioRepository.deleteById(id);

        Map<String, Object> response = new HashMap<>();
        response.put("mensaje", "Envío eliminado correctamente");
        return ResponseEntity.ok(response);
    }
}