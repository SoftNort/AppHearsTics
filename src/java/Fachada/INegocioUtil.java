package Fachada;

import ClasesDTO.*;
import java.util.Date;
import java.util.ArrayList;

public interface INegocioUtil {
    
    public ArrayList<TipoDocumento> cargarTiposDocumento();
    
    public boolean registrarDocumento(String nombre);
    
    public String eliminarTipoDoc(String []eliminar);
    
    public ArrayList<Curso> listarCursos();
    
    public ArrayList<Docente> listarDocentes();
    
    public boolean registarCurso(String descripcion);
    
    public boolean eliminarCurso(Curso []cursos);
    
    public boolean editarDescripcionCurso(int id, String descripcion);
    
    public boolean cambiarGrupo(Curso []cursos);
    
    public boolean crearGrupo(char grup, int curso, int titular);
     
    public ArrayList<Grupo> listarGrupos();
    
    public ArrayList<Grupo> listarGruposByCurso(int idCurso);
    
    public boolean quitarEstudiantes(String estudiantes[]);
    
    public boolean registrarTipoUsuario(String rol);
    
    public ArrayList<TipoUsuario> listarTiposUsuario();
    
    public boolean eliminarTipoUsuario(String tipos[]);
    
    public boolean registrarCarpetaPagina(String nombre, String icono);
    
    public boolean eliminarCarpetaPagina(int c);
    
    public boolean editarCarpetaPagina(int c, String nombre, String icono);
    
    public ArrayList<CarpetaPagina> getlistaCarpetasPaginas();
    
    public boolean registrarPagina(String nombre, String descripcion, int carpeta);
    
    public ArrayList<Pagina> listarPaginas();
    
    public ArrayList<PaginaTipoUsuario> listarPaginasDiferentes(int idCarpeta);
    
    public ArrayList<PaginaTipoUsuario> listarPaginasIguales(int idCarpeta);
    
    public boolean actualizarPaginaCarpeta(int carpeta, String[] idPagina);
    
    public ArrayList<Pagina> listarPaginasCarpeta(int carpeta);
    
    public ArrayList<PaginaTipoUsuario> listarPaginas(int tipo);
    
    public ArrayList<PaginaTipoUsuario> listarPaginasTipoUsuario(int tipo);
    
    public ArrayList<PaginaTipoUsuario> listarCarpetasTipoUsuario(int tipo);
    
    public ArrayList<PaginaTipoUsuario> listarPaginasSinCarpeta(int tipo);
    
    public ArrayList<PaginaTipoUsuario> listarPaginasIdCarpeta(long tipo, int carpeta);
    
    public boolean agregarPermisos(int idRol, String []paginas);
    
    public TipoUsuario listar(int tipo);
    
    public boolean registrarMateria(String nombre);
    
    public ArrayList<Materia> listarMaterias();
    
    public boolean eliminarMateria(String materias[]);
    
    public boolean editarMateria(int id, String nombre);
    
    public boolean registrarMateriaDocente(int idDocente, int idMateria, int idCuros, char curso);
    
    public ArrayList<MateriaDocente> listarMateriaDocente();

    public ArrayList<Estudiante> listarEstudiantesGrupo2(int g);
    
    public boolean crearTarea(ArrayList<String> estudiantes, ArrayList<String> grupos, String descripcion, Date fecha, ArrayList<String> url, int idUsuario, String asunto, String materia);
    
    public ArrayList<Tarea> listarTareas();

    public boolean existePin(int idEstudiante);
    
    public boolean validarPin(String p, int idEst);
    
    public boolean editarPin(String fechaInicio, String fechaFin, String idPin, String estado, int idEst);
    
    public boolean eliminarEstudianteAcudiente(String[] idEstudiante);
    
    public boolean retirarEstudianteAcudiente(long idEstudiante, long idAcudiente);
    
    public boolean actualizarProfesion(long idAcudiente, String profesion);
    
    public boolean cambiarAcudiente(long idAcudiente1, long idAcudiente2, long idEstudiante);
    
    public boolean elimingarPagina(int paginas);
    
    public boolean actualizarPagina(int id, String nombre, String descripcion);
    
    public boolean crearPeriodos(int year, Date fechaInicio1, Date fechaInicio2, Date fechaInicio3, Date fechaInicio4,
    Date fechaFin1, Date fechaFin2, Date fechaFin3, Date fechaFin4);
    
    public Periodo activarPeriodo();
    
    public ArrayList<Grupo> listarGruposCurso(int idCurso);
    
    public ArrayList<Estudiante> listarEstudianteSinFoto(String grupo);
}