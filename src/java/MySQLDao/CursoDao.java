package MySQLDao;

import ClasesDTO.Curso;
import InterfazDatos.ICursoDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CursoDao implements ICursoDao {

    private Conexion conexion;

    public CursoDao() throws SQLException {
        this.conexion = new Conexion();
    }
    @Override
    public boolean registrarCurso(Curso c){
        String consulta = "INSERT INTO Curso (estado, descripcion)"
                + "VALUES (?,?)";
        boolean a;
        try{
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, 0);
            stmt.setString(2, c.getDescripcion());
            a= stmt.execute();
            stmt.close();
            this.conexion.close();
            return a;
        }catch(SQLException e){
            e.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean actualizarCurso(Curso e){
        String consulta = "UPDATE Curso SET estado=? WHERE idCurso=?";
        boolean s;
        int b =3;
        try {
            this.conexion=new Conexion();
            if(e.getEstado()){
                b=1;
            }
            else{
                b=0;
            }
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1,b);
            stmt.setInt(2, e.getIdCurso());
            s=stmt.execute();
            stmt.close();
            this.conexion.close();
            return s;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public Curso dtoCursoId(int idCurso) {
        String consulta = "SELECT * FROM Curso where idCurso= ?";
        Curso  curso = null; 
        boolean a;
        int b = 0;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, idCurso);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                a=false;
                b = rs.getInt("estado");
                if (b == 0) {
                    a = true;
                }
                curso = (new Curso(rs.getInt("idCurso"), a, rs.getString("descripcion")));
            }
            rs.close();
            stmt.close();
            this.conexion.close();
            return curso;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    //Lista los grados activos
    @Override
    public ArrayList<Curso> listarCursos() {
        ArrayList<Curso> cursos = new ArrayList<Curso>();
        String consulta = "SELECT * FROM Curso ORDER BY idCurso";
        boolean a;
        int b = 0;
        try {
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                a=false;
                b = rs.getInt("estado");
                if (b == 0) {
                    a = true;
                }
                cursos.add(new Curso(rs.getInt("idCurso"), a, rs.getString("descripcion")));
            }
            rs.close();
            stmt.close();
            this.conexion.close();
            return cursos;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean cambiarDescripcionCurso(int id, String descripcion) {
        String consulta = "update Curso set descripcion=? where idCurso =?";
        boolean a;
        try{
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(2, id);
            stmt.setString(1, descripcion);
            a= stmt.execute();
            stmt.close();
            this.conexion.close();
            return a;
        }catch(SQLException e){
            e.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean eliminarCursos(Curso e) {
        String consulta = "delete from Curso WHERE idCurso=?";
        boolean s;
        try {
            this.conexion=new Conexion();
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, e.getIdCurso());
            s=stmt.execute();
            stmt.close();
            this.conexion.close();
            return s;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    
    

}
