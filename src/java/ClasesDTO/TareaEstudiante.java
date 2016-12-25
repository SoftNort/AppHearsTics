package ClasesDTO;

import java.io.Serializable;
import java.util.Date;

public class TareaEstudiante implements Serializable {

    private Estudiante estudiante;
    private Tarea tarea;
    private Date fechaEntrega;
    private Materia materia;
    private double calificacion;
    private String estado;

    public TareaEstudiante() {
    }

    public TareaEstudiante(Estudiante estudiante, Tarea tarea) {
        this.estudiante = estudiante;
        this.tarea = tarea;
    }

    public TareaEstudiante(Estudiante estudiante, Tarea tarea, Materia m, Date fechaEntrega, double calificacion, String estado) {
        this.estudiante = estudiante;
        this.tarea = tarea;
        this.fechaEntrega = fechaEntrega;
        this.calificacion = calificacion;
        this.estado = estado;
        this.materia = m;
    }

    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public double getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(double calificacion) {
        this.calificacion = calificacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public Tarea getTarea() {
        return tarea;
    }

    public void setTarea(Tarea tarea) {
        this.tarea = tarea;
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

}
