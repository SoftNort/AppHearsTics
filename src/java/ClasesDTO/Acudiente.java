package ClasesDTO;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Acudiente extends Usuario implements Serializable{
    
    private ArrayList<Estudiante> estudiantes;
    private String profesion;

    public Acudiente(int idUsuario, TipoDocumento tipoDoc, String numDoc, 
            String correo, Date fechaNacimiento, String tipoSangre, String ciudadActual, 
            String departamentoActual, String genero, String eps, String nombres, 
            String apellidos, String telefono, String ciudadNacimiento, String departamentoNacimiento, 
            String paisNacimiento, String paisActual, String usuario, String profesion) {
        
        super(idUsuario, tipoDoc, numDoc, correo, fechaNacimiento, tipoSangre, 
                ciudadActual, departamentoActual, genero, eps, nombres, apellidos, 
                telefono, ciudadNacimiento, departamentoNacimiento, paisNacimiento, 
                paisActual, usuario);
    }

    public Acudiente() {
    }

    public ArrayList<Estudiante> getEstudiantes() {
        return estudiantes;
    }

    public void setEstudiantes(ArrayList<Estudiante> estudiantes) {
        this.estudiantes = estudiantes;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }
}
