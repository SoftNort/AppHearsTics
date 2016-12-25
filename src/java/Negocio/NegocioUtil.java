package Negocio;

import ClasesDTO.*;
import Fachada.INegocioUtil;
import FactoryBD.DaoFactory;
import InterfazDatos.*;
import java.io.Serializable;
import java.util.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class NegocioUtil implements INegocioUtil, Serializable {

    private final DaoFactory factory;

    public NegocioUtil() {
        this.factory = new DaoFactory();
    }

    @Override
    public ArrayList<TipoDocumento> cargarTiposDocumento() {
        try {
            ITipoDocumentoDao tipo = this.factory.getTipoDocumento();
            return tipo.cargarTiposDocumento();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean registrarDocumento(String nombre) {

        try {
            ITipoDocumentoDao tipo = this.factory.getTipoDocumento();
            return tipo.registrarDocumento(nombre);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public String eliminarTipoDoc(String[] eliminar) {
        String rts = "Se ha eliminado los tipos de documentos";
        int c = 0;
        try {
            ITipoDocumentoDao tipo = this.factory.getTipoDocumento();
            for (String doc : eliminar) {
                if (tipo.eliminar(doc)) {
                    c++;
                }
            }
            if (c > 0) {
                rts = "Error al eliminar algunos tipos de documentos";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return "Error al intentar eliminar los tipos de documentos";
        }
        return rts;
    }

    @Override
    public ArrayList<Curso> listarCursos() {
        try {
            ICursoDao curso = this.factory.getCurso();
            return curso.listarCursos();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public ArrayList<Docente> listarDocentes() {
        try {
            IDocenteDao doc = this.factory.getDocente();
            return doc.listarDocentes();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean registarCurso(String descripcion) {
        try {
            ICursoDao curso = this.factory.getCurso();
            return curso.registrarCurso(new Curso(true, descripcion));
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean eliminarCurso(Curso[] cursos) {
        int x = 0;
        try {
            ICursoDao c = this.factory.getCurso();
            for (Curso cu : cursos) {
                if (!c.eliminarCursos(cu)) {
                    x++;
                }
            }
            if (x > 0) {
                return false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean editarDescripcionCurso(int id, String descripcion) {
        try {
            ICursoDao curso = this.factory.getCurso();
            return curso.cambiarDescripcionCurso(id, descripcion);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean cambiarGrupo(Curso[] cursos) {
        int x = 0;
        try {
            ICursoDao c = this.factory.getCurso();
            for (Curso cu : cursos) {
                if (!c.actualizarCurso(cu)) {
                    x++;
                }
            }
            if (x > 0) {
                return false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean crearGrupo(char grup, int curso, int titular) {
        try {
            IGrupoDao grupo = this.factory.getGrupo();
            Docente d = new Docente();
            d.setIdUsuario(titular);
            return grupo.registrarGrupo(new Grupo(grup, new Curso(curso, true, ""), d));
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public ArrayList<Grupo> listarGrupos() {
        try {
            IGrupoDao grupo = this.factory.getGrupo();
            return grupo.listarGrupos();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }

    }

    @Override
    public ArrayList<Grupo> listarGruposByCurso(int idCurso) {
        try {
            IGrupoDao gru = this.factory.getGrupo();
            return gru.listarGruposByCurso(idCurso);
        } catch (SQLException e) {
            return null;
        }
    }

    @Override
    public boolean quitarEstudiantes(String[] estudiantes) {
        int cont = 0;
        try {
            IEstudianteDao est = this.factory.getEstudiante();
            for (String estudiante : estudiantes) {
                if (est.quitarEstudiante(Integer.parseInt(estudiante))) {
                    cont++;
                }
            }
            if (cont > 0) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean registrarTipoUsuario(String rol) {
        TipoUsuario tipo = new TipoUsuario(0, rol);
        try {
            ITipoUsuarioDao tipoU = this.factory.getTipoUsuario();
            return tipoU.registrarTipoUsuario(tipo);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public ArrayList<TipoUsuario> listarTiposUsuario() {
        try {
            ITipoUsuarioDao tipoU = this.factory.getTipoUsuario();
            return tipoU.listarTiposUsuario();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean eliminarTipoUsuario(String[] tipos) {
        try {
            ITipoUsuarioDao tipo = this.factory.getTipoUsuario();
            int cont = 0;
            for (String t : tipos) {
                if (tipo.eliminarTipoUsuario(new TipoUsuario(Long.parseLong(t), ""))) {
                    cont++;
                }
            }
            if (cont > 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean registrarCarpetaPagina(String nombre, String icono) {
        try {
            ICarpetaPaginaDao carpetaPagina = this.factory.getCarpetaPagina();
            return carpetaPagina.registrarCarpetaPagina(new CarpetaPagina(0, nombre, icono));
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean eliminarCarpetaPagina(int c) {
        try {
            ICarpetaPaginaDao carp = this.factory.getCarpetaPagina();
            return carp.eliminarCarpetaPagina(c);
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean editarCarpetaPagina(int c, String nombre, String icono) {
        try {
            ICarpetaPaginaDao carp = this.factory.getCarpetaPagina();
            return carp.editarCarpetaPagina(c, nombre, icono);
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

    @Override
    public ArrayList<CarpetaPagina> getlistaCarpetasPaginas() {
        try {
            ICarpetaPaginaDao carpetapagina = this.factory.getCarpetaPagina();
            return carpetapagina.listarCarpetaPaginas();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean registrarPagina(String nombre, String descripcion, int carpeta) {
        try {
            IPaginaDao pagina = this.factory.getPagina();
            return pagina.registrarPagina(new Pagina(nombre, descripcion, carpeta));
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public ArrayList<Pagina> listarPaginas() {

        try {
            IPaginaDao pagina = this.factory.getPagina();
            return pagina.listarPaginas();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }

    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginasDiferentes(int idCarpeta) {
        try {
            IPaginaTipoUsuario pag = this.factory.getPaginaTipoUsuario();
            return pag.listarPaginasDiferentes(idCarpeta);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginasIguales(int idCarpeta) {
        try {
            IPaginaTipoUsuario pag = this.factory.getPaginaTipoUsuario();
            return pag.listarPaginasIguales(idCarpeta);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Pagina> listarPaginasCarpeta(int carpeta) {
        try {
            IPaginaDao pagina = this.factory.getPagina();
            return pagina.listarPaginasCarpeta(carpeta);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginas(int tipo) {
        try {
            IPaginaTipoUsuario pag = this.factory.getPaginaTipoUsuario();
            return pag.listarPaginas(tipo);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean actualizarPaginaCarpeta(int carpeta, String[] idPagina) {
        boolean b = true;
        try {
            IPaginaDao pagCa = this.factory.getPagina();
            int cont = 0;
            for (String p : idPagina) {
                if (!pagCa.actualizarPaginaCarpeta(carpeta, Integer.parseInt(p))) {
                    cont++;
                }
            }
            if (cont > 0) {
                b = false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginasTipoUsuario(int tipo) {
        try {
            IPaginaTipoUsuario pag = this.factory.getPaginaTipoUsuario();
            return pag.listarPaginasTipoUsuario(tipo);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarCarpetasTipoUsuario(int tipo) {
        try {
            IPaginaTipoUsuario pag = this.factory.getPaginaTipoUsuario();
            return pag.listarCarpetasTipoUsuario(tipo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginasSinCarpeta(int tipo) {
        try {
            IPaginaTipoUsuario pag = this.factory.getPaginaTipoUsuario();
            return pag.listarPaginasSinCarpeta(tipo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<PaginaTipoUsuario> listarPaginasIdCarpeta(long tipo, int carpeta) {
        try {
            IPaginaTipoUsuario pag = this.factory.getPaginaTipoUsuario();
            return pag.listarPaginasIdCarpeta(tipo, carpeta);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean agregarPermisos(int idRol, String[] paginas) {
        boolean b = true;
        try {
            IPaginaTipoUsuario pag = this.factory.getPaginaTipoUsuario();
            TipoUsuario tipo = new TipoUsuario(idRol, "");
            int cont = 0;
            for (String p : paginas) {
                Pagina pagina = new Pagina(Integer.parseInt(p), "", "");
                if (pag.registrar(pagina, tipo)) {
                    cont++;
                }
            }
            if (cont > 0) {
                b = false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public TipoUsuario listar(int tipo) {
        try {
            ITipoUsuarioDao user = this.factory.getTipoUsuario();
            return user.listar(tipo);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean registrarMateria(String nombre) {
        try {
            IMateriaDao materia = this.factory.getMateria();
            return materia.registrarMateria(new Materia(nombre, 0));
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean editarMateria(int id, String nombre) {
        try {
            IMateriaDao materia = this.factory.getMateria();
            return materia.actualizarMateria(new Materia(nombre, id));
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public boolean editarPin(String fechaInicio, String fechaFin, String idPin, String estado, int idEst) {
        try {
            IPinDao pin = this.factory.getPin();
            return pin.editarPin(fechaInicio, fechaFin, idPin, estado, idEst);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    @Override
    public ArrayList<Materia> listarMaterias() {
        try {
            IMateriaDao materia = this.factory.getMateria();
            return materia.listarMaterias();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean eliminarMateria(String[] materias) {
        int cont = 0;
        boolean b = false;
        try {
            IMateriaDao materia = this.factory.getMateria();
            for (String mat : materias) {
                if (materia.eliminarMateria(new Materia("", Integer.parseInt(mat)))) {
                    cont++;
                }
            }
            if (cont > 0) {
                b = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean registrarMateriaDocente(int idDocente, int idMateria, int idCuros, char curso) {
        try {
            IMateriaDocenteDao materia = this.factory.getMateriaDocente();
            return materia.registrarMateriaDocente(idDocente, idMateria, idCuros, curso);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    public ArrayList<MateriaDocente> listarMateriaDocente() {
        try {
            IMateriaDocenteDao materia = this.factory.getMateriaDocente();
            return materia.listarMateriaDocente();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Estudiante> listarEstudiantesGrupo2(int g) {
        try {
            IEstudianteDao est = this.factory.getEstudiante();
            return est.listarEstudiantesGrupo2(g);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean crearTarea(ArrayList<String> estudiantes, ArrayList<String> grupos,
            String descripcion, java.util.Date fecha, ArrayList<String> url, int idUsuario, String asunto, String materia) {
        boolean b = true;
        String vec[];
        ArrayList<Estudiante> es;
        int cont = 0;
        try {
            ITareaDao tarea = this.factory.getTarea();
            int c = tarea.crearTarea(new Tarea(descripcion, asunto), idUsuario);
            c = c - 1;
            for (String urls : url) {
                ITareaArchivoDao tar = this.factory.getTareaArchivo();
                if (tar.insertarTareaArchivo(new TareaArchivo(c, urls))) {
                    cont++;
                }
            }
            for (String grupo : grupos) {
                IEstudianteDao est = this.factory.getEstudiante();
                vec = grupo.split("-");
                es = est.listarEstudiantesCurso(vec[1].charAt(0), Integer.parseInt(vec[0]));
                for (Estudiante e : es) {
                    if (!estudiantes.contains(String.valueOf(e.getIdUsuario()))) {
                        estudiantes.add(String.valueOf(e.getIdUsuario()));
                    }
                }
            }
            for (String estudiante : estudiantes) {
                ITareaEstudianteDao est = this.factory.getTareaEstudiante();
                if (est.insertarTareaEstudiante(c, Integer.parseInt(estudiante), fecha, materia)) {
                    cont++;
                }
            }
            if (cont == 0) {
                b = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public ArrayList<Tarea> listarTareas() {
        try {
            ITareaDao tarea = this.factory.getTarea();
            tarea.listarTareas();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean existePin(int idEstudiante) {
        boolean p = false;
        Pin pine = null;
        try {
            IPinDao pin = this.factory.getPin();
            pine = pin.getPinUsuario(idEstudiante);
            if (pine != null) {
                if (pine.getEstado().equalsIgnoreCase("activo")) {
                    p = true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(NegocioUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    @Override
    public boolean validarPin(String p, int idEst) {
        try {
            IPinDao pin = this.factory.getPin();
            IPinDao pin2 = this.factory.getPin();

            if (!pin.validarPin(p, idEst)) {

                if (!pin2.actualizarEstadoPin("activo", idEst)) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(NegocioUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean retirarEstudianteAcudiente(long idEstudiante, long idAcudiente) {
        try {
            IAcudienteDao ac = this.factory.getAcudiente();
            return ac.retirarEstudianteAcudiente(idEstudiante, idAcudiente);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean eliminarEstudianteAcudiente(String[] idEstudiante) {
        IAcudienteDao ac;
        int cont = 0;
        try {
            for (String est : idEstudiante) {
                ac = this.factory.getAcudiente();
                if (!ac.eliminarEstudianteAcudiente(Long.parseLong(est))) {
                    cont++;
                }
            }
            if (cont > 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean actualizarProfesion(long idAcudiente, String profesion) {
        try {
            IAcudienteDao ac = this.factory.getAcudiente();
            return ac.actualizarProfesion(idAcudiente, profesion);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean cambiarAcudiente(long idAcudiente1, long idAcudiente2, long idEstudiante) {
        try {
            IAcudienteDao ac = this.factory.getAcudiente();
            return ac.cambiarAcudiente(idAcudiente1, idAcudiente2, idEstudiante);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    public boolean elimingarPagina(int pagina) {
        try {
            IPaginaDao pag = this.factory.getPagina();
            return pag.elimingarPagina(new Pagina(pagina, "", ""));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean actualizarPagina(int id, String nombre, String descripcion) {
        try {
            IPaginaDao pag = this.factory.getPagina();
            return pag.actualizarPagina(new Pagina(id, nombre, descripcion));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    public boolean crearPeriodos(int year, Date fechaInicio1, Date fechaInicio2, Date fechaInicio3, Date fechaInicio4,
            Date fechaFin1, Date fechaFin2, Date fechaFin3, Date fechaFin4) {
        boolean b = true;
        byte cont = 0;
        Periodo p;
        try {
            IPeriodoDao per = this.factory.getPeriodo();
            p = new Periodo((byte) 1, year, fechaInicio1, fechaFin1);
            if (per.insertarPeriodo(p)) {
                cont++;
            }
            per = this.factory.getPeriodo();
            p = new Periodo((byte) 2, year, fechaInicio2, fechaFin2);
            if (per.insertarPeriodo(p)) {
                cont++;
            }
            per = this.factory.getPeriodo();
            p = new Periodo((byte) 3, year, fechaInicio3, fechaFin3);
            if (per.insertarPeriodo(p)) {
                cont++;
            }
            per = this.factory.getPeriodo();
            p = new Periodo((byte) 4, year, fechaInicio4, fechaFin4);
            if (per.insertarPeriodo(p)) {
                cont++;
            }

            if (cont == 0) {
                b = false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NegocioUtil.class.getName()).log(Level.SEVERE, null, ex);
        }

        return b;
    }

    @Override
    public Periodo activarPeriodo() {
        Periodo i = null;
        try {
            IPeriodoDao per = this.factory.getPeriodo();
            boolean b = per.desactivarPeriodo();
            per = this.factory.getPeriodo();
            b = b && per.activarPeriodo();
            i = this.factory.getPeriodo().obtenerPeriodoActivo();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return i;
    }

    @Override
    public ArrayList<Grupo> listarGruposCurso(int idCurso) {
        try {
            IGrupoDao g = this.factory.getGrupo();
            return g.listarGruposCurso(idCurso);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Estudiante> listarEstudianteSinFoto(String grupo) {
        String vec[] = grupo.split("-");
        try {
            IEstudianteDao est = this.factory.getEstudiante();
            return est.listarEstudianteSinFoto(Integer.parseInt(vec[0]), vec[1].charAt(0));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
