package ClasesDTO;

import java.io.Serializable;
import java.util.ArrayList;

public class TareaRespuesta implements Serializable{
    
    private Tarea tarea;
    private Estudiante estudiante;
    private String respuesta;
    private long id;
    private ArchivoRespuesta archivo;

    public TareaRespuesta(Tarea tarea, Estudiante estudiante, String respuesta, long id) {
        this.tarea = tarea;
        this.estudiante = estudiante;
        this.respuesta = respuesta;
        this.id = id;
    }

    public TareaRespuesta(Tarea tarea, Estudiante estudiante, String respuesta) {
        this.tarea = tarea;
        this.estudiante = estudiante;
        this.respuesta = respuesta;
    }

    public TareaRespuesta() {
    }

    public Tarea getTarea() {
        return tarea;
    }

    public void setTarea(Tarea tarea) {
        this.tarea = tarea;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public ArchivoRespuesta getArchivo() {
        return archivo;
    }

    public void setArchivo(ArchivoRespuesta archivo) {
        this.archivo = archivo;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    
    
}
