/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ClasesDTO;

/**
 *
 * @author Usuario
 */
public class ClasificadosHtml {
    private String idClasificado ;
    private String lateralidad ;
    private String posicion ;
    private String titulo ;
    private String parrafo ;

    public ClasificadosHtml() {
    }

    public ClasificadosHtml(String idClasificado, String lateralidad, String posicion, String titulo, String parrafo) {
        this.idClasificado = idClasificado;
        this.lateralidad = lateralidad;
        this.posicion = posicion;
        this.titulo = titulo;
        this.parrafo = parrafo;
    }

    public ClasificadosHtml(String idClasificado, String lateralidad, String titulo, String parrafo) {
        this.idClasificado = idClasificado;
        this.lateralidad = lateralidad;
        this.titulo = titulo;
        this.parrafo = parrafo;
    }
    
    
    

    public String getIdClasificado() {
        return idClasificado;
    }

    public void setIdClasificado(String idClasificado) {
        this.idClasificado = idClasificado;
    }

    public String getLateralidad() {
        return lateralidad;
    }

    public void setLateralidad(String lateralidad) {
        this.lateralidad = lateralidad;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getParrafo() {
        return parrafo;
    }

    public void setParrafo(String parrafo) {
        this.parrafo = parrafo;
    }
}
