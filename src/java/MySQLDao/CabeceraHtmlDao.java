/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MySQLDao;

import ClasesDTO.CabeceraHtml;
import InterfazDatos.ICabeceraHtmlDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class CabeceraHtmlDao implements ICabeceraHtmlDao {

    private Conexion conexion;

    public CabeceraHtmlDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public ArrayList<CabeceraHtml> getCabeceraTitulo() {
        ArrayList<CabeceraHtml> cabecera = new ArrayList<CabeceraHtml>();
        CabeceraHtml cabec = null;
        String consulta = "select * from NavCabecera ";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                cabec = new CabeceraHtml();
                cabec.setIdNav(rs.getString("idNav")); 
                cabec.setTitulo(rs.getString("titulo")); 
                cabec.setUrl(rs.getString("url")); 
                cabecera.add(cabec);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return cabecera;
    }

    @Override
    public ArrayList<CabeceraHtml> getCabeceraLi(String id) {
        ArrayList<CabeceraHtml> cabecera = new ArrayList<CabeceraHtml>();
        CabeceraHtml cabec = null;
        String consulta = "select * from NavCabeceraLi join NavCabecera on NavCabecera.idNav= NavCabeceraLi.idNav "
                + "where NavCabecera.idNav= ? order by NavCabeceraLi.posicion";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                cabec = new CabeceraHtml(rs.getString("NavCabeceraLi.idNav"), rs.getString("NavCabeceraLi.idLi"),
                        rs.getString("NavCabeceraLi.posicion"), rs.getString("NavCabecera.titulo"),
                        rs.getString("NavCabeceraLi.nombre"), rs.getString("NavCabeceraLi.url"));
                cabecera.add(cabec);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return cabecera;
    }

    @Override
    public CabeceraHtml getLiXid(String idLi) {
        CabeceraHtml cabecera = null;
        try {
            String consulta = "select NavCabeceraLi.idLi, NavCabeceraLi.nombre,NavCabecera.titulo "
                + "from NavCabeceraLi join NavCabecera on NavCabecera.idNav = NavCabeceraLi.idNav "
                + "where  NavCabeceraLi.idLi = ?";
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, idLi);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                cabecera = new CabeceraHtml();
                cabecera.setIdLi(rs.getString("NavCabeceraLi.idLi"));
                cabecera.setNombre(rs.getString("NavCabeceraLi.nombre"));
                cabecera.setTitulo(rs.getString("NavCabecera.titulo"));
            }
            stmt.close();
            this.conexion.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cabecera;
    }

    @Override
    public boolean insertarLi(String idNav, String posicion, String nombre, String url) {
        String consulta = "INSERT INTO NavCabeceraLi (idNav ,posicion, nombre ,url) VALUES(?,?,?,?)";
        boolean exito;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, idNav);
            stmt.setString(2, posicion);
            stmt.setString(3, nombre);
            stmt.setString(4, url);
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
    public boolean eliminarLi(String idLi) {
        String consulta = "Delete from NavCabeceraLi  where idLi=?";
        boolean exito;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, idLi);
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
    public boolean editarLiPosicion(String idLi, String posicion) {
        String consulta = "Update NavCabeceraLi set posicion =? where idLi=?";
        boolean exito;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(2, idLi);
            stmt.setString(1, posicion);
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
    public boolean editarLiNombre(String idLi, String nombre) {
        String consulta = "Update NavCabeceraLi set nombre =? where idLi=?";
        boolean exito;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(2, idLi);
            stmt.setString(1, nombre);
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
    public boolean editarLiUrl(String idLi, String url) {
        String consulta = "Update NavCabeceraLi set url =? where idLi=?";
        boolean exito;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(2, idLi);
            stmt.setString(1, url);
            exito = stmt.execute();
            stmt.close();
            this.conexion.close();
            return exito;
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

}
