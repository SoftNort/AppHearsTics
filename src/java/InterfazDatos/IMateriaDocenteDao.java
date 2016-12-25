package InterfazDatos;

import ClasesDTO.Materia;
import ClasesDTO.MateriaDocente;
import java.util.ArrayList;

public interface IMateriaDocenteDao {
    
    public boolean registrarMateriaDocente(int idDocente,int idMateria, int idCuros, char curso);
    
    public boolean eliminarMateriaDocente(int id);
    
    public ArrayList<MateriaDocente> listarMateriaDocente();
    
    public boolean actualizarDocenteMateria (int codIdDocente);
    
    public ArrayList<MateriaDocente> listarPorMateria(long idMateria);
    
    public ArrayList<MateriaDocente> listarMateriasGrupo(int idUsuario);
    
    public ArrayList<Materia> listarMateriaDocente(int idDocente);
    
}
