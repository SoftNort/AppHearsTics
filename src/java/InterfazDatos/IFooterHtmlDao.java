/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfazDatos;

import ClasesDTO.FooterHtml;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public interface IFooterHtmlDao {

    public ArrayList<FooterHtml> getFooter(String titulo);

    public boolean editarFooterValor(String id, String valor);

    public boolean editarFooterSubtitulo(String id, String subtitulo);

    public boolean editarFooterUrl(String id, String url);

}
