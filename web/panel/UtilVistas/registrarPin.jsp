<%-- 
    Document   : registrarPin
    Created on : 25/11/2016, 09:28:44 AM
    Author     : Estudiante
--%>

<%@page import="ClasesDTO.TipoUsuario"%>
<%@page import="ClasesDTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>

<!DOCTYPE html>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    TipoUsuario tipo = (TipoUsuario) session.getAttribute("rol");

    String pin = request.getParameter("pin");
    if (controlador.activarPin(pin, usuario.getIdUsuario())) {%>   
<script>
    window.location.href = "../Vistas/primerInicio.jsp";
</script>
<%} else {%>
<script>
    window.location.href = "../Vistas/validarPin.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El pin es incorrecto, intente de nuevo\n\
&urlConfirm=../Vistas/validarPin.jsp\n\
&urlCerrar=../Vistas/validarPin.jsp";
</script>
<%}
%>