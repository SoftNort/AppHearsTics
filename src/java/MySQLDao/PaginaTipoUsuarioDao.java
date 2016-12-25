package MySQLDao;

import ClasesDTO.CarpetaPagina;
import ClasesDTO.Pagina;
import ClasesDTO.PaginaTipoUsuario;
import ClasesDTO.TipoUsuario;
import InterfazDatos.IPaginaTipoUsuario;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PaginaTipoUsuarioDao implements Serializable, IPaginaTipoUsuario {

    private Conexion conexion;

    public PaginaTipoUsuarioDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public boolean registrar(Pagina pagina, TipoUsuario tipo) {

        boolean b = true;
        String consulta = "INSERT INTO PermisosTipoUsuario "
                + "(idTipoUsuario, idPermiso) VALUES (?,?)";
        try {
            this.conexion = new Conexion();
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, tipo.getId());
            pst.setLong(2, pagina.getCodigo());
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }
    
    @Override
    public ArrayList<PaginaTipoUsuario> listarCarpetasTipoUsuario(int tipo){
        ArrayList<PaginaTipoUsuario> lista = new ArrayList<PaginaTipoUsuario>();
        String consulta = "SELECT c.*, u.id, u.rol "
                + "FROM Permisos p, PermisosTipoUsuario t, TipoUsuario u, CarpetasPermisos c "
                + "WHERE t.idTipoUsuario = ? AND p.id = t.idPermiso "
                + "AND c.idCarpeta = p.idCarpeta "
                + "AND u.id = t.idTipoUsuario group by p.idCarpeta ";
        try {

            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, tipo);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                CarpetaPagina carpeta = null;
                TipoUsuario tipoUser = null;
                PaginaTipoUsuario pag = new PaginaTipoUsuario();
                tipoUser = new TipoUsuario(rs.getLong(4), rs.getString(5));
                carpeta = new CarpetaPagina(rs.getInt(1), rs.getString(2), rs.getString(3));
                pag.setCarpeta(carpeta);
                pag.setTipo(tipoUser);
                lista.add(pag);
            }
            pst.close();
            rs.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    
    //Paginas agregadas a un rol
    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginasTipoUsuario(int tipo) {
        ArrayList<PaginaTipoUsuario> lista = new ArrayList<PaginaTipoUsuario>();
        String consulta = "SELECT p.id, p.nombre, p.descripcion, u.id, u.rol "
                + "FROM Permisos p, PermisosTipoUsuario t, TipoUsuario u "
                + "WHERE t.idTipoUsuario = ? AND p.id = t.idPermiso "
                + "AND u.id = t.idTipoUsuario ";
        try {

            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, tipo);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                TipoUsuario tipoUser = null;
                Pagina pagina = null;
                PaginaTipoUsuario pag = new PaginaTipoUsuario();
                pagina = new Pagina(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                tipoUser = new TipoUsuario(rs.getLong(4), rs.getString(5));
                pag.setPagina(pagina);
                pag.setTipo(tipoUser);
                lista.add(pag);
            }
            pst.close();
            rs.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    
    @Override 
    public ArrayList<PaginaTipoUsuario> listarPaginasSinCarpeta(int tipo) {
        ArrayList<PaginaTipoUsuario> lista = new ArrayList<PaginaTipoUsuario>();
        String consulta = "SELECT p.id, p.nombre, p.descripcion, u.id, u.rol "
                + "FROM Permisos p, PermisosTipoUsuario t, TipoUsuario u "
                + "WHERE t.idTipoUsuario = ? AND p.id = t.idPermiso "
                + "AND p.idCarpeta = 0 "
                + "AND u.id = t.idTipoUsuario";
        try {

            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, tipo);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                TipoUsuario tipoUser = null;
                Pagina pagina = null;
                PaginaTipoUsuario pag = new PaginaTipoUsuario();
                pagina = new Pagina(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                tipoUser = new TipoUsuario(rs.getLong(4), rs.getString(5));
                pag.setPagina(pagina);
                pag.setTipo(tipoUser);
                lista.add(pag);
            }
            pst.close();
            rs.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginasDiferentes(int idCarpeta) {
        ArrayList<PaginaTipoUsuario> lista = new ArrayList<PaginaTipoUsuario>();
        String consulta = "SELECT p.id, p.nombre, p.descripcion, p.idCarpeta FROM Permisos p WHERE p.idCarpeta <> ?";
        try {

            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idCarpeta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                PaginaTipoUsuario pag = new PaginaTipoUsuario();
                Pagina pagina = new Pagina(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                pag.setPagina(pagina);
                lista.add(pag);
            }
            pst.close();
            rs.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginasIguales(int idCarpeta) {
        ArrayList<PaginaTipoUsuario> lista = new ArrayList<PaginaTipoUsuario>();
        String consulta = "SELECT p.id, p.nombre, p.descripcion, p.idCarpeta FROM Permisos p WHERE p.idCarpeta = ?";
        try {

            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idCarpeta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                PaginaTipoUsuario pag = new PaginaTipoUsuario();
                Pagina pagina = new Pagina(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                pag.setPagina(pagina);
                lista.add(pag);
            }
            pst.close();
            rs.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    
    

    @Override
    public boolean eliminar(Pagina pagina, TipoUsuario tipo) {
        String consulta = "DELETE FROM PermisosTipoUsuario "
                + "WHERE idTipoUsuario=? AND idPermiso=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, tipo.getId());
            pst.setLong(2, pagina.getCodigo());
            b=pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginas(int tipo) {
        ArrayList<PaginaTipoUsuario> lista = new ArrayList<PaginaTipoUsuario>();
        String consulta = "SELECT * FROM Permisos WHERE Permisos.id NOT IN "
                + "(SELECT Permisos.id FROM PermisosTipoUsuario, TipoUsuario "
                + "WHERE PermisosTipoUsuario.idTipoUsuario = ? AND Permisos.id = PermisosTipoUsuario.idPermiso "
                + "AND TipoUsuario.id = PermisosTipoUsuario.idTipoUsuario)";
        try {

            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, tipo);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                TipoUsuario tipoUser = null;
                PaginaTipoUsuario pag = new PaginaTipoUsuario();
                Pagina pagina = new Pagina(rs.getInt(1), rs.getString(2), rs.getString(3));
                pag.setPagina(pagina);
                pag.setTipo(tipoUser);
                lista.add(pag);
            }
            pst.close();
            rs.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginasIdCarpeta(long tipo, int carpeta) {
        ArrayList<PaginaTipoUsuario> lista = new ArrayList<PaginaTipoUsuario>();
        String consulta = "SELECT p.id, p.nombre, p.descripcion, u.id, u.rol "
                + "FROM Permisos p, PermisosTipoUsuario t, TipoUsuario u "
                + "WHERE t.idTipoUsuario = ? AND p.id = t.idPermiso "
                + "AND p.idCarpeta = ? "
                + "AND u.id = t.idTipoUsuario ";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, tipo);
            pst.setInt(2, carpeta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                TipoUsuario tipoUser = null;
                Pagina pagina = null;
                PaginaTipoUsuario pag = new PaginaTipoUsuario();
                pagina = new Pagina(rs.getInt(1), rs.getString(2), rs.getString(3));
                tipoUser = new TipoUsuario(rs.getLong(4), rs.getString(5));
                pag.setPagina(pagina);
                pag.setTipo(tipoUser);
                lista.add(pag);
            }
            pst.close();
            rs.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }


}
