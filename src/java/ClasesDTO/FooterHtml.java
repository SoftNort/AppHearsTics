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
public class FooterHtml {

    private String id;
    private String titulo;
    private String subtitulo;
    private String valor;
    private String url;

    public FooterHtml() {
    }

    public FooterHtml(String id, String titulo, String subtitulo, String valor, String url) {
        this.id = id;
        this.titulo = titulo;
        this.subtitulo = subtitulo;
        this.valor = valor;
        this.url = url;
    }

    public FooterHtml(String titulo, String subtitulo, String valor, String url) {
        this.titulo = titulo;
        this.subtitulo = subtitulo;
        this.valor = valor;
        this.url = url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getSubtitulo() {
        return subtitulo;
    }

    public void setSubtitulo(String subtitulo) {
        this.subtitulo = subtitulo;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}
