package edu.pe.demale.demale_proyecto.models;

import jakarta.persistence.*;

@Entity
@Table(name = "conductor")
public class Conductor {

    @Id
    @Column(name = "IdConductor")
    private Integer idConductor;

    @OneToOne
    @MapsId
    @JoinColumn(name = "IdConductor")
    private Persona persona;

    @Column(name = "Licencia", nullable = false, unique = true, length = 20)
    private String licencia;

    @ManyToOne
    @JoinColumn(name = "IdRol", nullable = false)
    private Rol rol;

    public Integer getIdConductor() {
        return idConductor;
    }

    public void setIdConductor(Integer idConductor) {
        this.idConductor = idConductor;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public String getLicencia() {
        return licencia;
    }

    public void setLicencia(String licencia) {
        this.licencia = licencia;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }
}