package ClasesDTO;

import java.io.Serializable;
import java.util.ArrayList;

public class ArchivoRespuesta implements Serializable{
 
    private long idTarea;
    private ArrayList<String> urls;

    public ArchivoRespuesta(long idTarea, ArrayList<String> urls) {
        this.idTarea = idTarea;
        this.urls = urls;
    }

    public ArchivoRespuesta(long idTarea) {
        this.idTarea = idTarea;
    }

    public ArchivoRespuesta() {
    }

    public long getIdTarea() {
        return idTarea;
    }

    public void setIdTarea(long idTarea) {
        this.idTarea = idTarea;
    }

    public ArrayList<String> getUrls() {
        return urls;
    }

    public void setUrls(ArrayList<String> urls) {
        this.urls = urls;
    }
    
    public boolean insertarURL(String url){
        return this.urls.add(url);
    }
    
}
