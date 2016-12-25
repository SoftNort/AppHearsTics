/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MySQLDao;

import ClasesDTO.PublicidadHtml;
import InterfazDatos.IPublicidadHtmlDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class PublicidadHtmlDao implements IPublicidadHtmlDao {

    private Conexion conexion;

    public PublicidadHtmlDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public ArrayList<PublicidadHtml> getDatosPublicidades(String slider) {
        ArrayList<PublicidadHtml> publicidad = new ArrayList<PublicidadHtml>();
        PublicidadHtml publi = null;
        String consulta = "Select * from Publicidad where slider =? ";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, slider);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                publi = new PublicidadHtml();
                publi.setIdPublicidad(rs.getString("idImg"));
                publi.setSlider(rs.getString("slider"));
                publi.setLink(rs.getString("link"));
                publi.setImg(rs.getString("img"));
                publi.setTitulo(rs.getString("titulo"));

                publicidad.add(publi);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return publicidad;
    }

    @Override
    public boolean registrarPublicidad(String slider, String link, String img, String titulo) {
        String consulta = "insert into Publicidad (slider, link, img, titulo) values (?,?,?,?)";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, slider);
            pst.setString(2, link);
            pst.setString(3, img);
            pst.setString(4, titulo);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean eliminarPublicidad(String idPubl) {
        String consulta = "Delete from Publicidad where idImg =?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, idPubl);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarLinkPublicidad(String idPubli, String link) {
        String consulta = "Update Publicidad set link= ? where idImg=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, idPubli);
            pst.setString(1, link);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarImgPublicidad(String idPubli, String img) {
        String consulta = "Update Publicidad set img= ? where idImg=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, idPubli);
            pst.setString(1, img);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarTituloPublicidad(String idPubli, String titulo) {
        String consulta = "Update Publicidad set titulo= ? where idImg=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, idPubli);
            pst.setString(1, titulo);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

}
