package MySQLDao;

import ClasesDTO.*;
import InterfazDatos.IUsuarioDao;
import Util.*;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsuarioDao implements Serializable, IUsuarioDao {

    private Conexion conexion;

    public UsuarioDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public int registrarUsuario(TipoDocumento tipoDoc, String numDoc,
            String correo, Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps, String nombres,
            String apellidos, String telefono, String ciudadNacimiento, String departamentoNacimiento,
            String paisNacimiento, String paisActual, String usuario, String contra, int tipoU) {

        String pass = Encriptador.encriptar(contra);

        String consulta = "INSERT INTO Usuario (idTipoDocumento ,idTipoUsuario "
                + ",numDoc ,correo ,fechaNacimiento ,foto ,tipoSangre ,ciudadActual ,departamentoActual,"
                + "genero ,eps ,nombres ,apellidos,telefono,ciudadNacimiento ,"
                + "departamentoNacimiento ,paisNacimiento ,paisActual, nombreUsuario, contra)"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        String consulta3 = "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '" + this.conexion.getSchema() + "' AND TABLE_NAME  = 'Usuario'";

        try {
            PreparedStatement state = this.conexion.getConexion().prepareStatement(consulta3);
            ResultSet rs1 = state.executeQuery();

            long id = 0;

            while (rs1.next()) {
                id = rs1.getLong(1);
            }
            this.conexion.getConexion().setAutoCommit(false);
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, tipoDoc.getIdTipoDoc());
            stmt.setInt(2, tipoU);
            stmt.setString(3, numDoc);
            stmt.setString(4, correo);
            if (fechaNacimiento != null) {
                stmt.setDate(5, new java.sql.Date(fechaNacimiento.getTime()));
            } else {
                stmt.setDate(5, null);
            }
            stmt.setString(6, "No disponible");
            stmt.setString(7, tipoSangre);
            stmt.setString(8, ciudadActual);
            stmt.setString(9, departamentoActual);
            stmt.setString(10, genero);
            stmt.setString(11, eps);
            stmt.setString(12, nombres);
            stmt.setString(13, apellidos);
            stmt.setString(14, telefono);
            stmt.setString(15, ciudadNacimiento);
            stmt.setString(16, departamentoNacimiento);
            stmt.setString(17, paisNacimiento);
            stmt.setString(18, paisActual);
            stmt.setString(19, usuario);
            stmt.setString(20, pass);
            boolean rs = stmt.execute();

            stmt.close();
            state.close();
            this.conexion.close();
            if (id != 0 && !rs) {
                return (int) id;
            }
        } catch (SQLException ex) {
            if (this.conexion.getConexion() != null) {
                try {
                    System.err.println("Transacción Cancelada, Revirtiendo Cambios");
                    this.conexion.getConexion().rollback();
                } catch (SQLException e) {
                    System.err.println("Error al Momento de Revertir");
                    e.printStackTrace();
                }
                ex.printStackTrace();
            }
            return 0;
        }
        return 0;
    }

    @Override
    public boolean actualizarUsuario(TipoDocumento tipoDoc, String numDoc,
            String correo, Date fechaNacimiento, String tipoSangre,
            String ciudadActual, String departamentoActual, String genero,
            String eps, String nombres, String apellidos, String telefono,
            String ciudadNacimiento, String departamentoNacimiento,
            String paisNacimiento, String paisActual, int tipoU, int idUsuario) {

        String consulta = "update Usuario set idTipoDocumento=? ,idTipoUsuario=? "
                + ",numDoc =?,correo =?,fechaNacimiento =?,foto =?,tipoSangre =?,ciudadActual =?,departamentoActual=?,"
                + "genero =?,eps =?,nombres =?,apellidos=?,telefono=?,ciudadNacimiento =?,"
                + "departamentoNacimiento =?,paisNacimiento =?,paisActual=? where idUsuario=?";
        boolean b = true;

        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, tipoDoc.getIdTipoDoc());
            stmt.setInt(2, tipoU);
            stmt.setString(3, numDoc);
            stmt.setString(4, correo);
            if (fechaNacimiento != null) {
                stmt.setDate(5, new java.sql.Date(fechaNacimiento.getTime()));
            } else {
                stmt.setDate(5, null);
            }
            stmt.setString(6, "No disponible");
            stmt.setString(7, tipoSangre);
            stmt.setString(8, ciudadActual);
            stmt.setString(9, departamentoActual);
            stmt.setString(10, genero);
            stmt.setString(11, eps);
            stmt.setString(12, nombres);
            stmt.setString(13, apellidos);
            stmt.setString(14, telefono);
            stmt.setString(15, ciudadNacimiento);
            stmt.setString(16, departamentoNacimiento);
            stmt.setString(17, paisNacimiento);
            stmt.setString(18, paisActual);
            stmt.setInt(19, idUsuario);

            b = stmt.execute();
            stmt.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean eliminarUsuario(int idUsuario) {
        String consulta = "DELETE FROM Usuario WHERE idUsuario=?";
        try {
            this.conexion = new Conexion();
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, idUsuario);
            boolean b = stmt.execute();
            stmt.close();
            this.conexion.close();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public ArrayList<Estudiante> listarEstudiantes() throws SQLException {

        ArrayList<Estudiante> estudiantes = new ArrayList<Estudiante>();
        int grupo = 0;
        String codigo;
        String curso;
        char letra;
        String consulta2 = "SELECT * FROM Usuario, Estudiante WHERE"
                + " Usuario.idUsuario=Estudiante.idUsuario";
        PreparedStatement stmt2 = this.conexion.getConexion().prepareStatement(consulta2);
        ResultSet rs2 = stmt2.executeQuery();
        while (rs2.next()) {
            letra = 0;
            grupo = rs2.getInt("idCurso");
            curso = rs2.getString("idGrupo");
            codigo = rs2.getString("codigo");
            if (curso != null) {
                letra = curso.charAt(0);
            }
            estudiantes.add(new Estudiante(rs2.getInt("idUsuario"), obtenerTipoDoc(rs2.getInt("idTipoDocumento")),
                    rs2.getString("numDoc"),
                    rs2.getString("correo"), rs2.getDate("fechaNacimiento"),
                    rs2.getString("tipoSangre"), rs2.getString("ciudadActual"),
                    rs2.getString("departamentoActual"), rs2.getString("genero"),
                    rs2.getString("eps"), rs2.getString("nombres"), rs2.getString("apellidos"),
                    rs2.getString("telefono"), rs2.getString("ciudadNacimiento"),
                    rs2.getString("departamentoNacimiento"), rs2.getString("paisNacimiento"),
                    rs2.getString("paisActual"), rs2.getString("nombreUsuario"),
                    grupo, letra, codigo));
        }

        return estudiantes;
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

    @Override
    public Usuario validarInicio(String nombre, String contra) {
        Usuario usuario = null;
        try {
            String consulta = "SELECT * FROM Usuario WHERE nombreUsuario=? AND contra=?";
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, nombre);
            String contra2 = Encriptador.encriptar(contra);
            stmt.setString(2, contra2);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                usuario = new Usuario(rs.getInt("idUsuario"), obtenerTipoDoc(rs.getInt("idTipoDocumento")),
                        rs.getString("numDoc"),
                        rs.getString("correo"), rs.getDate("fechaNacimiento"),
                        rs.getString("tipoSangre"), rs.getString("ciudadActual"),
                        rs.getString("departamentoActual"), rs.getString("genero"),
                        rs.getString("eps"), rs.getString("nombres"), rs.getString("apellidos"),
                        rs.getString("telefono"), rs.getString("ciudadNacimiento"),
                        rs.getString("departamentoNacimiento"), rs.getString("paisNacimiento"),
                        rs.getString("paisActual"), rs.getString("nombreUsuario"));
                usuario.setIdTipoUsuario(rs.getInt("idTipoUsuario"));
            }
            stmt.close();
            this.conexion.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    @Override
    public Usuario DatosUsuario(int idUsuario) {
        Usuario usuario = null;
        try {
            String consulta = "SELECT * FROM Usuario WHERE idUsuario=? ";
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                usuario = new Usuario(rs.getInt("idUsuario"), obtenerTipoDoc(rs.getInt("idTipoDocumento")),
                        rs.getString("numDoc"),
                        rs.getString("correo"), rs.getDate("fechaNacimiento"),
                        rs.getString("tipoSangre"), rs.getString("ciudadActual"),
                        rs.getString("departamentoActual"), rs.getString("genero"),
                        rs.getString("eps"), rs.getString("nombres"), rs.getString("apellidos"),
                        rs.getString("telefono"), rs.getString("ciudadNacimiento"),
                        rs.getString("departamentoNacimiento"), rs.getString("paisNacimiento"),
                        rs.getString("paisActual"), rs.getString("nombreUsuario"));
                usuario.setIdTipoUsuario(rs.getInt("idTipoUsuario"));
            }
            stmt.close();
            this.conexion.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    @Override
    public boolean cambiarContra(long idUsuario, String contra) {
        String contra2 = Encriptador.encriptar(contra);

        String consulta = "UPDATE Usuario SET contra = ? WHERE idUsuario = ?";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, contra2);
            pst.setLong(2, idUsuario);
            pst.close();
            this.conexion.close();
            return pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    public ArrayList<Usuario> listarUsuarios() {
        String consulta = "SELECT u.idUsuario, u.nombres, u.apellidos, u.nombreUsuario "
                + "FROM Usuario u ";
        ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
        Usuario u;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                u = new Usuario();
                u.setNombres(rs.getString(2));
                u.setApellidos(rs.getString(3));
                u.setIdUsuario(rs.getInt(1));
                u.setUsuario(rs.getString(4));
                usuarios.add(u);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usuarios;
    }

    @Override
    public ArrayList<Usuario> listarUsuariosPorTipo(long idTipo) {
        String consulta = "SELECT u.idUsuario, u.nombres, u.apellidos, u.numDoc from Usuario u where idTipoUsuario= ?";
        ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
        Usuario u;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idTipo);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                u = new Usuario();
                u.setNombres(rs.getString(2));
                u.setApellidos(rs.getString(3));
                u.setNumDoc(rs.getString(4));
                u.setIdUsuario(rs.getInt(1));
                usuarios.add(u);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usuarios;
    }

    public boolean actualizarFoto(int idUsuario, String urlFoto) {
        boolean b = true;
        String consulta = "UPDATE Usuario "
                + "SET foto=? "
                + "WHERE idUsuario=?";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, urlFoto);
            pst.setLong(2, idUsuario);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return b;
    }

}
