package Fachada;

import ClasesDTO.*;

import java.util.ArrayList;
import java.util.Date;

public interface INegocio {

    public String registrarEstudiante(TipoDocumento tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps,
            String nombres, String apellidos, String telefono, String ciudadNacimiento,
            String departamentoNacimiento, String paisNacimiento, String paisActual,
            String usuario, String contra, int grupo, String registrarEstudiante);
    
    public boolean actualizarEstudiante(TipoDocumento tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps,
            String nombres, String apellidos, String telefono, String ciudadNacimiento,
            String departamentoNacimiento, String paisNacimiento, String paisActual, int curso,
            int idEstudiante);

    public boolean registrarUsuario(TipoDocumento tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps,
            String nombres, String apellidos, String telefono, String ciudadNacimiento,
            String departamentoNacimiento, String paisNacimiento, String paisActual,
            String usuario, String contra, int tipoUsuario);
    
    public boolean actualizarUsuario(TipoDocumento tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps,
            String nombres, String apellidos, String telefono, String ciudadNacimiento,
            String departamentoNacimiento, String paisNacimiento, String paisActual, int tipoUsuario, int idUsuario);

    public ArrayList<Estudiante> listarEstudiantes();
    
    public ArrayList<Acudiente> listarAcudientes();
    
    public Estudiante getDtoEstudiante(int idEst);
    
    public Acudiente getDtoAcudiente(int idUsu);
    
    public boolean eliminarUsuario(int idUsuario);
    
    public boolean eliminarAcudiente(int idUsuario, String usuario);
    
    public boolean eliminarEstudiante(int idUsuario);

    public boolean registrarDocente(TipoDocumento tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps,
            String nombres, String apellidos, String telefono, String ciudadNacimiento,
            String departamentoNacimiento, String paisNacimiento, String paisActual,
            String usuario, String contra);

    public boolean registrarAcudiente(TipoDocumento tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps,
            String nombres, String apellidos, String telefono, String ciudadNacimiento,
            String departamentoNacimiento, String paisNacimiento, String paisActual,
            String usuario, String contra, String profesion);
    
    public boolean actualizarAcudiente(TipoDocumento tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps,
            String nombres, String apellidos, String telefono, String ciudadNacimiento,
            String departamentoNacimiento, String paisNacimiento, String paisActual,
            String profesion, int idUsuario);

    public ArrayList<Estudiante> listarEstudianteCurso(int grupo, char curso);
    
    public Curso dtoCursoId(int idCurso);

    public ArrayList<Estudiante> listarEstudianteGrupo(int grupo);

    public boolean asignarCurso(int codEst[], int grupo, char curso);

    public Usuario validarInicio(String nombre, String contra);

    public Usuario getDatosUsuario(int idUsuario);
    
    public ArrayList<Usuario> getUsuariosPorTipo(long idTipo);

    public Pin getPinUsuario(int idUsuario);

    public ArrayList<Pin> listarEstudiantesPinGrupo(int curso, char grupo);

    public ArrayList<Pin> listarEstudiantesPinCurso(int curso);

    public ArrayList<TareaEstudiante> listarTareaEstudiante(long idEstudiante);

    public boolean asignarAcudiente(String e[], String acudiente);

    public ArrayList<TareaArchivo> listarTareaArchivos(Tarea tarea);

    public boolean crearRespuesta(long tarea, long estudiante, String respuesta, ArrayList<String> urls);

    public ArrayList<TareaEstudiante> listarTareaDocente(long idDocente);

    public ArchivoRespuesta obtenerRespuestaEstudiante(long idEstudiante, long idTarea);

    public ArrayList<TareaEstudiante> listarMisTareas(long idEstudiante);

    public ArrayList<Materia> listarMateriaDocente(long idDocente);

    public ArrayList<TareaEstudiante> listarTareasMateria(long idDocente, long idMateria);

    public ArrayList<TareaEstudiante> listarPorAsunto(String asunto);

    public TareaRespuesta listarTareasEstudiante(String tarea);

    public boolean calificarTareasEstudiante(String tarea, float calificacion);

    public boolean asignaAAcudiente(String e[], String acudiente);

    public ArrayList<Estudiante> listarEstudiantesGrupo();

    public boolean actualizarGrupo(int grupo, int idEst);

    public boolean eliminar(String paginas[], int tipo);

    public boolean cambiarContra(long idUsuario, String contra);

    public ArrayList<Usuario> listarUsuarios();

    // Inicio Cabecera Menu Html
    public ArrayList<CabeceraHtml> getCabeceraTitulo();

    public ArrayList<CabeceraHtml> getCabeceraLi(String id);

    public CabeceraHtml getLiXid(String idLi);

    public boolean insertarLi(String idNav, String posicion, String nombre, String url);

    public boolean eliminarLi(String idLi);

