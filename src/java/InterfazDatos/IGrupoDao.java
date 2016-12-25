
package InterfazDatos;
import ClasesDTO.Grupo;
import java.util.ArrayList;

public interface IGrupoDao{
    
    public boolean registrarGrupo(Grupo grupo);
    
    public boolean actulizarGrupo(Grupo grupo);
    
    public boolean eliminarGrupo(Grupo grupo);
    
    public ArrayList<Grupo> listarGrupos();
    
    public ArrayList<Grupo> listarGruposCurso(int idCurso);
    
    public ArrayList<Grupo> listarGruposByCurso(int idCurso);
    
}
