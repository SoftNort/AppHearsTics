package MySQLDao;

import ClasesDTO.ArchivoRespuesta;
import ClasesDTO.TareaRespuesta;
import InterfazDatos.ITareaRespuestaDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TareaRespuestaDao implements Serializable, ITareaRespuestaDao {

    private Conexion conexion;

    public TareaRespuestaDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public int insertarTareaRespuesta(TareaRespuesta tarea) {
        String consulta = "INSERT INTO TareaRespuesta (idTarea,idEstudiante,respuesta) VALUES(?,?,?)";
        String consulta2 = "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ufps_6' AND TABLE_NAME  = 'TareaRespuesta'";

        int b = 0;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            PreparedStatement pst2 = this.conexion.getConexion().prepareStatement(consulta2);
            pst.setLong(1, tarea.getTarea().getId());
            pst.setLong(2, tarea.getEstudiante().getIdUsuario());
            pst.setString(3, tarea.getRespuesta());
            if (pst.execute()) {
                ResultSet rs = pst2.executeQuery();
                if (rs.next()) {
                    b = rs.getInt(1);
                }
                rs.close();
            }

            pst2.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return b;
    }

    @Override
    public ArrayList<TareaRespuesta> listarTareaRespuesta(long idTarea) {
        ArrayList<TareaRespuesta> respuesta = new ArrayList<TareaRespuesta>();
        String consulta = "SELECT * FROM TareaRespuesta t, Usuario u WHERE "
                + "t.idTarea = ? AND t.idEstudiante = u.idUsuario";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idTarea);
        } catch (SQLException ex) {
            Logger.getLogger(TareaRespuestaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return respuesta;
    }

    @Override
    public boolean actualizarTareaRespuesta(TareaRespuesta tarea) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarTareaRespuesta(TareaRespuesta tarea) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<TareaRespuesta> litarRespuestasEstudiante(long idEstudiante) {
        ArrayList<TareaRespuesta> tareas = new ArrayList<TareaRespuesta>();
        String consulta = "SELECT * FROM";
        return tareas;

    }

    @Override
    public TareaRespuesta listarTareasEstudiante(long idEstudiante, long idTarea) {
        TareaRespuesta tarea = null;
        ArchivoRespuesta respuesta = null;

        String consulta = "SELECT idRespuesta, respuesta "
                + "FROM TareaRespuesta "
                + "WHERE idTarea= ? AND idEstudiante =? ";
        try {
            ArchivoRespuestaDao respuestaDao = new ArchivoRespuestaDao();
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idTarea);
            pst.setLong(2, idEstudiante);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                tarea = new TareaRespuesta(null, null, rs.getString(2), rs.getLong(1));
                respuesta = respuestaDao.obtenerArchivoRespuesta(tarea.getId());
                tarea.setArchivo(respuesta);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tarea;
    }

    @Override
    public boolean calificarTareasEstudiante(long idEstudiante, long idTarea, float calificacion) {
        String consulta = "UPDATE TareaEstudianteGrupo SET calificacion=? "
                + "WHERE idTarea=? AND idEstudiante=? AND estado=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setFloat(1, calificacion);
            pst.setLong(2, idTarea);
            pst.setLong(3, idEstudiante);
            pst.setString(4, "contestada");
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }
}
