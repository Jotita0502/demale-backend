package edu.pe.demale.demale_proyecto.dto;

public class TrabajadorDropdownDto {
    private Integer idTrabajador;
    private String nombreCompleto;

    public TrabajadorDropdownDto() {
    }

    public TrabajadorDropdownDto(Integer idTrabajador, String nombreCompleto) {
        this.idTrabajador = idTrabajador;
        this.nombreCompleto = nombreCompleto;
    }

    public Integer getIdTrabajador() {
        return idTrabajador;
    }

    public void setIdTrabajador(Integer idTrabajador) {
        this.idTrabajador = idTrabajador;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }
}