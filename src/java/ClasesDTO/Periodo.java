package ClasesDTO;

import java.io.Serializable;
import java.util.Date;

public class Periodo implements Serializable{
    private byte numero;
    private int year;
    private Date fechaInicio;
    private Date fechaFin;
    
    public Periodo(){}

    public Periodo(byte numero, int year, Date fechaInicio, Date fechaFin) {
        this.numero = numero;
        this.year = year;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
    }

    public byte getNumero() {
        return numero;
    }

    public void setNumero(byte numero) {
        this.numero = numero;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }
    
    
}
