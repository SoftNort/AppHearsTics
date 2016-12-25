package InterfazDatos;

import ClasesDTO.ArchivoRespuesta;
import java.util.ArrayList;

public interface IArchivoRespuestaDao {
    
    public boolean insertaArchivoRespuesta(long idTareaRespuesta, String url);
    
    public ArchivoRespuesta obtenerArchivoRespuesta(long idTareaRespuesta);
    
    public ArchivoRespuesta obtenerRespuestaEstudiante(long idEstudiante, long idTarea);
    
    public boolean actualizarArchivoRespuesta();
    
    public boolean eliminarArchivoRespuesta();
}
