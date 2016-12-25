<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "cambiarContra.jsp");
    int idUsu=0;
    if (request.getParameter("idUsu").equals("") || request.getParameter("idUsu") == null){
        response.sendRedirect("menuPrincipal.jsp");
    } else {
        idUsu = (int) Integer.parseInt(request.getParameter("idUsu"));
    }
    Usuario datos = controlador.datosUsuario(idUsu);
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
                            Administrar Contraseñas
                        </h3>
                        <p class="title-description">  </p>
                    </div>
                    <section class="section">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title">
                                    <h3 class="title ">
                                        Cambio de Contraseña para <%=datos.getNombres() + " " + datos.getApellidos()%>
                                    </h3>                                    
                                </div>
                                <form id="frmCambiarContra" method="post" action="../UtilVistas/cambiarContra.jsp">
                                        <input type="hidden" name="usuarios" value="<%=datos.getIdUsuario()%>">
                                    <div class="form-group">
                                        <label>Nueva contraseña</label>
                                        <input type="password" name="contra" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Repetir contraseña</label>
                                        <input type="password" name="contra2" class="form-control"/>
                                    </div>

                                    <div class="clear-fix"></div>
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-5">
                                            <input type="submit" name="guardarCambios" value="Guardar Cambios" class="btn btn-warning"/>
                                        </div>
                                    </div>
                                </form>
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
