/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfazDatos;

import ClasesDTO.ClasificadosHtml;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public interface IClasificadosHtmlDao {

    public ArrayList<ClasificadosHtml> getClasificadosLateral(String lateralidad);

    public boolean registrarClasificado(String lateralidad, String titulo, String parrafo);

    public boolean eliminarClasificado(String idClasificado);

    public boolean editarLateralidad(String idClasificado, String lateralidad);

    public boolean editarTitulo(String idClasificado, String titulo);

    public boolean editarParrafo(String idClasificado, String parrafo);
    
    
}
