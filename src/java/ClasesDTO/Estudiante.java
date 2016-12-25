package ClasesDTO;

import java.io.Serializable;
import java.sql.Date;

public class Estudiante extends Usuario implements Serializable{

    private int grupo;
    private char curso;
    private String codigo;
    private Curso dtocurso;
    
    public Estudiante(int idUsuario, TipoDocumento tipoDoc, String numDoc, String correo, 
            Date fechaNacimiento, String tipoSangre, String ciudadActual, 
            String departamentoActual, String genero, String eps, String nombres, 
            String apellidos, String telefono, String ciudadNacimiento, 
            String departamentoNacimiento, String paisNacimiento, String paisActual, 
            String usuario, int grupo, char curso, String codigo) {
        
        super(idUsuario, tipoDoc, numDoc, correo, fechaNacimiento, tipoSangre, ciudadActual, 
                departamentoActual, genero, eps, nombres, apellidos, telefono, 
                ciudadNacimiento, departamentoNacimiento, paisNacimiento, paisActual, 
                usuario);
        this.grupo=grupo;
        this.curso=curso;
        this.codigo=codigo;
    }
    
    public Estudiante(int idUsuario, TipoDocumento tipoDoc, String numDoc, String correo, 
            Date fechaNacimiento, String tipoSangre, String ciudadActual, 
            String departamentoActual, String genero, String eps, String nombres, 
            String apellidos, String telefono, String ciudadNacimiento, 
            String departamentoNacimiento, String paisNacimiento, String paisActual, 
            String usuario, Curso dtocurso, char curso, String codigo) {
        
        super(idUsuario, tipoDoc, numDoc, correo, fechaNacimiento, tipoSangre, ciudadActual, 
                departamentoActual, genero, eps, nombres, apellidos, telefono, 
                ciudadNacimiento, departamentoNacimiento, paisNacimiento, paisActual, 
                usuario);
        this.dtocurso=dtocurso;
        this.curso=curso;
        this.codigo=codigo;
    }

    public Estudiante(int idUsuario) {
        super(idUsuario);
    }

    public Estudiante() {
    }

    public int getGrupo() {
        return grupo;
    }

    public void setGrupo(int grupo) {
        this.grupo = grupo;
    }

    public char getCurso() {
        return curso;
    }

    public void setCurso(char curso) {
        this.curso = curso;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Curso getDtocurso() {
        return dtocurso;
    }

    public void setDtocurso(Curso dtocurso) {
        this.dtocurso = dtocurso;
    }
    
    
}
