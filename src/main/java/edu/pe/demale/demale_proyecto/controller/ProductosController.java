package edu.pe.demale.demale_proyecto.controller;

import edu.pe.demale.demale_proyecto.dto.ProductoResponse;
import edu.pe.demale.demale_proyecto.models.Productos;
import edu.pe.demale.demale_proyecto.service.ProductoService;
import edu.pe.demale.demale_proyecto.dto.ProductoRegistroRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/productos")
@CrossOrigin(origins = "http://localhost:4200")
public class ProductosController {

    @Autowired
    private ProductoService productoService;

    @GetMapping
    public ArrayList<Productos> listar() {
        return this.productoService.listarProductos();
    }

    @PostMapping
    public Productos registrar(@RequestBody Productos productos) {
        return this.productoService.grabarProductos(productos);
    }
    @PostMapping("/registrar")
public ResponseEntity<ProductoResponse> registrarProductoSinGuia(
        @RequestBody ProductoRegistroRequest request) {
    try {
        ProductoResponse response = productoService.registrarProducto(request, null);
        return ResponseEntity.ok(response);
    } catch (Exception e) {
        e.printStackTrace();
        return ResponseEntity.badRequest().build();
    }
}

@PostMapping("/registrar-con-guia")
public ResponseEntity<ProductoResponse> registrarProductoConGuia(
        @RequestPart("productoData") String productoDataJson,
        @RequestPart(value = "guiaRemisionFile", required = false) MultipartFile guiaRemision) {
    try {
        com.fasterxml.jackson.databind.ObjectMapper mapper =
                new com.fasterxml.jackson.databind.ObjectMapper();

        ProductoRegistroRequest request =
                mapper.readValue(productoDataJson, ProductoRegistroRequest.class);

        ProductoResponse response = productoService.registrarProducto(request, guiaRemision);
        return ResponseEntity.ok(response);
    } catch (Exception e) {
        e.printStackTrace();
        return ResponseEntity.badRequest().build();
    }
}
@GetMapping("/historial")
public List<ProductoResponse> obtenerHistorialProductos() {
    return this.productoService.obtenerHistorialProductos();
}
@GetMapping("/en-almacen")
public List<ProductoResponse> obtenerProductosEnAlmacen() {
    return this.productoService.obtenerProductosEnAlmacen();
}
    @GetMapping("/{id}")
    public Optional<Productos> getProductoXID(@PathVariable("id") int id) {
        return this.productoService.obtenerProductoXID(id);
    }

    @PutMapping("/{id}")
    public Productos actualizaProductos(
            @RequestBody Productos productos,
            @PathVariable("id") int id) {
        return this.productoService.actualizaProductos(productos, id);
    }

    @DeleteMapping("/{id}")
    public String eliminarProducto(@PathVariable("id") int id) {
        boolean ok = this.productoService.eliminarProducto(id);

        if (ok) {
            return "Producto con id " + id + " eliminado correctamente";
        }

        return "No se pudo eliminar el producto con id " + id;
    }

    @GetMapping("/cliente/{idCliente}/en-almacen")
    public List<ProductoResponse> obtenerProductosEnAlmacenPorCliente(
            @PathVariable Integer idCliente) {
        return this.productoService.obtenerProductosPorCliente(idCliente);
    }
}