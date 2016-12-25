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
public class PaginasHtml {

    private String idPagina;
    private String idLiPagina;
    private String titulo;
    private String contenido;
    private String imagen;

    public PaginasHtml() {
    }

    public PaginasHtml(String idPagina, String idLiPagina, String titulo, String contenido, String imagen) {
        this.idPagina = idPagina;
        this.idLiPagina = idLiPagina;
        this.titulo = titulo;
        this.contenido = contenido;
        this.imagen = imagen;
    }

    public String getIdPagina() {
        return idPagina;
    }

    public void setIdPagina(String idPagina) {
        this.idPagina = idPagina;
    }

    public String getIdLiPagina() {
        return idLiPagina;
    }

    public void setIdLiPagina(String idLiPagina) {
        this.idLiPagina = idLiPagina;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}
