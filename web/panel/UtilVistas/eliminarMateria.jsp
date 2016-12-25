<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    String materias[] = request.getParameterValues("eliminar");
    boolean b = controlador.eliminarMateria(materias);
    if (!b) {%>
<script>
    window.location.href = "../Vistas/gestionarMaterias.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La materia ha sido eliminada\n\
&urlConfirm=../Vistas/gestionarMaterias.jsp\n\
&urlCerrar=../Vistas/gestionarMaterias.jsp";
</script> 
<%} else {%>
<script>
    window.location.href = "../Vistas/gestionarMaterias.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar eliminar la materia\n\
&urlConfirm=../Vistas/gestionarMaterias.jsp\n\
&urlCerrar=../Vistas/gestionarMaterias.jsp";
</script>
<%}
%>
