package ClasesDTO;

import java.io.Serializable;
import java.util.Date;

public class Tarea implements Serializable{
    
    private int id;
    private String descripcion;
    private String asunto;
    
    public Tarea(int id) {
        this.id = id;
    }

    public Tarea(String descripcion, String asunto) {
        this.descripcion = descripcion;
        this.asunto = asunto;
    }

    public Tarea() {
    }

    public Tarea(int id, String descripcion, String asunto) {
        this.id = id;
        this.descripcion = descripcion;
        this.asunto = asunto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }
    
    
   
}
