package ClasesDTO;

import java.io.Serializable;
import java.util.ArrayList;

public class TareaArchivo implements Serializable{
    
    private Tarea tarea;
    private String archivoUrl;
    private int id;

    public TareaArchivo(int id, String url) {
        this.id = id;
        this.archivoUrl = url;
    }

    public TareaArchivo(Tarea tarea, String archivoUrl, int id) {
        this.tarea = tarea;
        this.archivoUrl = archivoUrl;
        this.id = id;
    }

    public Tarea getTarea() {
        return tarea;
    }

    public void setTarea(Tarea tarea) {
        this.tarea = tarea;
    }

    public String getArchivoUrl() {
        return archivoUrl;
    }

    public void setArchivoUrl(String archivoUrl) {
        this.archivoUrl = archivoUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
