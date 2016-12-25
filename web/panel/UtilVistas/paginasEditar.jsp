<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    String pagina = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    boolean b = controlador.actualizarPagina(Integer.parseInt(pagina), nombre, descripcion);
    if (!b) {%>
<script>
    window.location.href = "../Vistas/registrarPagina.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La pagina ha sido actualizada\n\
&urlConfirm=../Vistas/registrarPagina.jsp\n\
&urlCerrar=../Vistas/registrarPagina.jsp";
</script> 
<%} else {%>
<script>
    window.location.href = "../Vistas/registrarPagina.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar actualizar la pagina\n\
&urlConfirm=../Vistas/registrarPagina.jsp\n\
&urlCerrar=../Vistas/registrarPagina.jsp";
</script>
<%}
%>
