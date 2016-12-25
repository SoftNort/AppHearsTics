package MySQLDao;

import ClasesDTO.Tarea;
import ClasesDTO.TareaArchivo;
import InterfazDatos.ITareaArchivoDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TareaArchivoDao implements Serializable, ITareaArchivoDao{
    
    private Conexion conexion;
    
    public TareaArchivoDao() throws SQLException{
        this.conexion = new Conexion();
    }

    @Override
    public boolean insertarTareaArchivo(TareaArchivo tarea) {
        String consulta = "INSERT INTO Archivo(url, idTarea) VALUES (?,?)";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, tarea.getArchivoUrl());
            pst.setInt(2, tarea.getId());
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public ArrayList<TareaArchivo> listarTareaArchivos(Tarea tarea) {

        String consulta = "SELECT * FROM Archivo WHERE idTarea = ?";
        ArrayList<TareaArchivo> tar = new ArrayList<TareaArchivo>();
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, tarea.getId());
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                tar.add(new TareaArchivo(tarea ,rs.getString("url"),rs.getInt("id")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tar;
        
    }

    @Override
    public boolean eliminarTareaArchivo(TareaArchivo tarea) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarTareaArchivo(TareaArchivo tarea) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
