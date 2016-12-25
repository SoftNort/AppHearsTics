/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MySQLDao;

import ClasesDTO.ClasificadosHtml;
import InterfazDatos.IClasificadosHtmlDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class ClasificadosHtmlDao implements IClasificadosHtmlDao {

    private Conexion conexion;

    public ClasificadosHtmlDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public ArrayList<ClasificadosHtml> getClasificadosLateral(String lateralidad) {
        ArrayList<ClasificadosHtml> clasificados = new ArrayList<ClasificadosHtml>();
        ClasificadosHtml cla = null;
        String consulta = "select * from Clasificados where lateralidad = ? order by idClasificado";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, lateralidad);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                cla = new ClasificadosHtml();
                cla.setIdClasificado(rs.getString("idClasificado"));
                cla.setLateralidad(rs.getString("lateralidad"));
                cla.setTitulo(rs.getString("titulo"));
                cla.setParrafo(rs.getString("parrafo"));
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
    public boolean registrarClasificado(String lateralidad, String titulo, String parrafo) {
        String consulta = "insert into Clasificados (lateralidad, titulo, parrafo) values (?,?,?)";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, lateralidad);
            pst.setString(2, titulo);
            pst.setString(3, parrafo);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean eliminarClasificado(String idClasificado) {
        String consulta = "Delete from Clasificados  where idClasificado=?";
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
    public boolean editarLateralidad(String idClasificado, String lateralidad) {
        String consulta = "update Clasificados set lateralidad =? where idClasificado=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, idClasificado);
            pst.setString(1, lateralidad);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarTitulo(String idClasificado, String titulo) {
        String consulta = "update Clasificados set titulo =? where idClasificado=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, idClasificado);
            pst.setString(1, titulo);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarParrafo(String idClasificado, String parrafo) {
        String consulta = "update Clasificados set parrafo =? where idClasificado=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(2, idClasificado);
            pst.setString(1, parrafo);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    

}
