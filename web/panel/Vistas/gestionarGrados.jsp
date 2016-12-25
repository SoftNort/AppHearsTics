<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "gestionarGrados.jsp");
    HttpSession sesion = request.getSession(true);
    if (sesion.getAttribute("grupo") != null) {
        sesion.setAttribute("grupo", null);
    }
    ArrayList<Curso> cursos = controlador.listarCursos();
    ArrayList<Grupo> grupos = controlador.listarGrupos();
    ArrayList<Docente> docentes = controlador.listarDocentes();
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
                            Gestionar Grados <a href="javascript:void(0);" onclick="nuevo(1);">Agregar Nuevo</a>
                        </h3>
                        <p class="title-description"> 
                            Agregar y/o modificar grados
                        </p>
                    </div>
                    <section class="section" id="session-nueva-noticia" style="display: none">
                        <div class="card">
                            <div class="card-block">
                                <div class="title-block">
                                    <h3 class="title">
                                        Registrar un nuevo grado
                                    </h3> 
                                </div>
                                <form id="frmEliminarTipoDoc" action="../UtilVistas/registrarGrado.jsp" method="post">
                                    <div class="form-group">
                                        <label>Curso</label>
                                        <select name="grupo" class="form-control">
                                            <option value="">Seleccione el curso</option>
                                            <%  for (Curso e : cursos) {
                                            %><option value="<%=e.getIdCurso()%>"><%=e.getDescripcion()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Letra del Grado</label>
                                        <select name="letra" class="form-control">
                                            <option value="">Seleccione la letra del grado</option>
                                            <% char x = 'A';
                                                while (x <= 'Z') {
                                            %><option value="<%=x%>"><%=x%></option>
                                            <%x++;
                                                }%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Titular</label>
                                        <select name="titular" class="form-control">
                                            <option value="">Seleccione el titular del grado</option>
                                            <%  for (Docente e : docentes) {
                                            %><option value="<%=e.getIdUsuario()%>"><%=e.getNombres() + " " + e.getApellidos()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <input type="submit" name="guardarCambios" value="Crear"  class="btn btn-success"/>
                                    <button type="button" class="btn btn-danger" style="float: right;" onclick="nuevo(2);">Cancelar</button>
                                </form>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12">
                                <div class="card card-block sameheight-item">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Grados disponibles
                                        </h3> 
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                                <th>Nombre del Curso</th>
                                                <th>Letra del Grado</th>
                                                <th>Titular</th>
                                                <th>Agregar Estudiantes</th>                                                    
                                            </tr>
                                            <%for (Grupo e : grupos) {%>
                                            <tr>
                                                <td><%=e.getIdCurso().getDescripcion()%></td>
                                                <td><%=e.getIdGrupo()%></td>
                                                <td><%=e.getTitular().getNombres() + " " + e.getTitular().getApellidos()%></td>  
                                                <td><a href="agregarEstudiantes.jsp?grupo=<%=e.getIdCurso().getIdCurso() + "-" + e.getIdGrupo()%>"><i class="fa fa-check"></i></a></td>
                                            </tr>
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
    </body>
</html>
