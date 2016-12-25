<%-- 
    Document   : registrarTipoDocumento
    Created on : 16/10/2016, 09:25:33 AM
    Author     : Andrea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />

<!DOCTYPE html>
<%
    String nombre = request.getParameter("nombre");
    boolean a = controlador.registrarDocumento(nombre);
    if (!a) {%>
<script type="text/javascript">
    window.location.href = "../Vistas/gestionarTipoDocumento.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El tipo de documento ha sido registrado\n\
&urlConfirm=../Vistas/gestionarTipoDocumento.jsp\n\
&urlCerrar=../Vistas/gestionarTipoDocumento.jsp";
</script>
<%} else {%>
<script type="text/javascript">
    window.location.href = "../Vistas/gestionarTipoDocumento.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar el tipo de documento, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/gestionarTipoDocumento.jsp\n\
&urlCerrar=../Vistas/gestionarTipoDocumento.jsp";
</script>
<%}%>