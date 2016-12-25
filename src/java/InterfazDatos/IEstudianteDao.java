package InterfazDatos;

import ClasesDTO.Estudiante;
import java.util.ArrayList;

public interface IEstudianteDao {

    public boolean registrarEstudiante(int id, int grupo);

    public ArrayList<Estudiante> listarEstudiantesGrupo(int g);

    public ArrayList<Estudiante> listarEstudiantesCurso(char g, int c);

    public boolean asignarCurso(int codEst, int grupo, char curso);

    public boolean quitarEstudiante(int codEst);
    
    public boolean eliminarEstudiante(int idUsuario);

    public ArrayList<Estudiante> listarEstudiantesGrupo2(int g);

    public ArrayList<Estudiante> listarEstudianteGrupo();

    public boolean actualizarGrupo(int grupo, int estudiante);

    public Estudiante getDtoEstudiantes(int idEst);

    public ArrayList<Estudiante> listarEstudianteSinFoto(int curso, char grupo);
    

}
