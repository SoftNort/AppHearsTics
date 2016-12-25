package InterfazDatos;

import ClasesDTO.TipoUsuario;
import java.util.ArrayList;

public interface ITipoUsuarioDao {
    
    public boolean registrarTipoUsuario(TipoUsuario tipo);
    
    public boolean eliminarTipoUsuario(TipoUsuario tipo);
    
    public ArrayList<TipoUsuario> listarTiposUsuario();
    
    public TipoUsuario listar(int tipo);
    
    public boolean actualizarTipoUsuario(TipoUsuario tipo);
}
