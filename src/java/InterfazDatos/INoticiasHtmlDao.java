/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfazDatos;

import ClasesDTO.NoticiasHtml;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public interface INoticiasHtmlDao {

    public ArrayList<NoticiasHtml> getNoticiasPaginas(int pg, int numreg);
    
    public ArrayList<NoticiasHtml> getNoticiasId(String idNoticia);
    
    public boolean registrarNoticia(String titulo, String img, String descripcion, String parrafo);
    
    public boolean eliminarNoticia(String idNoticia);
    
    public int contarFilas();
    
    public boolean editarTituloNoticia(String idNoticia, String titulo);
    
    public boolean editarDescripcionNoticia(String idNoticia, String descripcion);
    
    public boolean editarParrafoNoticia(String idNoticia, String parrafo);
    
    public boolean editarImagenNoticia(String idNoticia, String imagen);
}
