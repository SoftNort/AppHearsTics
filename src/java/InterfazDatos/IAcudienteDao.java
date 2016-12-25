
package InterfazDatos;

import ClasesDTO.Acudiente;
import java.util.ArrayList;

public interface IAcudienteDao {
    
    public boolean registrarAcudiente(long a, String profesion);
    
    public Acudiente getDtoAcudiente(int idUsuario);
    
    public boolean asignarAcudiente(int idEstudiante, String user);
    
    public ArrayList<Acudiente> listarAcudientes();

    public boolean retirarEstudianteAcudiente(long idEstudiante, long idAcudiente);

    public boolean eliminarEstudianteAcudiente(long idEstudiante);
    
    public int consultarAsignaciones(String usuAcudiente);
    
    public boolean eliminarAcudienteEstudiante(String UsuAcudiente);

    public boolean eliminarAcudientes(int idAcudiente);
    
    public boolean actualizarProfesion(long idAcudiente, String profesion);
    
    public boolean cambiarAcudiente(long idAcudiente1, long idAcudiente2, long idEstudiante);
    
    public ArrayList<Acudiente> listarAcudientesEstudiante(int idEstudiante);

}
