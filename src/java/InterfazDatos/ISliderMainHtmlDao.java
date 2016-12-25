/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfazDatos;

import ClasesDTO.SliderMainHtml;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public interface ISliderMainHtmlDao {

    public ArrayList<SliderMainHtml> getSlider();

    public boolean registrarSlider(String posicion, String titulo, String descripcion, String link, String http, String imagen);

    public boolean eliminarSlider(String idSlider);

    public boolean editarTexto1(String idSlider, String parrafo1);

    public boolean editarTexto2(String idSlider, String parrafo2);

    public boolean editarTexto3(String idSlider, String parrafo3);

    public boolean editarUrlLinkSlider(String idSlider, String urlLink);

    public boolean editarPosicionSlider(String idSlider, String posicion);

    public boolean editarImagenSlider(String idSlider, String imagen);

}
