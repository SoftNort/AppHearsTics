package InterfazDatos;

import ClasesDTO.TareaRespuesta;
import java.util.ArrayList;

public interface ITareaRespuestaDao {
 
    public int insertarTareaRespuesta(TareaRespuesta tarea);
    
    public ArrayList<TareaRespuesta> listarTareaRespuesta(long idTarea);
    
    public boolean actualizarTareaRespuesta(TareaRespuesta tarea);
    
    public boolean eliminarTareaRespuesta(TareaRespuesta tarea);
 
    public ArrayList<TareaRespuesta> litarRespuestasEstudiante(long idEstudiante);
    
    public TareaRespuesta listarTareasEstudiante(long idEstudiante, long idTarea);
    
    public boolean calificarTareasEstudiante(long idEstudiante, long idTarea, float calificacion);
}
