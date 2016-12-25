<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%    
    TipoUsuario tipo = null;
    Usuario usuario = null;
    if (session.getAttribute("usuario") != null && session.getAttribute("rol") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
        tipo = (TipoUsuario) session.getAttribute("rol");
    }
    session.setAttribute("paginaActual", "menuPrincipal.jsp");
%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <title> ModularAdmin - Free Dashboard Theme | HTML Version </title>
        <%@include file="AdministrarHtml/Links.jsp" %>
    </head>

    <body>
        <jsp:include page="../Util/validarPermisos.jsp" flush="true"/>
        <jsp:include page="../validar.jsp" flush="true"/>        
        <jsp:include page="../Util/validarPin.jsp" flush="true"/>
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
                        <h1 class="title"> 
                            Menú principal
                        </h1>
                        <p class="title-description">
                        </p>
                    </div>
                    <section class="section">
                        <div class="col-md-6">
                            <div class="card card-block sameheight-item">
                                <div class="title-block">
                                    <h3 class="title">
                                        Bienvenido a HeartsTics!
                                    </h3> 
                                </div>
                                <div>
                                    <h4>Feliz Dia!</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card card-block sameheight-item">
                                <div class="title-block">
                                    <h3 class="title">
                                        Datos del Usuario (<%=tipo.getRol()%>)
                                    </h3> 
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tr>
                                            <th>Nombre completo</th>
                                            <td><%=usuario.getNombres() + " " + usuario.getApellidos()%></td>
                                        </tr>
                                        <tr>
                                            <th>Telefono</th>
                                            <td><%=usuario.getTelefono()%></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>
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
