<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "administrarUsuarios.jsp");
    ArrayList<TipoUsuario> tipos = controlador.listarTiposUsuario();
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
                            Administrar Usuarios
                        </h3>
                        <p class="title-description">  </p>
                    </div>

                    <% for (TipoUsuario tipo : tipos) {%>
                    <section class="section">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title">
                                    <h3 class="title ">
                                        <%=tipo.getRol()%>
                                    </h3>                                    
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <tr>
                                            <th style="width: 50%">Nombres y Apellidos</th>
                                            <th style="width: 30%">Documento de Identidad</th>
                                            <th style="width: 20%">Operaciones</th>
                                        </tr>
                                        <%
                                            ArrayList<Usuario> listaTipo = controlador.getUsuariosPorTipo(tipo.getId());
                                            for (Usuario u : listaTipo) {%>
                                        <tr>
                                            <td><%=u.getNombres() + " " + u.getApellidos()%></td>
                                            <td><%=u.getNumDoc()%></td>
                                            <td>
                                                <a href="cambiarContra.jsp?idUsu=<%=u.getIdUsuario()%>" title="Cambiar contraseña">
                                                    <i class="fa fa-lock"></i>
                                                </a>
                                                <a href="administrarInformacion.jsp?idUsu=<%=u.getIdUsuario()%>" title="Cambiar información">
                                                    <i class="fa fa-gears"></i>
                                                </a>
                                                <a href="../UtilVistas/eliminarUsuarios.jsp?idUsu=<%=u.getIdUsuario()%>" title="Eliminar Usuario">
                                                    <i class="fa fa-trash-o"></i>
                                                </a> 
                                            </td>
                                        </tr>
                                        <%}
                                            if (listaTipo.isEmpty()) {
                                        %>
                                        <tr>
                                            <td colspan="3" align="center">No hay usuarios registrados</td>
                                        </tr>
                                        <%}%>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>  
                    <%}%>                  
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
