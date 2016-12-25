/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ClasesDTO;

/**
 *
 * @author Montes
 */
public class PaginaDto {
    private String idPagina;
    private String titulo;
    private String cuerpo;

    public PaginaDto() {
    }

    public PaginaDto(String idPagina, String titulo, String cuerpo) {
        this.idPagina = idPagina;
        this.titulo = titulo;
        this.cuerpo = cuerpo;
    }

    public String getIdPagina() {
        return idPagina;
    }

    public void setIdPagina(String idPagina) {
        this.idPagina = idPagina;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCuerpo() {
        return cuerpo;
    }

    public void setCuerpo(String cuerpo) {
        this.cuerpo = cuerpo;
    }
    
    
    
}
