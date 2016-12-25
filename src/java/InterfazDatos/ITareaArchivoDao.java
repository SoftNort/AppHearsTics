package InterfazDatos;

import ClasesDTO.Tarea;
import ClasesDTO.TareaArchivo;
import java.util.ArrayList;

public interface ITareaArchivoDao {
    
    public boolean insertarTareaArchivo(TareaArchivo tarea);
    
    public ArrayList<TareaArchivo> listarTareaArchivos(Tarea tarea);
    
    public boolean eliminarTareaArchivo(TareaArchivo tarea);
    
    public boolean actualizarTareaArchivo(TareaArchivo tarea);
    
}
