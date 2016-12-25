package MySQLDao;

import ClasesDTO.Pagina;
import InterfazDatos.IPaginaDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PaginaDao implements Serializable, IPaginaDao {

    private Conexion conexion;

    public PaginaDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public boolean registrarPagina(Pagina p) {
        boolean b = true;
        String consulta = "INSERT INTO Permisos (nombre, descripcion,idCarpeta) values (?,?,?)";
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, p.getNombre());
            stmt.setString(2, p.getDescripcion());
            stmt.setInt(3, p.getCarpeta());
            b = stmt.execute();
            stmt.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean elimingarPagina(Pagina p) {
        String consulta = "DELETE FROM Permisos WHERE id=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, p.getCodigo());
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean actualizarPagina(Pagina p) {
        String consulta = "UPDATE Permisos SET nombre = ?, descripcion=?  WHERE id = ?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, p.getNombre());
            pst.setString(2, p.getDescripcion());
            pst.setLong(3, p.getCodigo());
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean actualizarPaginaCarpeta(int carpeta, int idPagina) {
        String consulta = "UPDATE Permisos SET idCarpeta = ? WHERE id = ?";
        boolean b = true;
        try {
            this.conexion = new Conexion();
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, carpeta);
            pst.setInt(2, idPagina);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public ArrayList<Pagina> listarPaginas() {

        ArrayList<Pagina> paginas = new ArrayList<Pagina>();
        String consulta = "SELECT * FROM Permisos";
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                paginas.add(new Pagina(rs.getInt("id"), rs.getString("nombre"), rs.getString("descripcion"), rs.getInt("idCarpeta")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return paginas;
    }

    @Override
    public ArrayList<Pagina> listarPaginasCarpeta(int carpeta) {

        ArrayList<Pagina> paginas = new ArrayList<Pagina>();
        String consulta = "SELECT * FROM Permisos where idCarpeta=?";
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, carpeta);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                paginas.add(new Pagina(rs.getInt("id"), rs.getString("nombre"), rs.getString("descripcion"), rs.getInt("idCarpeta")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return paginas;
    }

}
