package Controlador;

import java.util.Date;
import java.util.ArrayList;
import Fachada.*;
import ClasesDTO.*;
import Negocio.Negocio;
import Negocio.NegocioUtil;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Servicio implements Serializable {

    private final INegocioUtil negocioUtil;
    private final INegocio negocio;
    private ArrayList<TipoDocumento> tipos;

    public Servicio() {
        this.negocioUtil = new NegocioUtil();
        this.negocio = new Negocio();
        this.tipos = new ArrayList<TipoDocumento>();
    }

    public ArrayList<TipoDocumento> cargarDocumentos() {
        this.tipos = this.negocioUtil.cargarTiposDocumento();
        return tipos;
    }

    public ArrayList<Curso> listarCursos() {
        return this.negocioUtil.listarCursos();
    }

    public String registrarUsuario(int tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps, String nombres,
            String apellidos, String telefono, String ciudadNacimiento, String departamentoNacimiento,
            String paisNacimiento, String paisActual, String usuario, String contra, int grupo, String fechaVencimiento) {

        String x = null;
        TipoDocumento t = this.buscarDocumento(tipoDoc);
        if (t != null) {
            x = this.negocio.registrarEstudiante(t, numDoc, correo, fechaNacimiento,
                    tipoSangre, ciudadActual, departamentoActual, genero, eps, nombres,
                    apellidos, telefono, ciudadNacimiento, departamentoNacimiento, paisNacimiento,
                    paisActual, usuario, contra, grupo, fechaVencimiento);
        }
        return x;
    }

    public boolean registrarUser(int tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps, String nombres,
            String apellidos, String telefono, String ciudadNacimiento, String departamentoNacimiento,
            String paisNacimiento, String paisActual, String usuario, String contra, int tipoUsuario) {

        boolean x = true;
        TipoDocumento t = this.buscarDocumento(tipoDoc);
        if (t != null) {
            x = this.negocio.registrarUsuario(t, numDoc, correo, fechaNacimiento,
                    tipoSangre, ciudadActual, departamentoActual, genero, eps, nombres,
                    apellidos, telefono, ciudadNacimiento, departamentoNacimiento, paisNacimiento,
                    paisActual, usuario, contra, tipoUsuario);
        }
        return x;
    }

    public boolean actualizarUser(int tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps, String nombres,
            String apellidos, String telefono, String ciudadNacimiento, String departamentoNacimiento,
            String paisNacimiento, String paisActual, int tipoUsuario, int idUsuario) {

        boolean x = true;
        TipoDocumento t = this.buscarDocumento(tipoDoc);
        if (t != null) {
            x = this.negocio.actualizarUsuario(t, numDoc, correo, fechaNacimiento,
                    tipoSangre, ciudadActual, departamentoActual, genero, eps, nombres,
                    apellidos, telefono, ciudadNacimiento, departamentoNacimiento, paisNacimiento,
                    paisActual, tipoUsuario, idUsuario);
        }
        return x;
    }

    public boolean eliminarUsuario(int idUsuario) {
        return this.negocio.eliminarUsuario(idUsuario);
    }

    public boolean eliminarCarpetaPagina(int c) {
        return this.negocioUtil.eliminarCarpetaPagina(c);
    }

    public boolean editarCarpetaPagina(int c, String nombre, String icono) {
        return this.negocioUtil.editarCarpetaPagina(c, nombre, icono);
    }

    public boolean eliminarAcudiente(int idUsuario, String usuario) {
        return this.negocio.eliminarAcudiente(idUsuario, usuario);
    }

    public boolean eliminarEstudiante(int idUsuario) {
        return this.negocio.eliminarEstudiante(idUsuario);
    }

    public boolean actualizarEstudiante(int tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps, String nombres,
            String apellidos, String telefono, String ciudadNacimiento, String departamentoNacimiento,
            String paisNacimiento, String paisActual, int curso, int idEstudiante) {

        boolean x = true;
        TipoDocumento t = this.buscarDocumento(tipoDoc);
        if (t != null) {
            x = this.negocio.actualizarEstudiante(t, numDoc, correo, fechaNacimiento,
                    tipoSangre, ciudadActual, departamentoActual, genero, eps, nombres,
                    apellidos, telefono, ciudadNacimiento, departamentoNacimiento, paisNacimiento,
                    paisActual, curso, idEstudiante);
        }
        return x;
    }

    private TipoDocumento buscarDocumento(int tipo) {
        for (TipoDocumento t : this.tipos) {
            if (t.getIdTipoDoc() == tipo) {
                return t;
            }
        }
        return null;
    }

    public ArrayList<Estudiante> listarEstudiantes() {
        return this.negocio.listarEstudiantes();
    }

    public Estudiante getdtoEstudiante(int idEst) {
        return this.negocio.getDtoEstudiante(idEst);
    }

    public ArrayList<Acudiente> listarAcudientes() {
        return this.negocio.listarAcudientes();
    }

    public Acudiente getDtoAcudiente(int idUsuario) {
        return this.negocio.getDtoAcudiente(idUsuario);
    }

    public boolean actualizarAcudiente(int tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps, String nombres,
            String apellidos, String telefono, String ciudadNacimiento, String departamentoNacimiento,
            String paisNacimiento, String paisActual, String profesion, int idUsuario) {
        boolean x = true;
        TipoDocumento t = this.buscarDocumento(tipoDoc);
        if (t != null) {
            x = this.negocio.actualizarAcudiente(t, numDoc, correo, fechaNacimiento,
                    tipoSangre, ciudadActual, departamentoActual, genero, eps, nombres,
                    apellidos, telefono, ciudadNacimiento, departamentoNacimiento, paisNacimiento,
                    paisActual, profesion, idUsuario);
        }
        return x;
    }

    public ArrayList<Usuario> getUsuariosPorTipo(long idtipo) {
        return this.negocio.getUsuariosPorTipo(idtipo);
    }

    public boolean registrarDocumento(String nombre) {
        return this.negocioUtil.registrarDocumento(nombre);
    }

    public String eliminarTipoDoc(String[] eliminar) {
        return this.negocioUtil.eliminarTipoDoc(eliminar);
    }

    public boolean registrarDocente(int tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps, String nombres,
            String apellidos, String telefono, String ciudadNacimiento, String departamentoNacimiento,
            String paisNacimiento, String paisActual, String usuario, String contra) {

        boolean x = true;
        TipoDocumento t = this.buscarDocumento(tipoDoc);
        if (t != null) {
            x = this.negocio.registrarDocente(t, numDoc, correo, fechaNacimiento,
                    tipoSangre, ciudadActual, departamentoActual, genero, eps, nombres,
                    apellidos, telefono, ciudadNacimiento, departamentoNacimiento, paisNacimiento,
                    paisActual, usuario, contra);
        }
        return x;

    }

    public boolean registrarAcudiente(int tipoDoc, String numDoc, String correo,
            Date fechaNacimiento, String tipoSangre, String ciudadActual,
            String departamentoActual, String genero, String eps, String nombres,
            String apellidos, String telefono, String ciudadNacimiento, String departamentoNacimiento,
            String paisNacimiento, String paisActual, String usuario, String contra, String profesion) {

        boolean x = true;
        TipoDocumento t = this.buscarDocumento(tipoDoc);
        if (t != null) {
            x = this.negocio.registrarAcudiente(t, numDoc, correo, fechaNacimiento,
                    tipoSangre, ciudadActual, departamentoActual, genero, eps, nombres,
                    apellidos, telefono, ciudadNacimiento, departamentoNacimiento, paisNacimiento,
                    paisActual, usuario, contra, profesion);
        }
        return x;

    }

    public ArrayList<Docente> listarDocentes() {
        return this.negocioUtil.listarDocentes();
    }

    public boolean registarCurso(String descripcion) {
        return this.negocioUtil.registarCurso(descripcion);
    }

    public boolean eliminarCursos(String v[]) {
        Curso cursos[] = new Curso[v.length];
        for (int i = 0; i < v.length; i++) {
            cursos[i] = new Curso(Integer.parseInt(v[i]));
        }
        return this.negocioUtil.eliminarCurso(cursos);
    }

    public boolean editarDescripcionCurso(int id, String descripcion) {
        return this.negocioUtil.editarDescripcionCurso(id, descripcion);
    }

    public boolean modificarCurso(String v[]) {
        Curso cursos[] = new Curso[v.length];
        String[] vec;
        boolean c;
        for (int i = 0; i < v.length; i++) {
            c = false;
            if (!v[i].isEmpty()) {
                vec = v[i].split("-");
                if (vec[1].equals("0")) {
                    c = true;
                }
                cursos[i] = new Curso(Integer.parseInt(vec[0]), c, "");
            }
        }
        return this.negocioUtil.cambiarGrupo(cursos);
    }

    public boolean crearGrupo(char grupo, int curso, int titular) {
        return this.negocioUtil.crearGrupo(grupo, curso, titular);
    }

    public ArrayList<Grupo> listarGrupos() {
        return this.negocioUtil.listarGrupos();
    }

    public ArrayList<Grupo> listarGruposByCurso(int idCurso) {
        return this.negocioUtil.listarGruposByCurso(idCurso);
    }

    public ArrayList<Estudiante> listarEstudianteGrupo(int grupo) {
        return this.negocio.listarEstudianteGrupo(grupo);
    }

    public ArrayList<Estudiante> listarEstudianteCurso(int grupo, char curso) {
        return this.negocio.listarEstudianteCurso(grupo, curso);
    }

    public Curso dtoCursoId(int idCurso) {
        return this.negocio.dtoCursoId(idCurso);
    }

    public boolean asignarCurso(String codEst[], int grupo, char curso) {
        int vec[] = new int[codEst.length];
        for (int i = 0; i < codEst.length; i++) {
            vec[i] = Integer.parseInt(codEst[i]);
        }
        return this.negocio.asignarCurso(vec, grupo, curso);
    }

    public boolean quitarEstudiantes(String estudiantes[]) {
        return this.negocioUtil.quitarEstudiantes(estudiantes);
    }

    public boolean registrarTipoUsuario(String rol) {
        return this.negocioUtil.registrarTipoUsuario(rol);
    }

    public ArrayList<TipoUsuario> listarTiposUsuario() {
        return this.negocioUtil.listarTiposUsuario();
    }

    public boolean eliminarTipoUsuario(String[] tipos) {
        return this.negocioUtil.eliminarTipoUsuario(tipos);
    }

    public Usuario validarInicio(String nombre, String contra) {
        return this.negocio.validarInicio(nombre, contra);
    }

    public boolean registrarCarpetaPagina(String nombre, String icono) {
        return this.negocioUtil.registrarCarpetaPagina(nombre, icono);
    }

    public ArrayList<CarpetaPagina> listarCarpetasPaginas() {
        return this.negocioUtil.getlistaCarpetasPaginas();
    }

    public boolean registrarPagina(String nombre, String descripcion, int carpeta) {
        return this.negocioUtil.registrarPagina(nombre, descripcion, carpeta);
    }

    public ArrayList<Pagina> listarPaginas() {
        return this.negocioUtil.listarPaginas();
    }

    public ArrayList<PaginaTipoUsuario> listarPaginasDiferentes(int idCarpeta) {
        return this.negocioUtil.listarPaginasDiferentes(idCarpeta);
    }

    

    public ArrayList<PaginaTipoUsuario> listarPaginasIguales(int idCarpeta) {
        return this.negocioUtil.listarPaginasIguales(idCarpeta);
    }

    public ArrayList<Pagina> listasPaginasCarpetas(int carpeta) {
        return this.negocioUtil.listarPaginasCarpeta(carpeta);
    }

    public ArrayList<PaginaTipoUsuario> listarPaginasTipoUsuario(int tipo) {
        return this.negocioUtil.listarPaginasTipoUsuario(tipo);
    }

    public ArrayList<PaginaTipoUsuario> listarCarpetasTipoUsuario(int tipo) {
        return this.negocioUtil.listarCarpetasTipoUsuario(tipo);
    }

    public ArrayList<PaginaTipoUsuario> listarPaginasIdCarpetas(long tipo, int carpeta) {
        return this.negocioUtil.listarPaginasIdCarpeta(tipo, carpeta);
    }

    public ArrayList<PaginaTipoUsuario> listarPaginasSinCarpeta(int tipo) {
        return this.negocioUtil.listarPaginasSinCarpeta(tipo);
    }

    public ArrayList<PaginaTipoUsuario> listarPaginas(int tipo) {
        return this.negocioUtil.listarPaginas(tipo);
    }

    public boolean agregarPermisos(int idRol, String[] paginas) {
        return this.negocioUtil.agregarPermisos(idRol, paginas);
    }
    
    public boolean actualizarPaginaCarpeta(int carpeta, String[] idPagina) {
        return this.negocioUtil.actualizarPaginaCarpeta(carpeta, idPagina);
    }

    public TipoUsuario listar(int tipo) {
        return this.negocioUtil.listar(tipo);
    }

    public boolean registrarMateria(String nombre) {
        return this.negocioUtil.registrarMateria(nombre);
    }

    public boolean editarMateria(int id, String nombre) {
        return this.negocioUtil.editarMateria(id, nombre);
    }

    public ArrayList<Materia> listarMaterias() {
        return this.negocioUtil.listarMaterias();
    }

    public boolean eliminarMateria(String[] materias) {
        return this.negocioUtil.eliminarMateria(materias);
    }

    public ArrayList<MateriaDocente> listarMateriaDocente() {
        return this.negocioUtil.listarMateriaDocente();
    }

    public boolean registrarMateriaDocente(int idDocente, int idMateria, int idCuros, char curso) {
        return this.negocioUtil.registrarMateriaDocente(idDocente, idMateria, idCuros, curso);
    }

    public ArrayList<Estudiante> listarEstudiantesGrupo2(int g) {
        return this.negocioUtil.listarEstudiantesGrupo2(g);
    }

    public boolean existePin(int idEstudiante) {
        return this.negocioUtil.existePin(idEstudiante);
    }

    public Pin pinEstudiante(int idEstudiante) {
        return this.negocio.getPinUsuario(idEstudiante);
    }

    public ArrayList<Pin> listarEstudiantesPinCurso(int curso) {
        return this.negocio.listarEstudiantesPinCurso(curso);
    }

    public ArrayList<Pin> listarEstudiantesPinGrupo(int curso, char grupo) {
        return this.negocio.listarEstudiantesPinGrupo(curso, grupo);
    }

    public boolean activarPin(String pin, int idEst) {
        return this.negocioUtil.validarPin(pin, idEst);
    }

    public Usuario datosUsuario(int idUsuario) {
        return this.negocio.getDatosUsuario(idUsuario);
    }

    public String imprimirPin(int idUser) {
        return null;
    }

    public boolean registrarTarea(ArrayList<String> estudiantes, ArrayList<String> grupos,
            ArrayList<String> urls, String descripcion, String fechaEntrega, int idUsuario, String asunto, String materia) {
        try {
            SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = null;
            if (fechaEntrega != null && !fechaEntrega.isEmpty()) {
                fecha = formatoDelTexto.parse(fechaEntrega);
            }
            this.negocioUtil.crearTarea(estudiantes, grupos, descripcion, fecha, urls, idUsuario, asunto, materia);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<TareaEstudiante> listarTareaEstudiante(long idEstudiante) {
        return this.negocio.listarTareaEstudiante(idEstudiante);
    }

    public boolean asignarAcudiente(String e[], String acudiente) {
        return this.negocio.asignarAcudiente(e, acudiente);
    }

    public ArrayList<TareaArchivo> listarTareaArchivos(Tarea tarea) {
        return this.negocio.listarTareaArchivos(tarea);
    }

    public boolean crearRespuesta(long tarea, long estudiante, String respuesta, ArrayList<String> urls) {
        return this.negocio.crearRespuesta(tarea, estudiante, respuesta, urls);
    }

    public ArrayList<TareaEstudiante> listarTareaDocente(long idDocente) {
        return this.negocio.listarTareaDocente(idDocente);
    }

    public ArchivoRespuesta obtenerRespuestaEstudiante(long idEstudiante, long idTarea) {
        return this.negocio.obtenerRespuestaEstudiante(idEstudiante, idTarea);
    }

    public boolean editarPin(String fechaInicio, String fechaFin, String idPin, String estado, int idEst) {
        return this.negocioUtil.editarPin(fechaInicio, fechaFin, idPin, estado, idEst);
    }

    public ArrayList<TareaEstudiante> listarMisTareas(long idEstudiante) {
        return this.negocio.listarMisTareas(idEstudiante);
    }

    public ArrayList<Materia> listarMateriaDocente(long idDocente) {
        return this.negocio.listarMateriaDocente(idDocente);
    }

    public ArrayList<TareaEstudiante> listarTareasMateria(long idDocente, long idMateria) {
        return this.negocio.listarTareasMateria(idDocente, idMateria);
    }

    public ArrayList<TareaEstudiante> listarPorAsunto(String asunto) {
        return this.negocio.listarPorAsunto(asunto);
    }

    public TareaRespuesta listarTareasEstudiante(String tarea) {
        return this.negocio.listarTareasEstudiante(tarea);
    }

    public boolean calificarTareasEstudiante(String tarea, float calificacion) {
        return this.negocio.calificarTareasEstudiante(tarea, calificacion);
    }

    public boolean asignarAAcudiente(String e[], String acudiente) {
        return this.negocio.asignaAAcudiente(e, acudiente);
    }

    public ArrayList<Estudiante> listarEstudiantesGrupo() {
        return this.negocio.listarEstudiantesGrupo();
    }

    public boolean actualizarGrupoEstudiante(int g, int idEst) {
        return this.negocio.actualizarGrupo(g, idEst);
    }

    public boolean eliminar(String paginas[], int tipo) {
        return this.negocio.eliminar(paginas, tipo);
    }

    public boolean eliminarEstudianteAcudiente(String[] idEstudiante) {
        return this.negocioUtil.eliminarEstudianteAcudiente(idEstudiante);
    }

    public boolean retirarEstudianteAcudiente(long idEstudiante, long idAcudiente) {
        return this.negocioUtil.retirarEstudianteAcudiente(idEstudiante, idAcudiente);
    }

    public boolean actualizarProfesion(long idAcudiente, String profesion) {
        return this.actualizarProfesion(idAcudiente, profesion);
    }

    public boolean cambiarAcudiente(long idAcudiente1, long idAcudiente2, long idEstudiante) {
        return this.negocioUtil.cambiarAcudiente(idAcudiente1, idAcudiente2, idEstudiante);
    }

    public boolean elimingarPagina(int paginas) {
        return this.negocioUtil.elimingarPagina(paginas);
    }

    public boolean actualizarPagina(int id, String nombre, String descripcion) {
        return this.negocioUtil.actualizarPagina(id, nombre, descripcion);
    }

    public boolean cambiarContra(long idUsuario, String contra) {
        return this.negocio.cambiarContra(idUsuario, contra);
    }

    public ArrayList<Usuario> listarUsuarios() {
        return this.negocio.listarUsuarios();
    }

    // Inicio Cabecera Html
    public ArrayList<CabeceraHtml> getCabeceraTitulo() {
        return this.negocio.getCabeceraTitulo();
    }

    public ArrayList<CabeceraHtml> getCabeceraLi(String id) {
        return this.negocio.getCabeceraLi(id);
    }

    public CabeceraHtml getLiXid(String idLi) {
        return this.negocio.getLiXid(idLi);
    }

    public boolean insertarLi(String idNav, String posicion, String nombre, String url) {
        return this.negocio.insertarLi(idNav, posicion, nombre, url);
    }

    public boolean eliminarLi(String idLi) {
        return this.negocio.eliminarLi(idLi);
    }

    public boolean editarLiPosicion(String idLi, String posicion) {
        return this.negocio.editarLiPosicion(idLi, posicion);
    }

    public boolean editarLiNombre(String idLi, String nombre) {
        return this.negocio.editarLiNombre(idLi, nombre);
    }

    public boolean editarLiUrl(String idLi, String url) {
        return this.negocio.editarLiUrl(idLi, url);
    }

    // Fin Cabecera Html
    public boolean insertarArchivoNube(ArrayList<String> url, int idMateria) {
        return this.negocio.insertarArchivoNube(url, idMateria);
    }

    public ArrayList<MateriaDocente> listarPorMateria(long idMateria) {
        return this.negocio.listarPorMateria(idMateria);
    }

    public ArrayList<String> listarArchivosNube(int idMateria) {
        return this.negocio.listarArchivosNube(idMateria);
    }

    // Inicio slider Main Html    
    public ArrayList<SliderMainHtml> getSlider() {
        return this.negocio.getSlider();
    }

    public boolean registrarSlider(String posicion, String titulo, String descripcion, String link, String http, String imagen) {
        return this.negocio.registrarSlider(posicion, titulo, descripcion, link, http, imagen);
    }

    public boolean eliminarSlider(String idSlider) {
        return this.negocio.eliminarSlider(idSlider);
    }

    public boolean editarTexto1(String idSlider, String parrafo1) {
        return this.negocio.editarTexto1(idSlider, parrafo1);
    }

    public boolean editarTexto2(String idSlider, String parrafo2) {
        return this.negocio.editarTexto2(idSlider, parrafo2);
    }

    public boolean editarTexto3(String idSlider, String parrafo3) {
        return this.negocio.editarTexto3(idSlider, parrafo3);
    }

    public boolean editarUrlLinkSlider(String idSlider, String urlLink) {
        return this.negocio.editarUrlLinkSlider(idSlider, urlLink);
    }

    public boolean editarPosicionSlider(String idSlider, String posicion) {
        return this.negocio.editarPosicionSlider(idSlider, posicion);
    }

    public boolean editarImagenSlider(String idSlider, String imagen) {
        return this.negocio.editarImagenSlider(idSlider, imagen);
    }
    // Fin Slider Main Html

    // Inicio Clasificados Html
    public ArrayList<ClasificadosHtml> getClasificadosLateral(String lateralidad) {
        return this.negocio.getClasificadosLateral(lateralidad);
    }

    public boolean registrarClasificado(String lateralidad, String titulo, String parrafo) {
        return this.negocio.registrarClasificado(lateralidad, titulo, parrafo);
    }

    public boolean eliminarClasificado(String idClasificado) {
        return this.negocio.eliminarClasificado(idClasificado);
    }

    public boolean editarLateralidad(String idClasificado, String lateralidad) {
        return this.negocio.editarLateralidad(idClasificado, lateralidad);
    }

    public boolean editarTitulo(String idClasificado, String titulo) {
        return this.negocio.editarTitulo(idClasificado, titulo);
    }

    public boolean editarParrafo(String idClasificado, String parrafo) {
        return this.negocio.editarParrafo(idClasificado, parrafo);
    }
    // Fin Clasificados Html

    // Inicio Clasificados Links Html
    public ArrayList<ClasificadosLinksHtml> getClasificadosLinksLateral(String idClasificado) {
        return this.negocio.getClasificadosLinksLateral(idClasificado);
    }

    public boolean registrarLink(String idClasificado, String nombreLink, String tituloLink, String httpLink) {
        return this.negocio.registrarLink(idClasificado, nombreLink, tituloLink, httpLink);
    }

    public boolean eliminarClasificadopadreLink(String idClasificado) {
        return this.negocio.eliminarClasificadopadreLink(idClasificado);
    }

    public boolean eliminarClasificadohijoLink(String idClasificado) {
        return this.negocio.eliminarClasificadohijoLink(idClasificado);
    }

    public boolean editarNombreLink(String idClasificado, String nombreLink) {
        return this.negocio.editarNombreLink(idClasificado, nombreLink);
    }

    public boolean editarTituloLink(String idClasificado, String tituloLink) {
        return this.negocio.editarTituloLink(idClasificado, tituloLink);
    }

    public boolean editarHttpLink(String idClasificado, String httpLink) {
        return this.negocio.editarHttpLink(idClasificado, httpLink);
    }
    // Fin Clasificados Links Html

    // Inicio Footer Html
    public ArrayList<FooterHtml> getFooter(String titulo) {
        return this.negocio.getFooter(titulo);
    }

    public boolean editarFooterValor(String id, String valor) {
        return this.negocio.editarFooterValor(id, valor);
    }

    public boolean editarFooterSubtitulo(String id, String subtitulo) {
        return this.negocio.editarFooterSubtitulo(id, subtitulo);
    }

    public boolean editarFooterUrl(String id, String url) {
        return this.negocio.editarFooterUrl(id, url);
    }
    // Fin Footer Html

    // Inicio Noticias Html 
    public ArrayList<NoticiasHtml> getNoticiasPaginas(int pg, int numreg) {
        return this.negocio.getNoticiasPaginas(pg, numreg);
    }

    public ArrayList<NoticiasHtml> getNoticiasId(String idNoticia) {
        return this.negocio.getNoticiasId(idNoticia);
    }

    public boolean registrarNoticia(String titulo, String img, String descripcion, String parrafo) {
        return this.negocio.registrarNoticia(titulo, img, descripcion, parrafo);
    }

    public boolean eliminarNoticia(String idNoticia) {
        return this.negocio.eliminarNoticia(idNoticia);
    }

    public int contarFilas() {
        return this.negocio.contarFilas();
    }

    public boolean editarTituloNoticia(String idNoticia, String titulo) {
        return this.negocio.editarTituloNoticia(idNoticia, titulo);
    }

    public boolean editarDescripcionNoticia(String idNoticia, String descripcion) {
        return this.negocio.editarDescripcionNoticia(idNoticia, descripcion);
    }

    public boolean editarParrafoNoticia(String idNoticia, String parrafo) {
        return this.negocio.editarParrafoNoticia(idNoticia, parrafo);
    }

    public boolean editarImagenNoticia(String idNoticia, String imagen) {
        return this.negocio.editarImagenNoticia(idNoticia, imagen);
    }
    // Fin Noticias Html 

    // Inicio Paginas Html
    public ArrayList<PaginasHtml> getPaginaXurl(String url) {
        return this.negocio.getPaginaXurl(url);
    }

    public String[] getPaginaXidLi(String idLi) {
        return this.negocio.getPaginaXidLi(idLi);
    }

    public boolean registrarPagina(String idLi, String titulo, String contenido, String imagen) {
        return this.negocio.registrarPagina(idLi, titulo, contenido, imagen);
    }

    public boolean editarPagina(String idLi, String titulo, String contenido, String imagen) {
        return this.negocio.editarPagina(idLi, titulo, contenido, imagen);
    }
    // Fin Paginas Html

    // Inicio Publicidad Html
    public ArrayList<PublicidadHtml> getDatosPublicidades(String slider) {
        return this.negocio.getDatosPublicidades(slider);
    }

    public boolean registrarPublicidad(String slider, String link, String img, String titulo) {
        return this.negocio.registrarPublicidad(slider, link, img, titulo);
    }

    public boolean eliminarPublicidad(String idPubl) {
        return this.negocio.eliminarPublicidad(idPubl);
    }

    public boolean editarLinkPublicidad(String idPubli, String link) {
        return this.negocio.editarLinkPublicidad(idPubli, link);
    }

    public boolean editarImgPublicidad(String idPubli, String img) {
        return this.negocio.editarImgPublicidad(idPubli, img);
    }

    public boolean editarTituloPublicidad(String idPubli, String titulo) {
        return this.negocio.editarTituloPublicidad(idPubli, titulo);
    }
    // Fin Publicidad Html

    public ArrayList<MateriaDocente> listarMateriasGrupo(int idUsuario) {
        return this.negocio.listarMateriasGrupo(idUsuario);
    }

    public ArrayList<TareaEstudiante> listarTareasMateria(int tareaDocente, int idEstudiante) {
        return this.negocio.listarTareasMateria(tareaDocente, idEstudiante);
    }

    public boolean crearPeriodos(int year, Date fechaInicio1, Date fechaInicio2, Date fechaInicio3, Date fechaInicio4,
            Date fechaFin1, Date fechaFin2, Date fechaFin3, Date fechaFin4) {
        return this.negocioUtil.crearPeriodos(year, fechaInicio1, fechaInicio2, fechaInicio3, fechaInicio4, fechaFin1, fechaFin2, fechaFin3, fechaFin4);
    }

    public Periodo activarPeriodo() {
        return this.negocioUtil.activarPeriodo();
    }

    public ArrayList<Materia> listarMateriaDocenteGrupos(int idDocente) {
        return this.negocio.listarMateriaDocente(idDocente);
    }

    public ArrayList<TareaEstudiante> listarMisTareasDocente(long idDocente) {
        return this.negocio.listarMisTareasDocente(idDocente);
    }

    public boolean actualizarTarea(int idTarea, String asunto, String descripcion, Date fechaEntrega) {
        return this.negocio.actualizarTarea(idTarea, asunto, descripcion, fechaEntrega);
    }

    public ArrayList<Acudiente> listarAcudientesEstudiante(int idEstudiante) {
        return this.negocio.listarAcudientesEstudiante(idEstudiante);
    }

    public ArrayList<Grupo> listarGruposCurso(int idCurso) {
        return this.negocioUtil.listarGruposCurso(idCurso);
    }

    public ArrayList<Estudiante> listarEstudianteSinFoto(String grupo) {
        return this.negocioUtil.listarEstudianteSinFoto(grupo);
    }

    public boolean actualizarFoto(int idUsuario, String urlFoto) {
        return this.negocio.actualizarFoto(idUsuario, urlFoto);
    }
}
