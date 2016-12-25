package InterfazDatos;

import ClasesDTO.Pagina;
import java.util.ArrayList;

public interface IPaginaDao {
    
    public boolean registrarPagina(Pagina p);
    
    public boolean elimingarPagina(Pagina p);
    
    public boolean actualizarPagina(Pagina p);
    
    public boolean actualizarPaginaCarpeta(int carpeta, int idPagina);
    
    public ArrayList<Pagina> listarPaginas();
    
    public ArrayList<Pagina> listarPaginasCarpeta(int carpeta);
    
}
