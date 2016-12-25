package InterfazDatos;

import ClasesDTO.TareaEstudiante;
import java.util.ArrayList;
import java.util.Date;

public interface ITareaEstudianteDao {
    
    public boolean insertarTareaEstudiante(int idTarea, long idEstudiante, Date fechaEntrega, String materia);
    
    public boolean actualizarTareaEstudiante(int idTarea, long idEstudiante);
    
    public boolean eliminarTareaEstudiante();
    
    public ArrayList<TareaEstudiante> listarTareaEstudiante(long idEstudiante);
    
    public ArrayList<TareaEstudiante> listarTareaDocente(long idDocente);
    
    public ArrayList<TareaEstudiante> listarTareasMateria(long idDocente, long idMateria);
    
    public ArrayList<TareaEstudiante> listarPorAsunto(String asunto);
    
    public ArrayList<TareaEstudiante> listarMisTareas(long idEstudiante);
    
    public ArrayList<TareaEstudiante> listarTareasMateria(int tareaDocente, int idEstudiante);
    
    public ArrayList<TareaEstudiante> listarMisTareasDocente(long idDocente);
    
    public boolean cambiarFechaTarea(Date fechaEntrega, int idTarea);
    
}
