<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    String pagina = request.getParameter("id");
    boolean b = controlador.elimingarPagina(Integer.parseInt(pagina));
    if (!b) {%>
<script>
    window.location.href = "../Vistas/registrarPagina.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La pagina ha sido eliminada\n\
&urlConfirm=../Vistas/registrarPagina.jsp\n\
&urlCerrar=../Vistas/registrarPagina.jsp";
</script> 
<%} else {%>
<script>
    window.location.href = "../Vistas/registrarPagina.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar eliminar la pagina\n\
&urlConfirm=../Vistas/registrarPagina.jsp\n\
&urlCerrar=../Vistas/registrarPagina.jsp";
</script>
<%}
%>
