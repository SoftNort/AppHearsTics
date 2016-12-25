package MySQLDao;

import ClasesDTO.Estudiante;
import ClasesDTO.Pin;
import ClasesDTO.TipoDocumento;
import ClasesDTO.Usuario;
import InterfazDatos.IPinDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PinDao implements Serializable, IPinDao {

    private PreparedStatement pst;
    private ResultSet rs;
    private Conexion conexion;

    public PinDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public boolean insertPin(String pin, int idUsuario, String fechaVencimiento) {
        boolean b = true;
        try {
            String consulta = "INSERT INTO Pin (idPin ,idUsuario, fechaFinal) VALUES(?,?,?)";
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, pin);
            pst.setInt(2, idUsuario);
            pst.setString(3, fechaVencimiento);

            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (Exception e) {
            System.err.print("Error" + e);
        }

        return b;
    }

    @Override
    public boolean updatePin(String pin, int idUsuario) {
        boolean b = true;
        try {
            String consulta = "Update  Pin set idPin=? where idUsuario=? ";
            pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, pin);
            pst.setInt(2, idUsuario);

            b = pst.execute();

        } catch (Exception e) {
            System.err.print("Error" + e);
        }
        return b;
    }

    @Override
    public boolean editarPin(String fechaInicio, String fechaFin, String idPin, String estado, int idEst ) {
        boolean b = true;
        try {
            String consulta = "Update Pin set fechaInicial=?, fechaFinal=?, idPin=?, estado=? where idUsuario=? ";
            pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, fechaInicio);
            pst.setString(2, fechaFin);
            pst.setString(3, idPin);
            pst.setString(4, estado);
            pst.setInt(5, idEst);

            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (Exception e) {
            System.err.print("Error" + e);
        }
        return b;
    }
    
    @Override
    public boolean actualizarEstadoPin(String estado, int idUsuario) {
        boolean b = true;
        try {
            String consulta = "Update  Pin set estado=? where idUsuario=? ";
            pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, estado);
            pst.setInt(2, idUsuario);

            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (Exception e) {
            System.err.print("Error" + e);
        }
        return b;
    }

    @Override
    public Pin getPinUsuario(int idUsuario) {
//        Pin pineIdUsuario = new Pin(idUsuario);
        Pin pineIdUsuario = null;
        int cur = 0;
        String codigo = "";
        String gru = "";
        char letraGrupo = 0;
        try {
            String consulta = "SELECT * FROM Pin, Usuario, Estudiante WHERE Pin.idUsuario = Usuario.idUsuario "
                    + "AND Estudiante.idUsuario=Usuario.IdUsuario AND Pin.idUsuario = ? ";
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, idUsuario);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                cur = rs.getInt("idCurso");
                gru = rs.getString("idGrupo");
                codigo = rs.getString("codigo");
                if (gru != null) {
                    letraGrupo = gru.charAt(0);
                } else {
                    letraGrupo = 0;
                }
                pineIdUsuario = new Pin(rs.getInt("idUsuario"), obtenerTipoDoc(rs.getInt("idTipoDocumento")),
                        rs.getString("numDoc"), rs.getString("correo"), 
                        rs.getDate("fechaNacimiento"), rs.getString("tipoSangre"), 
                        rs.getString("ciudadActual"), rs.getString("departamentoActual"), 
                        rs.getString("genero"), rs.getString("eps"), 
                        rs.getString("nombres"), rs.getString("apellidos"),
                        rs.getString("telefono"), rs.getString("ciudadNacimiento"),
                        rs.getString("departamentoNacimiento"), rs.getString("paisNacimiento"),
                        rs.getString("paisActual"), rs.getString("nombreUsuario"), 
                        cur, letraGrupo, codigo,
                        rs.getString("idPin"), rs.getString("fechaInicial"), 
                        rs.getString("fechaFinal"),  rs.getString("estado"));
            }
