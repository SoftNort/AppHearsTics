package ClasesDTO;

import java.io.Serializable;
import java.sql.Date;

public class Docente extends Usuario implements Serializable{

    public Docente(){}
    
    public Docente(int idUsuario, TipoDocumento tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps, String nombres,
            String apellidos, String telefono, String ciudadNacimiento,
            String departamentoNacimiento, String paisNacimiento, String paisActual,
            String usuario) {

        super(idUsuario, tipoDoc, numDoc, correo, fechaNacimiento, tipoSangre, ciudadActual,
                departamentoActual, genero, eps, nombres, apellidos, telefono,
                ciudadNacimiento, departamentoNacimiento, paisNacimiento, paisActual,
                usuario);
    }

}
