/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package InterfazDatos;

import ClasesDTO.CabeceraHtml;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public interface ICabeceraHtmlDao {
    
    public ArrayList<CabeceraHtml> getCabeceraTitulo();
    
    public ArrayList<CabeceraHtml> getCabeceraLi(String id);
    
    public CabeceraHtml getLiXid(String idLi);
    
    public boolean insertarLi(String idNav, String posicion, String nombre, String url);
    
    public boolean eliminarLi(String idLi);
    
    public boolean editarLiPosicion(String idLi, String posicion);
    
    public boolean editarLiNombre(String idLi, String nombre);
    
    public boolean editarLiUrl(String idLi, String url);
    
}
