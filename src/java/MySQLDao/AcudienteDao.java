package MySQLDao;

import ClasesDTO.Acudiente;
import InterfazDatos.IAcudienteDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AcudienteDao implements IAcudienteDao, Serializable {

    private Conexion conexion;

    public AcudienteDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public boolean registrarAcudiente(long a, String profesion) {
        String consulta = "INSERT INTO Acudiente (idUsuario, profesion) values(?,?)";
        boolean exito;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setLong(1, a);
            stmt.setString(2, profesion);
            exito = stmt.execute();
            stmt.close();
            this.conexion.close();
            return exito;
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

    @Override
    public Acudiente getDtoAcudiente(int idUsuario) {
        Acudiente acud = null;
        String consulta = "SELECT * FROM Acudiente "
                + "WHERE idUsuario=?";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, idUsuario);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                acud = new Acudiente();
                acud.setProfesion(rs.getString(2));
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return acud;
    }

    @Override
    public boolean asignarAcudiente(int idEstudiante, String userAcudiente) {
        String consulta = "INSERT INTO AcudienteEstudiante (usuario, idEstudiante) values(?,?)";
        boolean exito;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, userAcudiente);
            stmt.setInt(2, idEstudiante);
            exito = stmt.execute();
            stmt.close();
            this.conexion.close();
            return exito;
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }

    }

    @Override
    public ArrayList<Acudiente> listarAcudientes() {
        ArrayList<Acudiente> acudientes = new ArrayList<Acudiente>();
        Acudiente ac = null;
        String consulta = "SELECT u.nombres, u.apellidos, u.idUsuario, a.profesion, u.numDoc, u.nombreUsuario "
                + "FROM Usuario u, Acudiente a "
                + "WHERE u.idUsuario=a.idUsuario";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                ac = new Acudiente();
                ac.setIdUsuario(rs.getInt(3));
                ac.setNombres(rs.getString(1));
                ac.setApellidos(rs.getString(2));
                ac.setProfesion(rs.getString(4));
                ac.setNumDoc(rs.getString(5));
                ac.setUsuario(rs.getString(6));
                acudientes.add(ac);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return acudientes;
    }

    @Override
    public boolean eliminarAcudientes(int idAcudiente) {
        String consulta = "DELETE FROM Acudiente WHERE idUsuario=?";
        try {
            this.conexion = new Conexion();
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, idAcudiente);
            boolean b = pst.execute();
            pst.close();
            this.conexion.close();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean actualizarProfesion(long idAcudiente, String profesion) {
        String consulta = "UPDATE Acudiente set profesion=? WHERE idUsuario=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, profesion);
            pst.setLong(2, idAcudiente);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return b;

    }

    @Override
    public boolean eliminarAcudienteEstudiante(String UsuAcudiente) {
        String consulta = "DELETE FROM AcudienteEstudiante WHERE usuario=?";
        boolean b = true;
        try {
            this.conexion = new Conexion();
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, UsuAcudiente);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean eliminarEstudianteAcudiente(long idEstudiante) {
        String consulta = "DELETE FROM AcudienteEstudiante WHERE idEstudiante=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idEstudiante);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public int consultarAsignaciones(String usuAcudiente) {
        String consulta = "Select usuario from AcudienteEstudiante where usuario = ?";
        int contador = 0;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, usuAcudiente);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                contador += 1;
            }
            pst.close();
            this.conexion.close();
            return contador;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }

    }

    @Override
    public boolean retirarEstudianteAcudiente(long idEstudiante, long idAcudiente
    ) {
        String consulta = "DELETE FROM AcudienteEstudiante WHERE usuario=? AND idEstudiante=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idAcudiente);
            pst.setLong(2, idEstudiante);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean cambiarAcudiente(long idAcudiente1, long idAcudiente2, long idEstudiante
    ) {
        String consulta = "UPDATE AcudienteEstudiante SET idUsuario=? "
                + "WHERE idUsuario=? AND idEstudiante=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idAcudiente1);
            pst.setLong(2, idAcudiente2);
            pst.setLong(3, idEstudiante);
            b = pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public ArrayList<Acudiente> listarAcudientesEstudiante(int idEstudiante
    ) {
        ArrayList<Acudiente> acudientes = new ArrayList<Acudiente>();
        String consulta = "SELECT u.nombres, u.apellidos, a.profesion, u.telefono "
                + "FROM Acudiente a, Estudiante e, AcudienteEstudiante x, Usuario u "
                + "WHERE a.idUsuario=u.idUsuario AND u.nombreUsuario=x.usuario AND "
                + "e.idUsuario=x.idEstudiante AND e.idUsuario=?";
        Acudiente a;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, idEstudiante);
            ResultSet rs = pst.executeQuery();
            System.out.println("Entro al metodo");
            while (rs.next()) {
                System.out.println("entro al while");
                a = new Acudiente();
                a.setNombres(rs.getString(1));
                a.setApellidos(rs.getString(2));
                a.setProfesion(rs.getString(3));
                a.setTelefono(rs.getString(4));
                acudientes.add(a);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return acudientes;
    }
}
