package InterfazDatos;

import ClasesDTO.Materia;
import java.util.ArrayList;

public interface IMateriaDao{
    
    public boolean registrarMateria(Materia m);
    
    public boolean eliminarMateria(Materia m);
    
    public ArrayList<Materia> listarMaterias();
    
    public boolean actualizarMateria(Materia m);
    
    public boolean desactivarMaterias(Materia m);
    
    public ArrayList<Materia> listarMateriaDocente(long idDocente);
    
}
