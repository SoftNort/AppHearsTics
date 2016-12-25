package MySQLDao;

import InterfazDatos.IArchivoNubeDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ArchivoNubeDao implements IArchivoNubeDao, Serializable{
    
    private Conexion conexion;
    
    public ArchivoNubeDao() throws SQLException{
        this.conexion = new Conexion();
    }

    @Override
    public boolean insertarArchivoNube(String url, int idMateria) {
       String consulta = "INSERT INTO ArchivoNube (url, idMateria) values(?,?)";
       boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, url);
            pst.setLong(2, idMateria);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public ArrayList<String> listarArchivosNube(int idMateria) {
        ArrayList<String> archivos =  new ArrayList<String>();
        String consulta = "SELECT url "
                + "FROM ArchivoNube "
                + "WHERE idMateria=?";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, idMateria);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                archivos.add(rs.getString(1));
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return archivos;
    }
}
