package ClasesDTO;

import java.io.Serializable;
import java.sql.Date;

public class Pin extends Usuario implements Serializable{
    
    private int curso;
    private char grupo;
    private String codigo;
    private String idPin;
    private String inicio;
    private String fin;
    private String estado;
   
    public Pin(int idUsuario, TipoDocumento tipoDoc, String numDoc, String correo, 
            Date fechaNacimiento, String tipoSangre, String ciudadActual, 
            String departamentoActual, String genero, String eps, String nombres, 
            String apellidos, String telefono, String ciudadNacimiento, 
            String departamentoNacimiento, String paisNacimiento, String paisActual, 
            String usuario, int curso, char grupo, String codigo, String idpin,
            String inicio, String fin, String estado) {
        
        super(idUsuario, tipoDoc, numDoc, correo, fechaNacimiento, tipoSangre, ciudadActual, 
                departamentoActual, genero, eps, nombres, apellidos, telefono, 
                ciudadNacimiento, departamentoNacimiento, paisNacimiento, paisActual, 
                usuario);
        this.grupo=grupo;
        this.curso=curso;
        this.codigo=codigo;
        this.idPin=idpin;
        this.inicio=inicio;
        this.fin=fin;
        this.estado=estado;
    }
    public Pin() {
    }
    
    public Pin(int idUsuario) {
        super(idUsuario);
    }   

    public int getCurso() {
        return curso;
    }

    public void setCurso(int curso) {
        this.curso = curso;
    }

    public char getGrupo() {
        return grupo;
    }

    public void setGrupo(char grupo) {
        this.grupo = grupo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getIdPin() {
        return idPin;
    }

    public void setIdPin(String idPin) {
        this.idPin = idPin;
    }

    public String getInicio() {
        return inicio;
    }

    public void setInicio(String inicio) {
        this.inicio = inicio;
    }

    public String getFin() {
        return fin;
    }

    public void setFin(String fin) {
        this.fin = fin;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

       
}
