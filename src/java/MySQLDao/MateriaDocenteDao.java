package MySQLDao;

import ClasesDTO.Curso;
import ClasesDTO.Docente;
import ClasesDTO.Grupo;
import ClasesDTO.Materia;
import ClasesDTO.MateriaDocente;
import InterfazDatos.IMateriaDocenteDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MateriaDocenteDao implements Serializable, IMateriaDocenteDao {

    private Conexion conexion;

    public MateriaDocenteDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public boolean registrarMateriaDocente(int idDocente, int idMateria, int idCuros, char curso) {
        String consulta = "INSERT INTO MateriaDocenteGrupo (idDocente, idGrupo, idCurso,"
                + " idMateria) VALUES (?,?,?,?)";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, idDocente);
            pst.setString(2, String.valueOf(curso));
            pst.setInt(3, idCuros);
            pst.setInt(4, idMateria);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean eliminarMateriaDocente(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Materia> listarMateriaDocente(int idDocente){
        ArrayList<Materia> lista = new ArrayList<Materia>();
        String consulta = "SELECT DISTINCT m.idMateria, m.nombre "
                + "FROM MateriaDocenteGrupo h, Materia m "
                + "WHERE h.idDocente = ? AND  "
                + "h.idMateria = m.idMateria";
        PreparedStatement pst;
        Materia m;
        try {
            pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idDocente);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                m = new Materia();
                m.setId(rs.getInt(1));
                m.setNombre(rs.getString(2));
                lista.add(m);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    
    @Override
    public ArrayList<MateriaDocente> listarMateriaDocente() {
        ArrayList<MateriaDocente> lista = new ArrayList<MateriaDocente>();
        String consulta = "SELECT * "
                + "FROM MateriaDocenteGrupo h, Materia m, Docente d, Grupo g, Curso c, Usuario u "
                + "WHERE h.idDocente = d.idUsuario AND h.idGrupo = g.idGrupo AND h.idCurso=g.idCurso "
                + "AND h.idMateria = m.idMateria AND g.idCurso = c.idCurso AND u.idUsuario = d.idUsuario";
        PreparedStatement pst;
        MateriaDocente md;
        Materia m;
        Grupo g;
        try {
            pst = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                g = new Grupo();
                g.setIdCurso(new Curso(rs.getInt(3), true, rs.getString(17)));
                g.setIdGrupo(rs.getString(2).charAt(0));
                m = new Materia();
                m.setId(rs.getInt(4));
                m.setNombre(rs.getString(8));
                md = new MateriaDocente(rs.getInt(5));
                md.setGrupo(g);
                md.setMateria(m);
                lista.add(md);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public boolean actualizarDocenteMateria(int codIdDocente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<MateriaDocente> listarPorMateria(long idMateria) {
        ArrayList<MateriaDocente> materias = new ArrayList<MateriaDocente>();
        String consulta = "SELECT m.id, m.idGrupo, c.idCurso, c.descripcion "
                + "FROM MateriaDocenteGrupo m, Materia a, Curso c "
                + "WHERE m.idMateria=a.idMateria AND c.idCurso=m.idCurso AND m.idMateria=?";
        Grupo g;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idMateria);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                g = new Grupo(rs.getString(2).charAt(0), new Curso(rs.getInt(3),true, rs.getString(4)),null);
                materias.add(new MateriaDocente(null, g, null, rs.getInt(1)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return materias;
    }
    
    @Override
    public ArrayList<MateriaDocente> listarMateriasGrupo(int idUsuario){
        ArrayList<MateriaDocente> materias = new ArrayList<MateriaDocente>();
        String consulta = "SELECT m.nombre, g.id, m.idMateria "
                + "FROM Materia m, MateriaDocenteGrupo g, Estudiante e "
                + "WHERE m.idMateria=g.idMateria AND g.idGrupo=e.idGrupo AND g.idCurso=e.idCurso "
                + "AND e.idUsuario=?";
        MateriaDocente m;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idUsuario);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                m = new MateriaDocente(rs.getInt(2));
                m.setMateria(new Materia(rs.getString(1), rs.getInt(3)));
                materias.add(m);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return materias;
    }
}
