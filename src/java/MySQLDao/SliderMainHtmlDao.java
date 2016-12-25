/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MySQLDao;

import ClasesDTO.SliderMainHtml;
import InterfazDatos.ISliderMainHtmlDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class SliderMainHtmlDao implements ISliderMainHtmlDao {

    private Conexion conexion;

    public SliderMainHtmlDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public ArrayList<SliderMainHtml> getSlider() {
        ArrayList<SliderMainHtml> slider = new ArrayList<SliderMainHtml>();
        SliderMainHtml sli = null;
        String consulta = "select * from SliderSuperior order by posicion";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                sli = new SliderMainHtml();
                sli.setIdSli(rs.getString("idSlider"));
                sli.setParraf1(rs.getString("parrafo1"));
                sli.setParraf2(rs.getString("parrafo2"));
                sli.setParraf3(rs.getString("parrafo3"));
                sli.setUrlLink(rs.getString("urlLink"));
                sli.setPosicion(rs.getString("posicion"));
                sli.setUrlImg(rs.getString("urlImg"));
                slider.add(sli);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return slider;
    }

    @Override
    public boolean registrarSlider(String posicion, String titulo, String descripcion, String link, String http, String imagen) {
        String consulta = "insert into SliderSuperior (posicion, parrafo1, parrafo2, parrafo3, urlLink, urlImg) values (?,?,?,?,?,?)";
        boolean b = true;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, posicion);
            stmt.setString(2, titulo);
            stmt.setString(3, descripcion);
            stmt.setString(4, link);
            stmt.setString(5, http);
            stmt.setString(6, imagen);
            b = stmt.execute();
            stmt.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean eliminarSlider(String idSlider) {
        String consulta = "delete from SliderSuperior where idSlider=?";
        boolean b = true;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, idSlider);
            b = stmt.execute();
            stmt.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarTexto1(String idSlider, String parrafo1) {
        String consulta = "Update SliderSuperior set parrafo1 =? where idSlider=?";
        boolean b = true;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(2, idSlider);
            stmt.setString(1, parrafo1);
            b = stmt.execute();
            stmt.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarTexto2(String idSlider, String parrafo2) {
        String consulta = "Update SliderSuperior set parrafo2 =? where idSlider=?";
        boolean b = true;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(2, idSlider);
            stmt.setString(1, parrafo2);
            b = stmt.execute();
            stmt.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarTexto3(String idSlider, String parrafo3) {
        String consulta = "Update SliderSuperior set parrafo3 =? where idSlider=?";
        boolean b = true;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(2, idSlider);
            stmt.setString(1, parrafo3);
            b = stmt.execute();
            stmt.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }
    
    @Override
    public boolean editarUrlLinkSlider(String idSlider, String urlLink) {
        String consulta = "update SliderSuperior set urlLink =? where idSlider=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, idSlider);
            pst.setString(1, urlLink);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarPosicionSlider(String idSlider, String posicion) {
        String consulta = "update SliderSuperior set posicion =? where idSlider=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, idSlider);
            pst.setString(1, posicion);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarImagenSlider(String idSlider, String imagen) {
        String consulta = "update SliderSuperior set urlImg =? where idSlider=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, idSlider);
            pst.setString(1, imagen);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

}
