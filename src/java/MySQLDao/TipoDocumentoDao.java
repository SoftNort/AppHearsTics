package MySQLDao;

import ClasesDTO.TipoDocumento;
import InterfazDatos.ITipoDocumentoDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TipoDocumentoDao implements ITipoDocumentoDao, Serializable {

    private Conexion conexion;
    
    public TipoDocumentoDao() throws SQLException{
        this.conexion = new Conexion();
    }
    
    @Override
    public ArrayList<TipoDocumento> cargarTiposDocumento() {
        ArrayList<TipoDocumento> tipos=new ArrayList<TipoDocumento>();
        String consulta= "SELECT * FROM TipoDocumento";
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                TipoDocumento t = new TipoDocumento(rs.getInt("idTipoDocumento"),rs.getString("nombre"));
                tipos.add(t);
            }
            rs.close();
            stmt.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
       
        return tipos;
    }
    @Override
    public boolean registrarDocumento(String nombre){
        String consulta = "INSERT INTO TipoDocumento (nombre) VALUES(?)";
        try{
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1,nombre);
            boolean rs = stmt.execute();
            stmt.close();
            this.conexion.close();
        }catch(SQLException ex){
            ex.printStackTrace();
            return false;
        }
        return false;
    }

    @Override
    public boolean eliminar(String doc) {
        String consulta = "DELETE FROM TipoDocumento where idTipoDocumento=?";
        
        boolean a;
        try{
            this.conexion=new Conexion();
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, Integer.parseInt(doc));
            a = stmt.execute();
            stmt.close();
            this.conexion.close();
            return a;            
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    
}
