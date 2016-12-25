package MySQLDao;

import ClasesDTO.ArchivoRespuesta;
import InterfazDatos.IArchivoRespuestaDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ArchivoRespuestaDao implements Serializable, IArchivoRespuestaDao {

    private Conexion conexion;

    public ArchivoRespuestaDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public boolean insertaArchivoRespuesta(long idTareaRespuesta, String url) {
        String consulta = "INSERT INTO ArchivoRespuesta (idRespuesta,urlRespuesta) VALUES (?,?)";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idTareaRespuesta);
            pst.setString(2, url);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(ArchivoRespuestaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }

    @Override
    public ArchivoRespuesta obtenerArchivoRespuesta(long idTareaRespuesta) {
        ArchivoRespuesta respuestas = new ArchivoRespuesta(idTareaRespuesta);
        String consulta = "SELECT urlRespuesta FROM ArchivoRespuesta WHERE idRespuesta = ?";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idTareaRespuesta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                respuestas.insertarURL(rs.getString(1));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return respuestas;
    }

    @Override
    public boolean actualizarArchivoRespuesta() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarArchivoRespuesta() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArchivoRespuesta obtenerRespuestaEstudiante(long idEstudiante, long idTarea) {
        ArchivoRespuesta respuestas = new ArchivoRespuesta(idTarea);
        String consulta = "SELECT urlRespuesta FROM ArchivoRespuesta a, TareaRespuesta t WHERE idTarea = ? AND "
                + "t.idTarea = a.idTarea AND t.idEstudiante=?";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idTarea);
            pst.setLong(2, idEstudiante);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                respuestas.insertarURL(rs.getString(1));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return respuestas;
    }
}
