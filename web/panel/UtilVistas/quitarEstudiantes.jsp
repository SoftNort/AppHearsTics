<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    String estudiantes[] = request.getParameterValues("eliminar");

    boolean c = controlador.quitarEstudiantes(estudiantes);
    if (!c) {%>
<script text="javascript">
    window.location.href = "../Vistas/agregarEstudiantes.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Se ha eliminado los estudiantes del grupo\n\
&urlConfirm=../Vistas/agregarEstudiantes.jsp\n\
&urlCerrar=../Vistas/agregarEstudiantes.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/agregarEstudiantes.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar eliminar los estudiantes del grupo, intente de nuevo\n\
&urlConfirm=../Vistas/agregarEstudiantes.jsp\n\
&urlCerrar=../Vistas/agregarEstudiantes.jsp";
</script> 
<%}%>
