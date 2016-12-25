package InterfazDatos;

import ClasesDTO.*;
import java.util.ArrayList;

public interface IPaginaTipoUsuario {
    
    public boolean registrar(Pagina pagina, TipoUsuario tipo);
    
    public ArrayList<PaginaTipoUsuario> listarPaginasTipoUsuario(int tipo);
    
    public ArrayList<PaginaTipoUsuario> listarCarpetasTipoUsuario(int tipo);
    
    public ArrayList<PaginaTipoUsuario> listarPaginasSinCarpeta(int tipo);    
    
    public ArrayList<PaginaTipoUsuario> listarPaginasDiferentes(int idCarpeta);
    
    public ArrayList<PaginaTipoUsuario> listarPaginasIguales(int idCarpeta);
    
    public boolean eliminar(Pagina pagina, TipoUsuario tipo);
    
    public ArrayList<PaginaTipoUsuario> listarPaginas(int tipo);
    
    public ArrayList<PaginaTipoUsuario> listarPaginasIdCarpeta(long tipo, int carpeta);
}