//            rs.close();
//            pst.close();
//            this.conexion.close();
            pst.close();
            this.conexion.close();
        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        return pineIdUsuario;

    }
    
    @Override
    public ArrayList<Pin> listarEstudiantesPinCurso(int curso){
        String consulta2;
        ArrayList<Pin> PinCurso = new ArrayList<Pin>();
        int cur = 0;
        String codigo, gru;
        char letraGrupo = 0;
        consulta2 = "SELECT * FROM Usuario, Estudiante, Pin WHERE " 
               +" Usuario.idUsuario=Estudiante.idUsuario AND " 
               +" Usuario.idUsuario=Pin.idUsuario " 
               +" AND Estudiante.idCurso=? AND Estudiante.idGrupo IS NULL AND Pin.estado = 'Inactivo'";
        PreparedStatement stmt2;
        try {
            stmt2 = this.conexion.getConexion().prepareStatement(consulta2);
            stmt2.setInt(1, curso);
            ResultSet rs2 = stmt2.executeQuery();
            while (rs2.next()) {
                cur = rs2.getInt("idCurso");
                gru = rs2.getString("idGrupo");
                codigo = rs2.getString("codigo");
                if (gru != null) {
                    letraGrupo = gru.charAt(0);
                } else {
                    letraGrupo = 0;
                }
                PinCurso.add(new Pin(rs2.getInt("idUsuario"), obtenerTipoDoc(rs2.getInt("idTipoDocumento")),
                        rs2.getString("numDoc"),
                        rs2.getString("correo"), rs2.getDate("fechaNacimiento"),
                        rs2.getString("tipoSangre"), rs2.getString("ciudadActual"),
                        rs2.getString("departamentoActual"), rs2.getString("genero"),
                        rs2.getString("eps"), rs2.getString("nombres"), rs2.getString("apellidos"),
                        rs2.getString("telefono"), rs2.getString("ciudadNacimiento"),
                        rs2.getString("departamentoNacimiento"), rs2.getString("paisNacimiento"),
                        rs2.getString("paisActual"), rs2.getString("nombreUsuario"),
                        cur, letraGrupo, codigo,
                        rs2.getString("idPin"), rs2.getString("fechaInicial"), 
                        rs2.getString("fechaFinal"),  rs2.getString("estado")));
            }
            return PinCurso;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    @Override
    public ArrayList<Pin> listarEstudiantesPinGrupo(int curso, char grupo){
        String consulta2;
        ArrayList<Pin> PinGrupoCurso = new ArrayList<Pin>();
        int cur = 0;
        String codigo,gru;
        char letraGrupo = 0;
        consulta2 = "SELECT * FROM Usuario, Estudiante, Pin WHERE "
                + "Usuario.idUsuario=Estudiante.idUsuario AND "
                + "Estudiante.idUsuario=Pin.idUsuario AND "
                + "Estudiante.idCurso=? AND Estudiante.idGrupo=? AND Pin.estado = 'Inactivo'";
        PreparedStatement stmt2;
        try {
            stmt2 = this.conexion.getConexion().prepareStatement(consulta2);
            stmt2.setInt(1, curso);
            stmt2.setString(2, String.valueOf(grupo));
            ResultSet rs2 = stmt2.executeQuery();
            while (rs2.next()) {
                cur = rs2.getInt("idCurso");
                gru = rs2.getString("idGrupo");
                codigo = rs2.getString("codigo");
                if (gru != null) {
                    letraGrupo = gru.charAt(0);
                } else {
                    letraGrupo = 0;
                }
                PinGrupoCurso.add(new Pin(rs2.getInt("idUsuario"), obtenerTipoDoc(rs2.getInt("idTipoDocumento")),
                        rs2.getString("numDoc"),
                        rs2.getString("correo"), rs2.getDate("fechaNacimiento"),
                        rs2.getString("tipoSangre"), rs2.getString("ciudadActual"),
                        rs2.getString("departamentoActual"), rs2.getString("genero"),
                        rs2.getString("eps"), rs2.getString("nombres"), rs2.getString("apellidos"),
                        rs2.getString("telefono"), rs2.getString("ciudadNacimiento"),
                        rs2.getString("departamentoNacimiento"), rs2.getString("paisNacimiento"),
                        rs2.getString("paisActual"), rs2.getString("nombreUsuario"),
                        cur, letraGrupo, codigo,
                        rs2.getString("idPin"), rs2.getString("fechaInicial"), 
                        rs2.getString("fechaFinal"),  rs2.getString("estado")));
            }
             return PinGrupoCurso;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
    @Override
    public boolean validarPin(String pin, int idUsuario) {
        boolean b = true;
        try {
            String consulta = "SELECT idPin, idUsuario FROM Pin WHERE idPin=? and idUsuario=?";
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, pin);
            pst.setInt(2, idUsuario);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                if (rs.getString("idPin").equals(pin) && rs.getInt("idUsuario") == idUsuario) {
                    b = false;
                }
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException e) {
            System.err.println("ERROR: " + e);
        }
        System.err.println("estoy en pinDao " + b);
        return b;
    }

    private TipoDocumento obtenerTipoDoc(int tipo) throws SQLException {
        TipoDocumentoDao tDao = new TipoDocumentoDao();
        ArrayList<TipoDocumento> tipos = tDao.cargarTiposDocumento();
        for (TipoDocumento t : tipos) {
            if (t.getIdTipoDoc() == tipo) {
                return t;
            }
        }
        return null;
    }

}
