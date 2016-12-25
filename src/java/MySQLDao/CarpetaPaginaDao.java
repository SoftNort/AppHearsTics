
package MySQLDao;

import ClasesDTO.CarpetaPagina;
import InterfazDatos.ICarpetaPaginaDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarpetaPaginaDao implements Serializable, ICarpetaPaginaDao{
    
    private Conexion conexion;

    public CarpetaPaginaDao() throws SQLException{
        this.conexion = new Conexion();
    }

    @Override
    public boolean registrarCarpetaPagina(CarpetaPagina c) {
        String consulta = "INSERT INTO CarpetasPermisos (nombre, icono) values (?,?)";
        try{
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, c.getNombre());
            stmt.setString(2, c.getIcono());
            boolean b = stmt.execute();
            stmt.close();
            this.conexion.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean editarCarpetaPagina(int c, String nombre, String icono) {
            String consulta = "update CarpetasPermisos set nombre=?, icono=? where idCarpeta =?";
        try{
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, nombre);
            stmt.setString(2, icono);
            stmt.setInt(3, c);
            boolean b = stmt.execute();
            stmt.close();
            this.conexion.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean eliminarCarpetaPagina(int idCarpeta) {
        String consulta = "delete from CarpetasPermisos where idCarpeta =?";
        try{
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, idCarpeta);
            boolean b = stmt.execute();
            stmt.close();
            this.conexion.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    public ArrayList<CarpetaPagina> listarCarpetaPaginas() {
        ArrayList<CarpetaPagina> Carpetaspaginas = new ArrayList<CarpetaPagina>();
        String consulta = "SELECT * FROM CarpetasPermisos";
        try{
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Carpetaspaginas.add(new CarpetaPagina(rs.getInt("idCarpeta"), rs.getString("nombre"), rs.getString("icono")));
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return Carpetaspaginas;
    }
}
