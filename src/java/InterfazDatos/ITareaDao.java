package InterfazDatos;

import ClasesDTO.Tarea;
import java.util.ArrayList;


public interface ITareaDao{
    
    public int crearTarea(Tarea t, int idUsuario);
    
    public ArrayList<Tarea>  listarTareas();
    
    public boolean eliminarTarea(Tarea t);
    
    public boolean actualizarTarea(Tarea t, int idEstudiante);
    
    public boolean cambiarTarea(Tarea t);
    
}
