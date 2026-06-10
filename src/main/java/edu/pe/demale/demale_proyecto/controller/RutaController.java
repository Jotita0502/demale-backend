package edu.pe.demale.demale_proyecto.controller;

import edu.pe.demale.demale_proyecto.models.Ruta;
import edu.pe.demale.demale_proyecto.repositories.RutaRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/rutas")
@CrossOrigin(origins = "http://localhost:4200")
public class RutaController {

    private final RutaRepository rutaRepository;

    public RutaController(RutaRepository rutaRepository) {
        this.rutaRepository = rutaRepository;
    }

    @GetMapping
    public List<Ruta> listar() {
        return rutaRepository.findAll();
    }

    @GetMapping("/dropdown")
public List<java.util.Map<String, Object>> dropdown() {
    return rutaRepository.findAll().stream().map(r -> {
        java.util.Map<String, Object> map = new java.util.HashMap<>();
        map.put("idRuta", r.getIdRuta());
        map.put("descripcionRuta",
                r.getSerialRuta() + " - " + r.getRuta());
        return map;
    }).toList();
}
    @PostMapping
    public Ruta registrar(@RequestBody Ruta ruta) {
        return rutaRepository.save(ruta);
    }
}