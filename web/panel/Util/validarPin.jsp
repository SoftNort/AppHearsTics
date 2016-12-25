

<%@page import="ClasesDTO.TipoUsuario"%>
<%@page import="ClasesDTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    TipoUsuario tipo = (TipoUsuario) session.getAttribute("rol");

    if (tipo.getRol().equalsIgnoreCase("Estudiante")) {
        System.err.println(controlador.existePin(usuario.getIdUsuario()));
        if (!controlador.existePin(usuario.getIdUsuario())) {%>
        
        <script>
            window.location.href="../Vistas/validarPin.jsp";
        </script>    
            <% }

    }
%>

