<%@page import="ClasesDTO.TipoUsuario"%>
<%@page import="ClasesDTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    String nombre = request.getParameter("user").toLowerCase();
    String contra = request.getParameter("pass");
    Usuario usuario = controlador.validarInicio(nombre, contra);

    if (usuario != null) {
        TipoUsuario tipo = controlador.listar(usuario.getIdTipoUsuario());
        session.setAttribute("usuario", usuario);
        session.setAttribute("rol", tipo);
        %>
        <script>
            alert('Bienvenid@');
            window.location.href="../Vistas/menuPrincipal.jsp";
        </script>
    <%} else {%>
<script>
    window.location.href = "../Vistas/login.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Usuario y/o contraseña incorrecta<br>Por favor intente de nuevo\n\
&urlConfirm=../Vistas/login.jsp\n\
&urlCerrar=../Vistas/login.jsp";
</script>
<%}
%>