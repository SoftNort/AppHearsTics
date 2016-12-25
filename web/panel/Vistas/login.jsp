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
                <div class="card login-box">
                    <header class="auth-header">
                        <h1 class="auth-title">
                            <img src="../../recursos/img/logo-sm-100.png" width="60"> Ingreso a HeartsTics
                        </h1> 
                    </header>
                    <div class="auth-content">
                        <p class="text-xs-center">Ingresar para continuar</p>
                        <form id="login-form" name="login" action="../Util/iniciarSesion.jsp" method="POST" novalidate="">
                            <div class="form-group"> 
                                <label for="username">Usuario</label> 
                                <input type="text" class="form-control underlined" name="user" id="username" placeholder="Your user name " required> 
                            </div>

                            <div class="form-group"> 
                                <label for="password">Contraseña</label> 
                                <input type="password" class="form-control underlined" name="pass" id="password" placeholder="Your password" required> 
                            </div>

                            <div class="form-group"> <button type="submit" class="btn btn-block btn-primary">Ingresar</button> </div>
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