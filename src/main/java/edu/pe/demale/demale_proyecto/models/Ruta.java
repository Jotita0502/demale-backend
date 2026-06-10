package edu.pe.demale.demale_proyecto.models;

import jakarta.persistence.*;

@Entity
@Table(name = "rutas")
public class Ruta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdRuta")
    private Integer idRuta;

    @Column(name = "SerialRuta", nullable = false, unique = true, length = 15)
    private String serialRuta;

    @Column(name = "Ruta", nullable = false, length = 50)
    private String ruta;

    @Column(name = "Glosa", length = 100)
    private String glosa;

    public Integer getIdRuta() {
        return idRuta;
    }

    public void setIdRuta(Integer idRuta) {
        this.idRuta = idRuta;
    }

    public String getSerialRuta() {
        return serialRuta;
    }

    public void setSerialRuta(String serialRuta) {
        this.serialRuta = serialRuta;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getGlosa() {
        return glosa;
    }

    public void setGlosa(String glosa) {
        this.glosa = glosa;
    }
}