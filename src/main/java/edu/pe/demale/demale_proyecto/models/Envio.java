package edu.pe.demale.demale_proyecto.models;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "envios")
public class Envio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdEnvio")
    private Integer idEnvio;

    @ManyToOne
    @JoinColumn(name = "IdConductor", nullable = false)
    private Conductor conductor;

    @ManyToOne
    @JoinColumn(name = "IdVehiculo", nullable = false)
    private Vehiculo vehiculo;

    @ManyToOne
    @JoinColumn(name = "IdRuta", nullable = false)
    private Ruta ruta;

    @ManyToOne
    @JoinColumn(name = "IdEstadoEnvio", nullable = false)
    private EstadoEnvio estadoEnvio;

    @Column(name = "FechSalida", nullable = false)
    private LocalDate fechSalida;

    @Column(name = "FechLlegada")
    private LocalDate fechLlegada;

    @Column(name = "Observacion")
    private String observacion;

    public Integer getIdEnvio() { return idEnvio; }
    public void setIdEnvio(Integer idEnvio) { this.idEnvio = idEnvio; }

    public Conductor getConductor() { return conductor; }
    public void setConductor(Conductor conductor) { this.conductor = conductor; }

    public Vehiculo getVehiculo() { return vehiculo; }
    public void setVehiculo(Vehiculo vehiculo) { this.vehiculo = vehiculo; }

    public Ruta getRuta() { return ruta; }
    public void setRuta(Ruta ruta) { this.ruta = ruta; }

    public EstadoEnvio getEstadoEnvio() { return estadoEnvio; }
    public void setEstadoEnvio(EstadoEnvio estadoEnvio) { this.estadoEnvio = estadoEnvio; }

    public LocalDate getFechSalida() { return fechSalida; }
    public void setFechSalida(LocalDate fechSalida) { this.fechSalida = fechSalida; }

    public LocalDate getFechLlegada() { return fechLlegada; }
    public void setFechLlegada(LocalDate fechLlegada) { this.fechLlegada = fechLlegada; }

    public String getObservacion() { return observacion; }
    public void setObservacion(String observacion) { this.observacion = observacion; }
}