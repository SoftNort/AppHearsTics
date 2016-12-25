/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfazDatos;

import ClasesDTO.PaginasHtml;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public interface IPaginasHtmlDao {

    public ArrayList<PaginasHtml> getPaginaXurl(String url);

    public String[] getPaginaXidLi(String idLi);

    public boolean registrarPagina(String idLi, String titulo, String contenido, String imagen);

    public boolean editarPagina(String idLi, String titulo, String contenido, String imagen);

}
