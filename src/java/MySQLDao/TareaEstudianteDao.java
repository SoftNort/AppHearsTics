package MySQLDao;

import ClasesDTO.Estudiante;
import ClasesDTO.Materia;
import ClasesDTO.Periodo;
import ClasesDTO.Tarea;
import ClasesDTO.TareaEstudiante;
import InterfazDatos.ITareaEstudianteDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TareaEstudianteDao implements Serializable, ITareaEstudianteDao {

    private Conexion conexion;

    public TareaEstudianteDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public boolean insertarTareaEstudiante(int idTarea, long idEstudiante, Date fechaEntrega, String materia) {
        String consulta = "INSERT INTO TareaEstudianteGrupo (idTarea, idEstudiante, fechaEntrega, idMateriaGrupo, idPeriodo, periodoYear) "
                + "VALUES (?,?,?,?,?,?)";
        
        boolean b = true;
        try {
            Periodo p = new PeriodoDao().obtenerPeriodoActivo();
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            System.out.println("Id Tarea = "+idTarea);
            pst.setLong(1, idTarea);
            pst.setLong(2, idEstudiante);
            if (fechaEntrega != null) {
                pst.setDate(3, new java.sql.Date(fechaEntrega.getTime()));
            } else {
                pst.setDate(3, null);
            }
            pst.setLong(4, Long.parseLong(materia));
            pst.setInt(5, p.getNumero());
            pst.setInt(6, p.getYear());
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(TareaEstudianteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }

    @Override
    public boolean actualizarTareaEstudiante(int idTarea, long idEstudiante) {
        String consulta = "UPDATE TareaEstudianteGrupo SET estado=? WHERE idTarea=? AND idEstudiante=?";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, "contestada");
            pst.setInt(2, idTarea);
            pst.setLong(3, idEstudiante);
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;

    }

    @Override
    public boolean eliminarTareaEstudiante() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<TareaEstudiante> listarTareaEstudiante(long idEstudiante) {
        String consulta = "SELECT t.nombre, t.id, t.asunto, m.nombre, m.idMateria,"
                + " e.fechaEntrega, e.calificacion, e.estado "
                + "FROM TareaEstudianteGrupo e, Tarea t, Materia m "
                + "WHERE e.idEstudiante = ? AND e.estado =? AND e.idTarea=t.id AND "
                + "m.idMateria=e.idMateriaGrupo AND e.fechaEntrega>=CURDATE() ORDER BY e.fechaEntrega DESC";
        ArrayList<TareaEstudiante> tarea = new ArrayList<TareaEstudiante>();
        Tarea t;
        Materia m;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idEstudiante);
            pst.setString(2, "sin responder");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                t = new Tarea(rs.getInt(2), rs.getString(1), rs.getString(3));
                m = new Materia(rs.getString(4), rs.getInt(5));
                tarea.add(new TareaEstudiante(null, t, m, rs.getDate(6), rs.getDouble(7), rs.getString(8)));
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tarea;
    }

    @Override
    public ArrayList<TareaEstudiante> listarTareaDocente(long idDocente) {
        String consulta = "SELECT DISTINCT m.nombre, m.idMateria, t.id, t.nombre, t.asunto, e.idEstudiante, u.nombres,"
                + " u.apellidos, e.calificacion, e.estado, e.fechaEntrega, d.idGrupo, d.idCurso"
                + " FROM TareaEstudianteGrupo e, Tarea t, Usuario u, Materia m, Estudiante d "
                + "WHERE t.idUsuario = ? AND e.idTarea=t.id AND "
                + "m.idMateria=e.idMateriaGrupo AND e.idEstudiante = u.idUsuario AND d.idUsuario=u.idUsuario";
        ArrayList<TareaEstudiante> tarea = new ArrayList<TareaEstudiante>();
        Tarea t;
        Estudiante e;
        Materia m;
        String curso="";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idDocente);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                t = new Tarea(rs.getInt(3), rs.getString(4), rs.getString(5));
                e = new Estudiante();
                m = new Materia(rs.getString(1), rs.getInt(2));
                e.setNombres(rs.getString(7));
                e.setApellidos(rs.getString(8));
                e.setIdUsuario(rs.getInt(2));
                e.setGrupo(rs.getInt(13));
                curso=rs.getString(12);
                if (curso != null) {
                    e.setCurso(curso.charAt(0));
                }
                tarea.add(new TareaEstudiante(e, t, m, rs.getDate(11), rs.getDouble(9), rs.getString(10)));
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tarea;
    }

    @Override
    public ArrayList<TareaEstudiante> listarTareasMateria(long idDocente, long idMateria) {
        ArrayList<TareaEstudiante> tareas = new ArrayList<TareaEstudiante>();
        String consulta = "SELECT DISTINCT t.asunto, g.fechaEntrega, m.idGrupo, m.idCurso "
                + "FROM Tarea t, TareaEstudianteGrupo g, MateriaDocenteGrupo m "
                + "WHERE t.id=g.idTarea AND t.idUsuario =? AND g.idMateriaGrupo = ? "
                + "AND g.idMateriaGrupo=m.idMateria "
                + "GROUP BY t.asunto "
                + "ORDER BY fechaEntrega ASC ";
        Tarea t;
        TareaEstudiante g;
        Estudiante e;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idDocente);
            pst.setLong(2, idMateria);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                t = new Tarea("", rs.getString(1));
                g = new TareaEstudiante();
                e = new Estudiante();
                g.setFechaEntrega(rs.getDate(2));
                e.setGrupo(rs.getInt(4));
                e.setCurso(rs.getString(3).charAt(0));
                g.setTarea(t);
                g.setEstudiante(e);
                tareas.add(g);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return tareas;
    }

    @Override
    public ArrayList<TareaEstudiante> listarPorAsunto(String asunto) {
        ArrayList<TareaEstudiante> tareas = new ArrayList<TareaEstudiante>();
        String consulta = "SELECT u.nombres, u.apellidos, g.calificacion, g.estado, u.idUsuario, t.id "
                + "FROM Usuario u, TareaEstudianteGrupo g, Tarea t "
                + "WHERE g.idEstudiante = u.idUsuario AND t.id = g.idTarea AND t.asunto=?";
        Estudiante e;
        TareaEstudiante t;
        Tarea ta;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, asunto);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                ta = new Tarea();
                ta.setId(rs.getInt(6));
                e = new Estudiante();
                e.setNombres(rs.getString(1));
                e.setApellidos(rs.getString(2));
                e.setIdUsuario(rs.getInt(5));
                t = new TareaEstudiante();
                t.setEstudiante(e);
                t.setTarea(ta);
                t.setCalificacion(rs.getDouble(3));
                t.setEstado(rs.getString(4));
                tareas.add(t);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tareas;
    }

    @Override
    public ArrayList<TareaEstudiante> listarMisTareas(long idEstudiante) {
        String consulta = "SELECT t.nombre, t.id, t.asunto, m.nombre, m.idMateria,"
                + " e.fechaEntrega, e.calificacion, e.estado "
                + "FROM TareaEstudianteGrupo e, Tarea t, Materia m "
                + "WHERE e.idEstudiante = ? AND e.idTarea=t.id AND "
                + "m.idMateria=e.idMateriaGrupo "
                + "GROUP BY t.nombre "
                + "ORDER BY e.fechaEntrega ASC ";
        ArrayList<TareaEstudiante> tarea = new ArrayList<TareaEstudiante>();
        Tarea t;
        Materia m;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idEstudiante);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                t = new Tarea(rs.getInt(2), rs.getString(1), rs.getString(3));
                m = new Materia(rs.getString(4), rs.getInt(5));
                tarea.add(new TareaEstudiante(null, t, m, rs.getDate(6), rs.getDouble(7), rs.getString(8)));
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tarea;
    }
    
    @Override
    public ArrayList<TareaEstudiante> listarTareasMateria(int tareaDocente, int idEstudiante){
        ArrayList<TareaEstudiante> tareas = new ArrayList<TareaEstudiante>();
        String consulta = "SElECT DISTINCT t.asunto, g.calificacion, g.fechaEntrega "
                + "FROM TareaEstudianteGrupo  g, Tarea t, MateriaDocenteGrupo m "
                + "WHERE g.idTarea=t.id AND g.idMateriaGrupo=m.idMateria AND m.id=? "
                + "AND g.idEstudiante=?";
        Tarea t;
        TareaEstudiante e;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, tareaDocente);
            pst.setInt(2, idEstudiante);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                t = new Tarea("", rs.getString(1));
                e = new TareaEstudiante();
                e.setCalificacion(rs.getDouble(2));
                e.setFechaEntrega(rs.getDate(3));
                e.setTarea(t);
                tareas.add(e);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(TareaEstudianteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tareas;
    }
    
    @Override
    public ArrayList<TareaEstudiante> listarMisTareasDocente(long idDocente) {
        String consulta = "SELECT t.nombre, t.id, t.asunto, m.nombre, m.idMateria,"
                + " e.fechaEntrega, e.calificacion, e.estado "
                + "FROM TareaEstudianteGrupo e, Tarea t, Materia m "
                + "WHERE t.idUsuario = ? AND e.idTarea=t.id AND "
                + "m.idMateria=e.idMateriaGrupo "
                + "GROUP BY t.nombre "
                + "ORDER BY e.fechaEntrega ASC ";
        ArrayList<TareaEstudiante> tarea = new ArrayList<TareaEstudiante>();
        Tarea t;
        Materia m;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idDocente);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                t = new Tarea(rs.getInt(2), rs.getString(1), rs.getString(3));
                m = new Materia(rs.getString(4), rs.getInt(5));
                tarea.add(new TareaEstudiante(null, t, m, rs.getDate(6), rs.getDouble(7), rs.getString(8)));
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tarea;
    }
    
    @Override
    public boolean cambiarFechaTarea(Date fechaEntrega, int idTarea){
        String consulta = "UPDATE TareaEstudianteGrupo "
                + "SET fechaEntrega=? "
                + "WHERE idTarea=?";
        boolean b = true;
        PreparedStatement pst;
        try {
            pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setDate(1, new java.sql.Date(fechaEntrega.getTime()));
            pst.setInt(2, idTarea);
            b=pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }
}
