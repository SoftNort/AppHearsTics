/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MySQLDao;

import ClasesDTO.PaginasHtml;
import InterfazDatos.IPaginasHtmlDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class PaginasHtmlDao implements IPaginasHtmlDao {

    private Conexion conexion;

    public PaginasHtmlDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public ArrayList<PaginasHtml> getPaginaXurl(String url) {
        ArrayList<PaginasHtml> paginas = new ArrayList<PaginasHtml>();
        PaginasHtml pag = null;
        String consulta = "select * from Paginas join NavCabeceraLi on Paginas.idLi = NavCabeceraLi.idLi "
                + "where NavCabeceraLi.url = ?";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, url);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pag = new PaginasHtml();
                pag.setIdPagina(rs.getString("idPagina"));
                pag.setIdLiPagina(rs.getString("idLi"));
                pag.setTitulo(rs.getString("titulo"));
                pag.setContenido(rs.getString("contenido"));
                pag.setImagen(rs.getString("imagen"));
                paginas.add(pag);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return paginas;
    }

    @Override
    public String[] getPaginaXidLi(String idLi) {
        String[] datos = new String[4];
        String consulta = "select idPagina, titulo, contenido, imagen "
                + "from Paginas where idLi = ?";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, idLi);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                datos[0] = rs.getString("idPagina");
                datos[1] = rs.getString("titulo");
                datos[2] = rs.getString("contenido");
                datos[3] = rs.getString("imagen");
            }
            rs.close();
            pst.close();
            this.conexion.close();
            return datos;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean registrarPagina(String idLi, String titulo, String contenido, String imagen) {
        String consulta = "insert into Paginas (idLi, titulo, contenido, imagen) values (?,?,?,?)";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, idLi);
            pst.setString(2, titulo);
            pst.setString(3, contenido);
            pst.setString(4, imagen);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarPagina(String idLi, String titulo, String contenido, String imagen) {
        String consulta = "update Paginas set titulo = ?, contenido = ?, imagen= ? where idLi =?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(4, idLi);
            pst.setString(1, titulo);
            pst.setString(2, contenido);
            pst.setString(3, imagen);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

}
