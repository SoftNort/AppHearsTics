package ClasesDTO;

import java.io.Serializable;

public class Curso implements Serializable{
    
    private int idCurso;
    private boolean activo;
    private String descripcion;

    public Curso(int idCurso, boolean activo, String descripcion) {
        this.idCurso = idCurso;
        this.activo = activo;
        this.descripcion = descripcion;
    }

    public Curso(int idCurso) {
        this.idCurso = idCurso;
    }
    

    public Curso(boolean activo, String descripcion) {
        this.activo = activo;
        this.descripcion = descripcion;
    }
    

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public boolean getEstado() {
        return activo;
    }

    public void setEstado(boolean activo) {
        this.activo = activo;
    }
    
    
}
