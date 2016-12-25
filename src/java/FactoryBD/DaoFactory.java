package FactoryBD;

import ClasesDTO.NoticiasHtml;
import MySQLDao.*;
import java.io.Serializable;
import java.sql.SQLException;

public class DaoFactory implements Serializable {

    public TipoDocumentoDao getTipoDocumento() throws SQLException {
        return new TipoDocumentoDao();
    }

    public UsuarioDao getUsuario() throws SQLException {
        return new UsuarioDao();
    }

    public EstudianteDao getEstudiante() throws SQLException {
        return new EstudianteDao();
    }

    public AcudienteDao getAcudiente() throws SQLException {
        return new AcudienteDao();
    }

    public DocenteDao getDocente() throws SQLException {
        return new DocenteDao();
    }

    public MateriaDao getMateria() throws SQLException {
        return new MateriaDao();
    }

    public CursoDao getCurso() throws SQLException {
        return new CursoDao();
    }

    public GrupoDao getGrupo() throws SQLException {
        return new GrupoDao();
    }

    public TipoUsuarioDao getTipoUsuario() throws SQLException {
        return new TipoUsuarioDao();
    }

    public CarpetaPaginaDao getCarpetaPagina() throws SQLException {
        return new CarpetaPaginaDao();
    }

    public PaginaDao getPagina() throws SQLException {
        return new PaginaDao();
    }

    public PaginaTipoUsuarioDao getPaginaTipoUsuario() throws SQLException {
        return new PaginaTipoUsuarioDao();
    }

    public MateriaDocenteDao getMateriaDocente() throws SQLException {
        return new MateriaDocenteDao();
    }

    public TareaDao getTarea() throws SQLException {
        return new TareaDao();
    }

    public TareaArchivoDao getTareaArchivo() throws SQLException {
        return new TareaArchivoDao();
    }

    public PinDao getPin() throws SQLException {
        return new PinDao();
    }

    public TareaEstudianteDao getTareaEstudiante() throws SQLException {
        return new TareaEstudianteDao();
    }

    public TareaRespuestaDao getTareaRespuesta() throws SQLException {
        return new TareaRespuestaDao();
    }

    public ArchivoRespuestaDao getArchivoRespuesta() throws SQLException {
        return new ArchivoRespuestaDao();
    }

    public CabeceraHtmlDao getCabeceraHtml() throws SQLException {
        return new CabeceraHtmlDao();
    }

    public ArchivoNubeDao getArchivoNube() throws SQLException {
        return new ArchivoNubeDao();
    }

    public SliderMainHtmlDao getSliderMainHtml() throws SQLException {
        return new SliderMainHtmlDao();
    }

    public ClasificadosHtmlDao getClasificadosHtml() throws SQLException {
        return new ClasificadosHtmlDao();
    }

    public ClasificadosLinksHtmlDao getClasificadosLinksHtml() throws SQLException {
        return new ClasificadosLinksHtmlDao();
    }

    public FooterHtmlDao getFooterHtml() throws SQLException {
        return new FooterHtmlDao();
    }

    public NoticiasHtmlDao getNoticiaHtml() throws SQLException {
        return new NoticiasHtmlDao();
    }

    public PaginasHtmlDao getPaginasHtml() throws SQLException {
        return new PaginasHtmlDao();
    }

    public PublicidadHtmlDao getPublicidadHtml() throws SQLException {
        return new PublicidadHtmlDao();
    }

    public PeriodoDao getPeriodo() throws SQLException{
        return new PeriodoDao();
    }
}
