/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MySQLDao;

import ClasesDTO.ClasificadosLinksHtml;
import InterfazDatos.IClasificadosLinksHtmlDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class ClasificadosLinksHtmlDao implements IClasificadosLinksHtmlDao {

    private Conexion conexion;

    public ClasificadosLinksHtmlDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public ArrayList<ClasificadosLinksHtml> getClasificadosLinksLateral(String idClasificado) {
        ArrayList<ClasificadosLinksHtml> clasificados = new ArrayList<ClasificadosLinksHtml>();
        ClasificadosLinksHtml cla = null;
        String consulta = "select * from ClasificadosLinks where idClasificado = ? order by idClasificado";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, idClasificado);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                cla = new ClasificadosLinksHtml();
                cla.setIdClasificadoLink(rs.getString("idClasificadoLink"));
                cla.setIdClasificado(rs.getString("idClasificado"));
                cla.setNombreLink(rs.getString("nombreLink"));
                cla.setTituloLink(rs.getString("tituloLink"));
                cla.setHttpLink(rs.getString("httpLink"));
                clasificados.add(cla);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return clasificados;
    }

    @Override
    public boolean registrarLink(String idClasificado, String nombreLink, String tituloLink, String httpLink) {
        String consulta = "insert into ClasificadosLinks (idClasificado,  nombreLink, tituloLink, httpLink) values (?,?,?,?)";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, idClasificado);
            pst.setString(2, nombreLink);
            pst.setString(3, tituloLink);
            pst.setString(4, httpLink);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean eliminarClasificadopadreLink(String idClasificado) {
        String consulta = "Delete from ClasificadosLinks  where idClasificado=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, idClasificado);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean eliminarClasificadohijoLink(String idClasificado) {
        String consulta = "Delete from ClasificadosLinks  where idClasificadoLink=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, idClasificado);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarNombreLink(String idClasificado, String nombreLink) {
        String consulta = "update ClasificadosLinks set nombreLink =?  where idClasificadoLink=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, nombreLink);
            pst.setString(2, idClasificado);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarTituloLink(String idClasificado, String tituloLink) {
        String consulta = "update ClasificadosLinks set tituloLink =?  where idClasificadoLink=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, tituloLink);
            pst.setString(2, idClasificado);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarHttpLink(String idClasificado, String httpLink) {
        String consulta = "\"update ClasificadosLinks set httpLink =? where idClasificadoLink=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, httpLink);
            pst.setString(2, idClasificado);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;

    }

}
