package MySQLDao;

import ClasesDTO.Curso;
import ClasesDTO.Docente;
import ClasesDTO.Grupo;
import InterfazDatos.IGrupoDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GrupoDao implements IGrupoDao {

    private Conexion conexion;

    public GrupoDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public boolean registrarGrupo(Grupo grupo) {
        String consulta = "INSERT INTO Grupo (idGrupo, idCurso, idDocente) VALUES(?,?,?)";
        boolean x = true;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, String.valueOf(grupo.getIdGrupo()));
            stmt.setInt(2, grupo.getIdCurso().getIdCurso());
            stmt.setLong(3, grupo.getTitular().getIdUsuario());
            x = stmt.execute();
            stmt.close();
            this.conexion.close();
            return x;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return x;
        }
    }

    @Override
    public boolean actulizarGrupo(Grupo grupo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarGrupo(Grupo grupo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Grupo> listarGrupos() {
        ArrayList<Grupo> grupos = new ArrayList<Grupo>();

        String consulta = "SELECT * "
                + "FROM Grupo,Curso "
                + "WHERE Grupo.idCurso=Curso.idCurso "
                + "ORDER BY Curso.idCurso";
        try {
            DocenteDao user = new DocenteDao();
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Docente d = user.obtenerDocente(rs.getInt("idDocente"));
                grupos.add(new Grupo(rs.getString("idGrupo").charAt(0), new Curso(rs.getInt("idCurso"), true, rs.getString("descripcion")), d));
                System.out.println(grupos.get(grupos.size() - 1).getIdCurso().getDescripcion());
            }
            return grupos;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return grupos;
        }
    }

    @Override
    public ArrayList<Grupo> listarGruposCurso(int idCurso) {
        ArrayList<Grupo> grupos = new ArrayList<Grupo>();

        String consulta = "SELECT g.idGrupo "
                + "FROM Grupo g,Curso c "
                + "WHERE g.idCurso=c.idCurso AND g.idCurso=? "
                + "ORDER BY g.idGrupo";
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, idCurso);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                grupos.add(new Grupo(rs.getString(1).charAt(0), null, null));
            }
            rs.close();
            stmt.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return grupos;
    }

    @Override
    public ArrayList<Grupo> listarGruposByCurso(int idCurso) {
        ArrayList<Grupo> grupos = new ArrayList<Grupo>();

        String consulta = "SELECT * "
                + "FROM Grupo g,Curso c "
                + "WHERE g.idCurso=c.idCurso AND g.idCurso=? "
                + "ORDER BY g.idGrupo";
        try {
            DocenteDao user = new DocenteDao();
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, idCurso);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Docente d = user.obtenerDocente(rs.getInt("idDocente"));
                grupos.add(new Grupo(rs.getString("idGrupo").charAt(0), new Curso(rs.getInt("idCurso"), true, rs.getString("descripcion")), d));
                //System.out.println(grupos.get(grupos.size() - 1).getIdCurso().getDescripcion());
            }
            return grupos;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return grupos;
        }
    }
    
    

}
