<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%  Usuario usuario = (Usuario) session.getAttribute("usuario");
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
        <div class="auth">
            <div class="auth-container">
                <div class="card">
                    <div class="auth-content">
                        <p class="text-xs-center">Validar tu Pin <%=" " + usuario.getNombres() + " " + usuario.getApellidos() + " "%></p>
                        <form action="../UtilVistas/registrarPin.jsp" method="post"  name="pin"> 
                            <div class="form-group"> 
                                <label for="username">Pin</label> 
                                <input type="text" class="form-control boxed" name="pin" id="username" placeholder="Digite el pin" required> 
                            </div>
                            <div class="form-group"> <button type="submit" class="btn btn-block btn-primary">Enviar Pin</button> </div>
                        </form>
                    </div>
                </div>
                <div class="text-xs-center">
                    <a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary rounded btn-sm"> <i class="fa fa-arrow-left"></i> Ir Pagina Principal </a>
                </div>
            </div>
        </div>
        <%@include file="AdministrarHtml/Ventanas.jsp" %>
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