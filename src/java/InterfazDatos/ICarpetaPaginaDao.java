
package InterfazDatos;

import ClasesDTO.CarpetaPagina;
import java.util.ArrayList;

public interface ICarpetaPaginaDao {
    
    public boolean registrarCarpetaPagina(CarpetaPagina c);
    
    public boolean eliminarCarpetaPagina(int c);
    
    public boolean editarCarpetaPagina(int c, String nombre, String icono);
    
    public ArrayList<CarpetaPagina> listarCarpetaPaginas();
    
}
