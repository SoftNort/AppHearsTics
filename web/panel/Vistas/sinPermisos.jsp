<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%
    session.setAttribute("paginaActual", "menuPrincipal.jsp");
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
                <article class="content error-404-page">
                    <section class="section">
                        <div class="error-card">
                            <div class="error-title-block">
                                <h1 class="error-title permisos">Sin Permisos</h1>
                                <h2 class="error-sub-title">
                                    
                                </h2> 
                            </div>
                            <div class="error-container">
                                <p>No tienes acceso a esta pagina</p>
                                <a class="btn btn-primary" href="menuPrincipal.jsp"><i class="fa fa-angle-left"></i> Volver al menú principal</a> 
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