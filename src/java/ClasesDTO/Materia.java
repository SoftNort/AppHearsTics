package ClasesDTO;

import java.io.Serializable;
import java.sql.Date;

public class Materia implements Serializable{
    
    private String nombre;
    private int id;
    private String estado;
    private Date fechaActualizacion;

    public Materia(String nombre, int id) {
        this.nombre = nombre;
        this.id = id;
        this.estado="Activo";
    }
    
    public Materia(){}

    public Date getFechaActualizacion() {
        return fechaActualizacion;
    }

    public void setFechaActualizacion(Date fechaActualizacion) {
        this.fechaActualizacion = fechaActualizacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
