<%@page import="ClasesDTO.Acudiente"%>
<%@page import="ClasesDTO.Estudiante"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%  session.setAttribute("paginaActual", "asignarAcudientes.jsp");
    ArrayList<Estudiante> estudiantes = controlador.listarEstudiantes();
    ArrayList<Acudiente> acudientes = null;
    if (session.getAttribute("userAcudiente") == null) {
        acudientes = controlador.listarAcudientes();
    }
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
                    <form id="frmEliminarTipoDoc" action="../UtilVistas/asignarAcudientes.jsp" method="post">
                        <div class="title-block">
                            <h3 class="title">
                                Asginar estudiantes al acudiente
                            </h3>
                            <p class="title-description"> 

                            </p>
                        </div>
                        <section class="section">
                            <div class="row sameheight-container">
                                <div class="col-md-12">
                                    <div class="card card-block sameheight-item">
                                        <div class="title-block">
                                            <h3 class="title">
                                                Listado de acudientes
                                            </h3> 
                                        </div>
                                        <div class="form-group">
                                            <%if (acudientes != null && !acudientes.isEmpty()) {%>
                                            <label>Acudientes registrados</label>
                                            <select name="acudienteSlt" class="form-control">
                                                <option>Seleccione una opción</option>
                                                <%for (Acudiente a : acudientes) {%>
                                                <option value="<%=a.getUsuario()%>"><%=a.getNumDoc() + " - " + a.getNombres() + " " + a.getApellidos()%></option>
                                                <%}%>
                                            </select>
                                            <%}%>
                                        </div>
                                        <div class="title-block">
                                            <h3 class="title">
                                                Listado de estudiantes
                                            </h3> 
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>Estudiante</th>
                                                    <th>Grado</th>
                                                    <th>Seleccionar</th>

                                                </tr>
                                                <%for (Estudiante e : estudiantes) {%>
                                                <tr>
                                                    <td><%=e.getNombres() + " " + e.getApellidos()%></td>
                                                    <td><%=e.getGrupo() + " - " + e.getCurso()%></td>
                                                    <td>
                                                        <label>
                                                            <input class="checkbox" name="subir" type="checkbox" value="<%=e.getIdUsuario()%>"/>
                                                            <span></span>
                                                        </label>
                                                    </td>
                                                </tr>
                                                <%}%>
                                            </table>
                                            <input type="hidden" value="acudiente"/>
                                            <input type="submit" name="guardarCambios" value="Agregar Estudiantes" class="btn btn-warning"/>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </form>
                </article>
                <%@include file="AdministrarHtml/Footer.jsp" %>
                <%@include file="AdministrarHtml/Ventanas.jsp" %>
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
