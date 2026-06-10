package edu.pe.demale.demale_proyecto.dto;

import java.time.LocalDate;
import java.util.List;

public class EnvioCreacionDto {
    private Integer idConductor;
    private Integer idVehiculo;
    private Integer idRuta;
    private LocalDate fechaSalida;
    private LocalDate fechaLlegada;
    private String observacion;
    private List<Integer> productosIds;

    public Integer getIdConductor() { return idConductor; }
    public void setIdConductor(Integer idConductor) { this.idConductor = idConductor; }

    public Integer getIdVehiculo() { return idVehiculo; }
    public void setIdVehiculo(Integer idVehiculo) { this.idVehiculo = idVehiculo; }

    public Integer getIdRuta() { return idRuta; }
    public void setIdRuta(Integer idRuta) { this.idRuta = idRuta; }

    public LocalDate getFechaSalida() { return fechaSalida; }
    public void setFechaSalida(LocalDate fechaSalida) { this.fechaSalida = fechaSalida; }

    public LocalDate getFechaLlegada() { return fechaLlegada; }
    public void setFechaLlegada(LocalDate fechaLlegada) { this.fechaLlegada = fechaLlegada; }

    public String getObservacion() { return observacion; }
    public void setObservacion(String observacion) { this.observacion = observacion; }

    public List<Integer> getProductosIds() { return productosIds; }
    public void setProductosIds(List<Integer> productosIds) { this.productosIds = productosIds; }
}