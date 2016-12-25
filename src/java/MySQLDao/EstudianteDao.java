package MySQLDao;

import ClasesDTO.Curso;
import ClasesDTO.Estudiante;
import ClasesDTO.TipoDocumento;
import InterfazDatos.IEstudianteDao;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EstudianteDao implements IEstudianteDao {

    private Conexion conexion;

    public EstudianteDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public boolean registrarEstudiante(int id, int grupo) {
        String consulta2 = "INSERT INTO Estudiante (idUsuario,idCurso,estado ) VALUES(?,?,?)";
        try {
            PreparedStatement stmt2 = this.conexion.getConexion().prepareStatement(consulta2);
            stmt2.setLong(1, id);
            stmt2.setLong(2, grupo);
            stmt2.setInt(3, 1);
            boolean con2 = stmt2.execute();
            stmt2.close();
            this.conexion.close();
            return con2;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public ArrayList<Estudiante> listarEstudiantesGrupo(int g) {
        String consulta2;
        ArrayList<Estudiante> estudiantes = new ArrayList<Estudiante>();
        int d = 0, grupo = 0;
        String codigo;
        String curso;
        char letra = 0;
        consulta2 = "SELECT * FROM Usuario, Estudiante WHERE"
                + " Usuario.idUsuario=Estudiante.idUsuario AND Estudiante.idCurso=? AND idGrupo IS NULL";
        PreparedStatement stmt2;
        try {
            stmt2 = this.conexion.getConexion().prepareStatement(consulta2);
            stmt2.setInt(1, g);
            ResultSet rs2 = stmt2.executeQuery();
            while (rs2.next()) {
                grupo = rs2.getInt("idCurso");
                curso = rs2.getString("idGrupo");
                codigo = rs2.getString("codigo");
                if (curso != null) {
                    letra = curso.charAt(0);
                }
                estudiantes.add(new Estudiante(rs2.getInt("idUsuario"), obtenerTipoDoc(rs2.getInt("idTipoDocumento")),
                        rs2.getString("numDoc"),
                        rs2.getString("correo"), rs2.getDate("fechaNacimiento"),
                        rs2.getString("tipoSangre"), rs2.getString("ciudadActual"),
                        rs2.getString("departamentoActual"), rs2.getString("genero"),
                        rs2.getString("eps"), rs2.getString("nombres"), rs2.getString("apellidos"),
                        rs2.getString("telefono"), rs2.getString("ciudadNacimiento"),
                        rs2.getString("departamentoNacimiento"), rs2.getString("paisNacimiento"),
                        rs2.getString("paisActual"), rs2.getString("nombreUsuario"),
                        grupo, letra, codigo));
            }
            System.out.println("Los estudiantes del grupo son : " + estudiantes.size());
            return estudiantes;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public ArrayList<Estudiante> listarEstudiantesGrupo2(int g) {
        String consulta2;
        ArrayList<Estudiante> estudiantes = new ArrayList<Estudiante>();
        int d = 0, grupo = 0;
        String codigo;
        String curso;
        char letra = 0;
        consulta2 = "SELECT * FROM Usuario, Estudiante WHERE"
                + " Usuario.idUsuario=Estudiante.idUsuario AND Estudiante.idCurso=?";
        PreparedStatement stmt2;
        try {
            stmt2 = this.conexion.getConexion().prepareStatement(consulta2);
            stmt2.setInt(1, g);
            ResultSet rs2 = stmt2.executeQuery();
            while (rs2.next()) {
                grupo = rs2.getInt("idCurso");
                curso = rs2.getString("idGrupo");
                codigo = rs2.getString("codigo");
                if (curso != null) {
                    letra = curso.charAt(0);
                }
                estudiantes.add(new Estudiante(rs2.getInt("idUsuario"), obtenerTipoDoc(rs2.getInt("idTipoDocumento")),
                        rs2.getString("numDoc"),
                        rs2.getString("correo"), rs2.getDate("fechaNacimiento"),
                        rs2.getString("tipoSangre"), rs2.getString("ciudadActual"),
                        rs2.getString("departamentoActual"), rs2.getString("genero"),
                        rs2.getString("eps"), rs2.getString("nombres"), rs2.getString("apellidos"),
                        rs2.getString("telefono"), rs2.getString("ciudadNacimiento"),
                        rs2.getString("departamentoNacimiento"), rs2.getString("paisNacimiento"),
                        rs2.getString("paisActual"), rs2.getString("nombreUsuario"),
                        grupo, letra, codigo));
            }
            System.out.println("Los estudiantes del grupo son : " + estudiantes.size());
            return estudiantes;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public ArrayList<Estudiante> listarEstudiantesCurso(char g, int c) {
        String consulta2 = "";
        ArrayList<Estudiante> estudiantes = new ArrayList<Estudiante>();
        int d = 0, grupo = 0;
        String codigo = "";
        String curso = "";
        char letra = 0;
        consulta2 = "SELECT * FROM Usuario, Estudiante, Curso WHERE"
                + " Curso.idCurso = Estudiante.idCurso AND"
                + " Usuario.idUsuario=Estudiante.idUsuario AND Estudiante.idGrupo=?"
                + " AND Estudiante.idCurso=?";
        PreparedStatement stmt2;
        try {
            stmt2 = this.conexion.getConexion().prepareStatement(consulta2);
            stmt2.setString(1, String.valueOf(g));
            stmt2.setInt(2, c);
            ResultSet rs2 = stmt2.executeQuery();
            while (rs2.next()) {
                curso = rs2.getString("idGrupo");
                codigo = rs2.getString("codigo");
                if (curso != null) {
                    letra = curso.charAt(0);
                }
                estudiantes.add(new Estudiante(rs2.getInt("idUsuario"), obtenerTipoDoc(rs2.getInt("idTipoDocumento")),
                        rs2.getString("numDoc"),
                        rs2.getString("correo"), rs2.getDate("fechaNacimiento"),
                        rs2.getString("tipoSangre"), rs2.getString("ciudadActual"),
                        rs2.getString("departamentoActual"), rs2.getString("genero"),
                        rs2.getString("eps"), rs2.getString("nombres"), rs2.getString("apellidos"),
                        rs2.getString("telefono"), rs2.getString("ciudadNacimiento"),
                        rs2.getString("departamentoNacimiento"), rs2.getString("paisNacimiento"),
                        rs2.getString("paisActual"), rs2.getString("nombreUsuario"),
                        dtoCurso(c), letra, codigo));
            }
            return estudiantes;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    private Curso dtoCurso (int idCurso) throws SQLException {
        CursoDao cDao = new CursoDao();
        ArrayList<Curso> cursos = cDao.listarCursos();
        for (Curso c : cursos) {
            if (c.getIdCurso() == idCurso) {
                return c;
            }
        }
        return null;
    }

    private TipoDocumento obtenerTipoDoc(int tipo) throws SQLException {
        TipoDocumentoDao tDao = new TipoDocumentoDao();
        ArrayList<TipoDocumento> tipos = tDao.cargarTiposDocumento();
        for (TipoDocumento t : tipos) {
            if (t.getIdTipoDoc() == tipo) {
                return t;
            }
        }
        return null;
    }

    @Override
    public boolean asignarCurso(int codEst, int grupo, char curso) {
        boolean b = true;
        try {
            this.conexion = new Conexion();
            String consulta = "UPDATE Estudiante SET idGrupo = ? WHERE idUsuario = ? AND idCurso = ?";
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setString(1, String.valueOf(curso));
            stmt.setInt(2, codEst);
            stmt.setInt(3, grupo);
            b = stmt.execute();
            stmt.close();
            this.conexion.close();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return b;
        }
    }

    @Override
    public boolean eliminarEstudiante(int idUsuario) {
        String consulta = "DELETE FROM Estudiante WHERE idUsuario=?";
        try {
            this.conexion = new Conexion();
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, idUsuario);
            boolean b = stmt.execute();
            stmt.close();
            this.conexion.close();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean quitarEstudiante(int codEst) {
        boolean b = true;
        try {
            this.conexion = new Conexion();
            String consulta = "UPDATE Estudiante SET idGrupo = NULL WHERE idUsuario =?";
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, codEst);
            b = stmt.execute();
            stmt.close();
            this.conexion.close();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return b;
        }

    }

    @Override
    public ArrayList<Estudiante> listarEstudianteGrupo() {
        String consulta;
        int grupo = 0;
        String codigo;
        String curso;
        char letra = 0;
        ArrayList<Estudiante> estudiantes = new ArrayList<Estudiante>();

        consulta = "SELECT * FROM Usuario, Estudiante WHERE"
                + " Usuario.idUsuario=Estudiante.idUsuario AND idGrupo IS NULL";
        PreparedStatement stmt2;
        try {
            stmt2 = this.conexion.getConexion().prepareStatement(consulta);
            ResultSet rs2 = stmt2.executeQuery();
            while (rs2.next()) {
                grupo = rs2.getInt("idCurso");
                curso = rs2.getString("idGrupo");
                codigo = rs2.getString("codigo");

                estudiantes.add(new Estudiante(rs2.getInt("idUsuario"), obtenerTipoDoc(rs2.getInt("idTipoDocumento")),
                        rs2.getString("numDoc"),
                        rs2.getString("correo"), rs2.getDate("fechaNacimiento"),
                        rs2.getString("tipoSangre"), rs2.getString("ciudadActual"),
                        rs2.getString("departamentoActual"), rs2.getString("genero"),
                        rs2.getString("eps"), rs2.getString("nombres"), rs2.getString("apellidos"),
                        rs2.getString("telefono"), rs2.getString("ciudadNacimiento"),
                        rs2.getString("departamentoNacimiento"), rs2.getString("paisNacimiento"),
                        rs2.getString("paisActual"), rs2.getString("nombreUsuario"),
                        grupo, letra, codigo));
            }
            return estudiantes;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean actualizarGrupo(int grupo, int estudiante) {
        boolean b = true;
        try {
            this.conexion = new Conexion();
            String consulta = "UPDATE Estudiante SET idCurso = ? WHERE idUsuario = ?";
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, grupo);
            stmt.setInt(2, estudiante);
            b = stmt.execute();
            stmt.close();
            this.conexion.close();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return b;
        }
    }

    @Override
    public Estudiante getDtoEstudiantes(int idEst) {
        Estudiante est = null;
        try {
            String consulta = "SELECT * FROM Estudiante WHERE idUsuario=? ";
            PreparedStatement stmt = this.conexion.getConexion().prepareStatement(consulta);
            stmt.setInt(1, idEst);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                est = new Estudiante();

                est.setIdUsuario(rs.getInt("idUsuario"));
                est.setGrupo(rs.getInt("idCurso"));
            }
            stmt.close();
            this.conexion.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return est;
    }

    @Override
    public ArrayList<Estudiante> listarEstudianteSinFoto(int curso, char grupo) {
        ArrayList<Estudiante> estudiantes = new ArrayList<Estudiante>();
        String consulta = "SELECT u.nombres, u.apellidos, u.idUsuario "
                + "FROM Estudiante e, Usuario u "
                + "WHERE e.idUsuario = u.idUsuario AND e.idGrupo=? AND e.idCurso=? "
                + "AND u.foto=? "
                + "ORDER BY u.nombres ASC";
        Estudiante e;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, String.valueOf(grupo));
            pst.setInt(2, curso);
            pst.setString(3, "No disponible");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                e = new Estudiante();
                e.setNombres(rs.getString(1));
                e.setApellidos(rs.getString(2));
                e.setIdUsuario(rs.getInt(3));
                estudiantes.add(e);
            }
            rs.close();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return estudiantes;
    }

}
