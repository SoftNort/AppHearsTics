<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%Usuario usuario = (Usuario) session.getAttribute("usuario");
    TipoUsuario tipo = (TipoUsuario) session.getAttribute("rol");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <title> ModularAdmin - Free Dashboard Theme | HTML Version </title>
        <%@include file="../Vistas/AdministrarHtml/Links.jsp" %>
    </head>

    <body>
        <div class="app blank sidebar-opened">
            <article class="content">
                <div class="error-card global">
                    <div class="error-title-block">
                        <h1 class="error-title inicio">HeartsTics</h1>
                        <h2 class="error-sub-title">
			Bienvenido <%=usuario.getNombres()+" "+usuario.getApellidos() %>
		</h2> </div>
                    <div class="error-container">
                        <p>Desarrollado por software del norte</p>
                        <a class="btn btn-primary" href="menuPrincipal.jsp"> Ir al menú principal <i class="fa fa-angle-right"></i> </a>
                    </div>
                </div>
            </article>
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