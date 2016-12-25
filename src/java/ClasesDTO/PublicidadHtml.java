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
public class PublicidadHtml {

    private String idPublicidad;
    private String slider;
    private String posicion;
    private String link;
    private String img;
    private String titulo;

    public PublicidadHtml() {
    }

    public PublicidadHtml(String idPublicidad, String slider, String posicion, String link, String img, String titulo) {
        this.idPublicidad = idPublicidad;
        this.slider = slider;
        this.posicion = posicion;
        this.link = link;
        this.img = img;
        this.titulo = titulo;
    }

    public PublicidadHtml(String idPublicidad, String slider, String link, String img, String titulo) {
        this.idPublicidad = idPublicidad;
        this.slider = slider;
        this.link = link;
        this.img = img;
        this.titulo = titulo;
    }

    public String getIdPublicidad() {
        return idPublicidad;
    }

    public void setIdPublicidad(String idPublicidad) {
        this.idPublicidad = idPublicidad;
    }

    public String getSlider() {
        return slider;
    }

    public void setSlider(String slider) {
        this.slider = slider;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

}
