<%
    String user = "";
    if (request.getParameter("user") != null) {
        user = request.getParameter("user");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Login HeartsTics </title>
        <link href="../../recursos/css/styleGenerals.css" rel="stylesheet" type="text/css">
    </head>
    <body onload="login();" class="bodyLogin">
        <div class="boxFormLogin">
            <div class="titleLogin">
                <div class="logo">
                    <img src="../../recursos/img/logo-sm-100.png" >                    
                </div>
                <div class="titulo">
                    <h3>Ingreso</h3>
                    <h3>HeartsTics</h3>                    
                </div>
            </div>
            <form id="login-form" class="formLogin" target="_black" name="login" action="../Util/iniciarSesion.jsp" method="POST" novalidate="">                  
                <table class="tableLogin">
                    <tr>
                        <td>
                            <label for="username">Usuario: </label> 
                        </td>
                        <td>
                            <input type="text" value="<%=user%>" name="user" id="username" required> 
                            <div class="msg-login" id="mensaje1"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="password">Contraseña: </label> 
                        </td>
                        <td>
                            <input type="password" name="pass" id="password"  required> 
                            <div class="msg-login" id="mensaje2"></div>  
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <button class="btn-ingresar" type="submit">Ingresar</button>
                        </td>
                    </tr>
                    
                </table>
                <input type="hidden" name="error" value="<%=request.getParameter("error")%>" id="notificacion-login" >
            </form>
        </div>
    </body>
</html>