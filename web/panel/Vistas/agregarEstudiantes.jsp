<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "agregarEstudiantes.jsp");
    HttpSession sesion = request.getSession(true);
    if (sesion.getAttribute("grupo") == null) {
        sesion.setAttribute("grupo", request.getParameter("grupo"));
    } else {
        if (request.getParameter("grupo") != null && !request.getParameter("grupo").equals((String) sesion.getAttribute("grupo"))) {
            sesion.setAttribute("grupo", request.getParameter("grupo"));
        }
    }
    String grupo = (String) sesion.getAttribute("grupo");
    String[] v = grupo.split("-");
    Curso dtoCurso = controlador.dtoCursoId(Integer.parseInt(v[0]));
    ArrayList<Estudiante> estudiantesG = controlador.listarEstudianteGrupo(Integer.parseInt(v[0]));
    ArrayList<Estudiante> estudiantesC = controlador.listarEstudianteCurso(Integer.parseInt(v[0]), v[1].charAt(0));
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
                            Agregar Estudiantes al grado <%=dtoCurso.getDescripcion()%>
                        </h3>
                        <p class="title-description"> 
                            Agregar y/o eliminar estudiantes
                        </p>
                    </div>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12">
                                <div class="card card-block sameheight-item">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Grado: <%=dtoCurso.getDescripcion() + " " + v[1]%>
                                        </h3> 
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-6">
                                <form action="../UtilVistas/agregarEstudiantes.jsp" method="post" >
                                    <input type="hidden" value="<%=v[1]%>" name="curso"/>
                                    <input type="hidden" value="<%=v[0]%>" name="grupo"/>
                                    <div class="card card-block sameheight-item">
                                        <div class="title-block">
                                            <h4 class="title">
                                                Estudiantes del Curso: <%=dtoCurso.getDescripcion()%>
                                            </h4> 
                                        </div> 
                                        <section class="example">
                                            <table class="table table-hover">
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Agregar</th>
                                                </tr>
                                                <%if (estudiantesG.isEmpty()) {%>
                                                <td><%="No hay estudiantes registrados en el curso " + dtoCurso.getDescripcion()%></td>
                                                <%} else {
                                                            for (Estudiante e : estudiantesG) {%>
                                                <tr>
                                                    <td><%=e.getNombres() + " " + e.getApellidos()%></td>
                                                    <td>
                                                        <label>
                                                            <input name="agregar" class="checkbox" type="checkbox" value="<%=e.getIdUsuario()%>"/>
                                                            <span><i class="fa fa-check" ></i></span>
                                                        </label>
                                                    </td>
                                                </tr>
                                                <%}
                                                            }%>

                                            </table>
                                            <input type="submit" name="enviar" value="Registrar" class="btn btn-sm btn-success"/>
                                        </section>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6">

                                <div class="card card-block sameheight-item">
                                    <div class="title-block">
                                        <h4 class="title">
                                            Estudiantes en el Grado: <%=dtoCurso.getDescripcion() + " " + v[1]%>
                                        </h4> 
                                    </div> 
                                    <form action="../UtilVistas/quitarEstudiantes.jsp" method="post">
                                        <section class="example">
                                            <table class="table">
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Eliminar</th>
                                                </tr>

                                                <%if (estudiantesC.isEmpty()) {%>
                                                <td colspan="2"><%="No hay estudiantes registrados en el grado " + dtoCurso.getDescripcion()+" " + v[1]%></td>
                                                <%} else {
                                                            for (Estudiante e : estudiantesC) {%>
                                                <tr>
                                                    <td><%=e.getNombres() + " " + e.getApellidos()%></td>
                                                    <td>
                                                        <label>
                                                            <input name="eliminar" class="checkbox" type="checkbox" value="<%=e.getIdUsuario()%>"/>
                                                            <span><i class="fa fa-trash-o"></i></span>
                                                        </label>
                                                    </td>
                                                </tr>
                                                <%}
                                                            }%>
                                            </table>
                                            <input type="submit" name="quitar" value="Quitar" class="btn btn-sm btn-danger"/>
                                        </section>
                                    </form>
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
    </body>
</html>
