package edu.pe.demale.demale_proyecto.controller;

import edu.pe.demale.demale_proyecto.models.Vehiculo;
import edu.pe.demale.demale_proyecto.repositories.VehiculoRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/vehiculos")
@CrossOrigin(origins = "http://localhost:4200")
public class VehiculoController {

    private final VehiculoRepository vehiculoRepository;

    public VehiculoController(VehiculoRepository vehiculoRepository) {
        this.vehiculoRepository = vehiculoRepository;
    }

    @GetMapping
    public List<Vehiculo> listar() {
        return vehiculoRepository.findAll();
    }

    @GetMapping("/dropdown")
public List<java.util.Map<String, Object>> dropdown() {
    return vehiculoRepository.findAll().stream().map(v -> {
        java.util.Map<String, Object> map = new java.util.HashMap<>();
        map.put("idVehiculo", v.getIdVehiculo());
        map.put("descripcion",
                v.getPlaca() + " - " + v.getMarca() + " " + v.getModelo());
        return map;
    }).toList();
}

    @PostMapping
    public Vehiculo registrar(@RequestBody Vehiculo vehiculo) {
        return vehiculoRepository.save(vehiculo);
    }
}