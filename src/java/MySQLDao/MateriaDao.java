package MySQLDao;

import ClasesDTO.Materia;
import InterfazDatos.IMateriaDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MateriaDao implements IMateriaDao, Serializable{
    
    private Conexion conexion;
    
    public MateriaDao() throws SQLException{
        this.conexion = new Conexion();
    }

    @Override
    public boolean registrarMateria(Materia m) {
        String consulta = "INSERT INTO Materia (nombre, estado) VALUES (?,?)";
        try{
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, m.getNombre());
            stmt.setString(2, m.getEstado());
            boolean b = stmt.execute();
            stmt.close();
            this.conexion.close();
            return b;
        }catch(SQLException e){
            e.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean eliminarMateria(Materia m) {
        boolean b = true;
        try {
            this.conexion = new Conexion();
            String consulta = "DELETE FROM Materia WHERE Materia.idMateria = ?";
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setInt(1, m.getId());
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public ArrayList<Materia> listarMaterias() {
        ArrayList<Materia> materias = new ArrayList<Materia>();
        try {
            String consulta = "SELECT * FROM Materia";
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                materias.add(new Materia(rs.getString("nombre"),rs.getInt("idMateria")));
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return materias;
    }
    
    @Override
    public ArrayList<Materia> listarMateriaDocente(long idDocente) {
        String consulta = "SELECT DISTINCT m.nombre, m.idMateria "
                + "FROM Materia m, TareaEstudianteGrupo g, Tarea t "
                + "WHERE m.idMateria = g.idMateriaGrupo AND g.idTarea = t.id AND "
                + "t.idUsuario = ?";
        ArrayList<Materia> materia = new ArrayList<Materia>();
        PreparedStatement pst;
        try {
            pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, idDocente);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                materia.add(new Materia(rs.getString(1), rs.getInt(2)));
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return materia;
    }

    @Override
    public boolean actualizarMateria(Materia m) {
        String consulta = "update Materia set nombre= ? where idMateria=?";
        try{
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, m.getNombre());
            stmt.setInt(2, m.getId());
            boolean b = stmt.execute();
            stmt.close();
            this.conexion.close();
            return b;
        }catch(SQLException e){
            e.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean desactivarMaterias(Materia m) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
