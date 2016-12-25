<%-- 
    Document   : eliminarTipoDoc
    Created on : 16/10/2016, 10:07:05 AM
    Author     : Andrea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />

<!DOCTYPE html>
<%
    String eliminar[] = request.getParameterValues("eliminar");
    String msg = controlador.eliminarTipoDoc(eliminar);
%>
<script type="text/javascript">
    window.location.href = "../Vistas/gestionarTipoDocumento.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=<%=msg%>\n\
&urlConfirm=../Vistas/gestionarTipoDocumento.jsp\n\
&urlCerrar=../Vistas/gestionarTipoDocumento.jsp";
    
</script>
