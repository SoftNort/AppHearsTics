/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfazDatos;

import ClasesDTO.ClasificadosLinksHtml;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public interface IClasificadosLinksHtmlDao {

    public ArrayList<ClasificadosLinksHtml> getClasificadosLinksLateral(String idClasificado);

    public boolean registrarLink(String idClasificado, String nombreLink, String tituloLink, String httpLink);

    public boolean eliminarClasificadopadreLink(String idClasificado);

    public boolean eliminarClasificadohijoLink(String idClasificado);

    public boolean editarNombreLink(String idClasificado, String nombreLink);

    public boolean editarTituloLink(String idClasificado, String tituloLink);

    public boolean editarHttpLink(String idClasificado, String httpLink);

}
