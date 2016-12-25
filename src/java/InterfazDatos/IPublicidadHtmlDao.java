/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfazDatos;

import ClasesDTO.PublicidadHtml;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public interface IPublicidadHtmlDao {

    public ArrayList<PublicidadHtml> getDatosPublicidades(String slider);

    public boolean registrarPublicidad(String slider, String link, String img, String titulo);

    public boolean eliminarPublicidad(String idPubl);

    public boolean editarLinkPublicidad(String idPubli, String link);

    public boolean editarImgPublicidad(String idPubli, String img);

    public boolean editarTituloPublicidad(String idPubli, String titulo);

}
