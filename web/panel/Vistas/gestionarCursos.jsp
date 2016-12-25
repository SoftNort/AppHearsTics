<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "gestionarCursos.jsp");
    ArrayList<Curso> cursos = controlador.listarCursos();

%>
<html class="no-js" lang="en">

    <head>
        <title> ModularAdmin - Free Dashboard Theme | HTML Version </title>
        <%@include file="AdministrarHtml/Links.jsp" %>
    </head>

    <body>
        <jsp:include page="../validar.jsp" flush="true"/>
        <jsp:include page="../Util/validarPermisos.jsp" flush="true"/>        
        <%@include file="AdministrarHtml/MensajesAlerts.jsp" %>
        <div class="main-wrapper">
            <div class="app" id="app">
                <%@include file="AdministrarHtml/Header.jsp" %>
                <aside class="sidebar">
                    <div class="sidebar-container">
                        <%@include file="AdministrarHtml/Logo.jsp" %>
                        <nav class="menu">
                            <ul class="nav metismenu" id="sidebar-menu">
                                <%@include file="AdministrarHtml/MenuLinks.jsp" %>
                            </ul>
                        </nav>
                    </div>
                    <%@include file="AdministrarHtml/CambiarInterfaz.jsp" %>
                </aside>
                <div class="sidebar-overlay" id="sidebar-overlay"></div>

                <article class="content forms-page">
                    <div class="title-block">
                        <h3 class="title">
                            Gestionar Cursos <a href="javascript:void(0);" onclick="nuevo(1);">Agregar Nuevo</a>
                        </h3>
                        <p class="title-description"> 
                            Agregar y/o modificar cursos
                        </p>
                    </div>
                    <section class="section" id="session-nueva-noticia" style="display: none">
                        <div class="card">
                            <div class="card-block">
                                <div class="title-block">
                                    <h3 class="title">
                                        Crear Nuevo Curso
                                    </h3> 
                                </div>
                                <form action="../UtilVistas/registrarCurso.jsp" method="post" id="frmRegistrarTipoDoc" >
                                    <div class="form-group">
                                        <label for="exampleInputName2">Nombre del Curso</label>
                                        <input type="text" name="descripcion" value="" class="form-control" placeholder="Ej. Primero" required/>
                                    </div>
                                    <button type="submit" class="btn btn-success">Registrar</button>
                                    <button type="button" class="btn btn-danger" style="float: right;" onclick="nuevo(2);">Cancelar</button>
                                </form>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12">
                                <div class="card card-block">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Cursos disponibles
                                        </h3> 
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tr>
                                                <th>Nombre del curso</th>
                                                <th>Disponibilidad</th>
                                                <th>Cambiar Disponibilidad</th>
                                                <th>Eliminar</th>
                                            </tr>
                                            <%  int b;
                                                for (Curso e : cursos) {
                                                    b = 3;
                                            %>
                                            <tr>
                                                <td class="boxBtnMostrarForm">
                                                    <a class="btnMostrarForm">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                    &nbsp;<%=e.getDescripcion()%>
                                                </td>
                                            <form class="formulario" action="../UtilVistas/cursoEditarNombre.jsp" method="POST">
                                                <td class="boxFormulario" style="display: none;">

                                                    <input type="hidden" name="idCurso" value="<%=e.getIdCurso()%>">
                                                    <input type="text" id="descripcion<%=e.getIdCurso()%>" required value="<%=e.getDescripcion()%>" name="descripcion" placeholder="Nombre del Curso">
                                                    <a class="btnEnviarForm" title="Enviar">
                                                        <i class="fa fa-check"></i>
                                                    </a>&nbsp;
                                                    <a class="btnOcultarForm" title="Cerrar">
                                                        <i class="fa fa-times"></i>
                                                    </a>

                                                </td>
                                            </form>
                                            <%if (e.getEstado()) {
                                                    b = 0;
                                            %>
                                            <td style="color: green">Activo</td>
                                            <%} else {
                                                b = 1;
                                            %>
                                            <td style="color: red">Inactivo</td>
                                            <%}
                                            %>
                                            <td>
                                                <a href="../UtilVistas/editarCursos.jsp?modificar=<%=e.getIdCurso() + "-" + b%>&v=1"><i class="fa fa-pencil"></i></a>
                                            </td>
                                            <td>
                                                <a href="../UtilVistas/editarCursos.jsp?eliminar=<%=e.getIdCurso()%>&v=2"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                            </tr>
                                            <%}%>
                                            <% if (cursos.isEmpty()) {%>
                                            <tr>
                                                <td colspan="4"  align="center">No hay cursos registrados</td>
                                            </tr>
                                            <%} else {%>
                                            <%}%>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </article>
                <%@include file="AdministrarHtml/Ventanas.jsp" %>
                <%@include file="AdministrarHtml/Footer.jsp" %>
            </div>
        </div>
        <!-- Reference block for JS -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>
        <script type="text/javascript"  src="../../recursos/js/funciones.js"></script>
    </body>
</html>
