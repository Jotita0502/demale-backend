package edu.pe.demale.demale_proyecto.controller;

import edu.pe.demale.demale_proyecto.models.Conductor;
import edu.pe.demale.demale_proyecto.repositories.ConductorRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/conductores")
@CrossOrigin(origins = "http://localhost:4200")
public class ConductorController {

    private final ConductorRepository conductorRepository;

    public ConductorController(ConductorRepository conductorRepository) {
        this.conductorRepository = conductorRepository;
    }

    @GetMapping
    public List<Conductor> listar() {
        return conductorRepository.findAll();
    }

    @GetMapping("/dropdown")
public List<java.util.Map<String, Object>> dropdown() {
    return conductorRepository.findAll().stream().map(c -> {
        java.util.Map<String, Object> map = new java.util.HashMap<>();
        map.put("idConductor", c.getIdConductor());
        map.put("nombreCompleto",
                c.getPersona().getNombres() + " " + c.getPersona().getApellidos());
        return map;
    }).toList();
}
}