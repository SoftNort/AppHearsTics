/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MySQLDao;

import ClasesDTO.NoticiasHtml;
import InterfazDatos.INoticiasHtmlDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class NoticiasHtmlDao implements INoticiasHtmlDao {

    private Conexion conexion;

    public NoticiasHtmlDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public ArrayList<NoticiasHtml> getNoticiasPaginas(int pg, int numreg) {
        ArrayList<NoticiasHtml> noticias = new ArrayList<NoticiasHtml>();
        NoticiasHtml noti = null;
        String consulta = "Select * from SeccionNoticias order by idNoticia DESC LIMIT ?,? ";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, (pg - 1) * numreg);
            pst.setInt(2, numreg);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                noti = new NoticiasHtml();
                noti.setIdNot(rs.getString("idNoticia"));
                noti.setTitulo(rs.getString("titulo"));
                noti.setUrlImg(rs.getString("urlImg"));
                noti.setDescri(rs.getString("descripcion"));
                noti.setUrlLink(rs.getString("parrafo"));
                noticias.add(noti);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return noticias;
    }

    @Override
    public ArrayList<NoticiasHtml> getNoticiasId(String idNoticia) {
        ArrayList<NoticiasHtml> noticia = new ArrayList<NoticiasHtml>();
        NoticiasHtml noti = null;
        String consulta = "Select * from SeccionNoticias  where idNoticia = ? ";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, idNoticia);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                noti = new NoticiasHtml();
                noti.setIdNot(rs.getString("idNoticia"));
                noti.setTitulo(rs.getString("titulo"));
                noti.setUrlImg(rs.getString("urlImg"));
                noti.setDescri(rs.getString("descripcion"));
                noti.setUrlLink(rs.getString("parrafo"));
                noticia.add(noti);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return noticia;
    }

    @Override
    public boolean registrarNoticia(String titulo, String img, String descripcion, String parrafo) {
        String consulta = "Insert into SeccionNoticias ( titulo, urlImg, descripcion, parrafo) values (?,?,?,?)";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, titulo);
            pst.setString(2, img);
            pst.setString(3, descripcion);
            pst.setString(4, parrafo);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean eliminarNoticia(String idNoticia) {
        String consulta = "Delete from SeccionNoticias where idNoticia=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, idNoticia);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public int contarFilas() {
        String consulta = "Select * from SeccionNoticias";
        int b = 0;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                b++;
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarTituloNoticia(String idNoticia, String titulo) {
        String consulta = "Update SeccionNoticias set titulo =? where idNoticia=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, titulo);
            pst.setString(2, idNoticia);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarDescripcionNoticia(String idNoticia, String descripcion) {
        String consulta = "Update SeccionNoticias set descripcion =? where idNoticia=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, descripcion);
            pst.setString(2, idNoticia);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarParrafoNoticia(String idNoticia, String parrafo) {
        String consulta = "Update SeccionNoticias set parrafo =? where idNoticia=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, parrafo);
            pst.setString(2, idNoticia);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean editarImagenNoticia(String idNoticia, String imagen) {
        String consulta = "Update SeccionNoticias set urlImg =? where idNoticia=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, imagen);
            pst.setString(2, idNoticia);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

}
