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
public class ClasificadosLinksHtml {

    private String idClasificadoLink;
    private String idClasificado;
    private String posicion;
    private String nombreLink;
    private String tituloLink;
    private String httpLink;

    public ClasificadosLinksHtml() {
    }

    public ClasificadosLinksHtml(String idClasificadoLink, String idClasificado, String posicion, String nombreLink, String tituloLink, String httpLink) {
        this.idClasificadoLink = idClasificadoLink;
        this.idClasificado = idClasificado;
        this.posicion = posicion;
        this.nombreLink = nombreLink;
        this.tituloLink = tituloLink;
        this.httpLink = httpLink;
    }

    public ClasificadosLinksHtml(String idClasificadoLink, String idClasificado, String nombreLink, String tituloLink, String httpLink) {
        this.idClasificadoLink = idClasificadoLink;
        this.idClasificado = idClasificado;
        this.nombreLink = nombreLink;
        this.tituloLink = tituloLink;
        this.httpLink = httpLink;
    }

    public String getIdClasificadoLink() {
        return idClasificadoLink;
    }

    public void setIdClasificadoLink(String idClasificadoLink) {
        this.idClasificadoLink = idClasificadoLink;
    }

    public String getIdClasificado() {
        return idClasificado;
    }

    public void setIdClasificado(String idClasificado) {
        this.idClasificado = idClasificado;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }

    public String getNombreLink() {
        return nombreLink;
    }

    public void setNombreLink(String nombreLink) {
        this.nombreLink = nombreLink;
    }

    public String getTituloLink() {
        return tituloLink;
    }

    public void setTituloLink(String tituloLink) {
        this.tituloLink = tituloLink;
    }

    public String getHttpLink() {
        return httpLink;
    }

    public void setHttpLink(String httpLink) {
        this.httpLink = httpLink;
    }
}
