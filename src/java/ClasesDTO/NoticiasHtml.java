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
public class NoticiasHtml {

    private String idNot;
    private String posicion;
    private String titulo;
    private String urlImg;
    private String descri;
    private String parrafo;

    public NoticiasHtml() {
    }

    public NoticiasHtml(String idNot, String posicion, String titulo, String urlImg, String descri, String parrafo) {
        this.idNot = idNot;
        this.posicion = posicion;
        this.titulo = titulo;
        this.urlImg = urlImg;
        this.descri = descri;
        this.parrafo = parrafo;
    }

    public NoticiasHtml(String idNot, String titulo, String urlImg, String descri, String parrafo) {
        this.idNot = idNot;
        this.titulo = titulo;
        this.urlImg = urlImg;
        this.descri = descri;
        this.parrafo = parrafo;
    }

    public String getIdNot() {
        return idNot;
    }

    public void setIdNot(String idNot) {
        this.idNot = idNot;
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

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }

    public String getParrafo() {
        return parrafo;
    }

    public void setUrlLink(String parrafo) {
        this.parrafo = parrafo;
    }
}
