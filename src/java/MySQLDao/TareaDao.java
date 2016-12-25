package MySQLDao;

import ClasesDTO.Tarea;
import InterfazDatos.ITareaDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TareaDao implements Serializable, ITareaDao {

    private Conexion conexion;

    public TareaDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public int crearTarea(Tarea t, int idUsuario) {
        String consulta = "INSERT INTO Tarea (nombre,idUsuario, asunto) VALUES (?,?,?)";
        String consulta2 = "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '"+this.conexion.getSchema()+"' AND TABLE_NAME  = 'Tarea'";
        int n = 0;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, t.getDescripcion());
            pst.setInt(2, idUsuario);
            pst.setString(3, t.getAsunto());
            pst.execute();
            PreparedStatement pst2 = this.conexion.getConexion().prepareStatement(consulta2);
            ResultSet rs2 = pst2.executeQuery();
            if(rs2.next()){
                n = rs2.getInt(1);
            }
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    @Override
    public ArrayList<Tarea> listarTareas() {
        ArrayList<Tarea> tareas = new ArrayList<Tarea>();
        String consulta = "SELECT * FROM Tarea";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                tareas.add(new Tarea(rs.getInt("id"), rs.getString("nombre"), rs.getString("asunto")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tareas;
    }

    @Override
    public boolean eliminarTarea(Tarea t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarTarea(Tarea t, int idEstudiante) {
        return false;
    }

    @Override
    public boolean cambiarTarea(Tarea t) {
        boolean b = true;
        String consulta = "UPDATE Tarea "
                + "SET nombre=?, asunto=? "
                + "WHERE id=?";
        try {
            PreparedStatement pst= this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, t.getDescripcion());
            pst.setString(2, t.getAsunto());
            pst.setInt(3, t.getId());
            b= pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return b;
    }

}