    public boolean editarLiPosicion(String idLi, String posicion);

    public boolean editarLiNombre(String idLi, String nombre);

    public boolean editarLiUrl(String idLi, String url);
    // Fin Cabecera Menu Html

    public boolean insertarArchivoNube(ArrayList<String> url, int idMateria);

    public ArrayList<MateriaDocente> listarPorMateria(long idMateria);

    public ArrayList<String> listarArchivosNube(int idMateria);

    // Inicio Slider Superior Html
    public ArrayList<SliderMainHtml> getSlider();

    public boolean registrarSlider(String posicion, String titulo, String descripcion, String link, String http, String imagen);

    public boolean eliminarSlider(String idSlider);

    public boolean editarTexto1(String idSlider, String parrafo1);

    public boolean editarTexto2(String idSlider, String parrafo2);

    public boolean editarTexto3(String idSlider, String parrafo3);
    
    public boolean editarUrlLinkSlider(String idSlider, String urlLink);
    
    public boolean editarPosicionSlider(String idSlider, String posicion);
    
    public boolean editarImagenSlider(String idSlider, String imagen);
    // Fin Slider Superior Html

    // Inicio Clasificados Html
    public ArrayList<ClasificadosHtml> getClasificadosLateral(String lateralidad);

    public boolean registrarClasificado(String lateralidad, String titulo, String parrafo);

    public boolean eliminarClasificado(String idClasificado);

    public boolean editarLateralidad(String idClasificado, String lateralidad);

    public boolean editarTitulo(String idClasificado, String titulo);

    public boolean editarParrafo(String idClasificado, String parrafo);
    // Fin Clasificados Html

    // Inicio Clasificados Links Html
    public ArrayList<ClasificadosLinksHtml> getClasificadosLinksLateral(String idClasificado);

    public boolean registrarLink(String idClasificado, String nombreLink, String tituloLink, String httpLink);

    public boolean eliminarClasificadopadreLink(String idClasificado);

    public boolean eliminarClasificadohijoLink(String idClasificado);

    public boolean editarNombreLink(String idClasificado, String nombreLink);

    public boolean editarTituloLink(String idClasificado, String tituloLink);

    public boolean editarHttpLink(String idClasificado, String httpLink);
    // Fin Clasificados Links Html 

    // Inicio Footer Html
    public ArrayList<FooterHtml> getFooter(String titulo);

    public boolean editarFooterValor(String id, String valor);

    public boolean editarFooterSubtitulo(String id, String subtitulo);

    public boolean editarFooterUrl(String id, String url);
    // Fin Footer Html

    // Inicio Noticias Html
    public ArrayList<NoticiasHtml> getNoticiasPaginas(int pg, int numreg);

    public ArrayList<NoticiasHtml> getNoticiasId(String idNoticia);

    public boolean registrarNoticia(String titulo, String img, String descripcion, String parrafo);

    public boolean eliminarNoticia(String idNoticia);

    public int contarFilas();

    public boolean editarTituloNoticia(String idNoticia, String titulo);

    public boolean editarDescripcionNoticia(String idNoticia, String descripcion);

    public boolean editarParrafoNoticia(String idNoticia, String parrafo);

    public boolean editarImagenNoticia(String idNoticia, String imagen);
    // Fin Noticias 

    // Inicio Paginas Html
    public ArrayList<PaginasHtml> getPaginaXurl(String url);

    public String[] getPaginaXidLi(String idLi);

    public boolean registrarPagina(String idLi, String titulo, String contenido, String imagen);

    public boolean editarPagina(String idLi, String titulo, String contenido, String imagen);
    // Fin de paginas Html

    // Inicio Publicidad Html
    public ArrayList<PublicidadHtml> getDatosPublicidades(String slider);
    
    public boolean registrarPublicidad(String slider, String link, String img, String titulo);
    
    public boolean eliminarPublicidad(String idPubl);
    
    public boolean editarLinkPublicidad(String idPubli, String link);
    
    public boolean editarImgPublicidad(String idPubli, String img);
    
    public boolean editarTituloPublicidad(String idPubli, String titulo);
    // Fin Publicidad Html
    
    public ArrayList<MateriaDocente> listarMateriasGrupo(int idUsuario);
    
     public ArrayList<TareaEstudiante> listarTareasMateria(int tareaDocente, int idEstudiante);
     
     public ArrayList<Materia> listarMateriaDocente(int idDocente);
     
     public ArrayList<TareaEstudiante> listarMisTareasDocente(long idDocente);
     
     public boolean actualizarTarea(int idTarea, String asunto, String descripcion, Date fechaEntrega);
     
     public ArrayList<Acudiente> listarAcudientesEstudiante(int idEstudiante);
     
     public boolean actualizarFoto(int idUsuario, String urlFoto);
}
