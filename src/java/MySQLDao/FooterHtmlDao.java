/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MySQLDao;

import ClasesDTO.ClasificadosHtml;
import ClasesDTO.FooterHtml;
import InterfazDatos.IFooterHtmlDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class FooterHtmlDao implements IFooterHtmlDao {

    private Conexion conexion;

    public FooterHtmlDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public ArrayList<FooterHtml> getFooter(String titulo) {
        ArrayList<FooterHtml> footer = new ArrayList<FooterHtml>();
        FooterHtml pie = null;
        String consulta = "select * from Footer where titulo =?";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, titulo);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pie = new FooterHtml();
                pie.setId(rs.getString("idFooter"));
                pie.setTitulo(rs.getString("titulo"));
                pie.setSubtitulo(rs.getString("subtitulo"));
                pie.setValor(rs.getString("valor"));
                pie.setUrl(rs.getString("url"));
                footer.add(pie);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return footer;
    }

    @Override
    public boolean editarFooterValor(String id, String valor) {
        String consulta = "Update Footer set valor=? where idFooter=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, id);
            pst.setString(1, valor);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarFooterSubtitulo(String id, String subtitulo) {
        String consulta = "Update Footer set subtitulo=? where idFooter=";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, id);
            pst.setString(1, subtitulo);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarFooterUrl(String id, String url) {
        String consulta = "Update Footer set url=? where idFooter=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, id);
            pst.setString(1, url);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

}
