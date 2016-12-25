package InterfazDatos;

import ClasesDTO.Estudiante;
import ClasesDTO.TipoDocumento;
import ClasesDTO.Usuario;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public interface IUsuarioDao {
    
    public int registrarUsuario(TipoDocumento tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps,
            String nombres, String apellidos, String telefono, String ciudadNacimiento,
            String departamentoNacimiento, String paisNacimiento, String paisActual,
            String usuario, String contra, int tipoU);
    
    public boolean actualizarUsuario(TipoDocumento tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps,
            String nombres, String apellidos, String telefono, String ciudadNacimiento,
            String departamentoNacimiento, String paisNacimiento, String paisActual, int tipoU, int idUsuario);
    
    public boolean eliminarUsuario(int idUsuario);
    
    public ArrayList<Estudiante> listarEstudiantes() throws SQLException;
    
    public Usuario validarInicio(String nombre, String contra);
    
    public Usuario DatosUsuario(int idUsuario);
    
    public boolean cambiarContra(long idUsuario, String contra);
    
    public ArrayList<Usuario> listarUsuarios();
    
    public ArrayList<Usuario> listarUsuariosPorTipo(long idTipo);
    
    public boolean actualizarFoto(int idUsuario, String urlFoto);
}