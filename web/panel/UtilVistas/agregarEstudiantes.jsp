<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    String estudiantes[] = request.getParameterValues("agregar");
    String curso = request.getParameter("curso");
    int grupo = Integer.parseInt(request.getParameter("grupo"));

    boolean c = controlador.asignarCurso(estudiantes, grupo, curso.charAt(0));
    if (!c) {%>
<script text="javascript">
    window.location.href = "../Vistas/agregarEstudiantes.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Se ha agregado los estudiantes al grupo\n\
&urlConfirm=../Vistas/agregarEstudiantes.jsp\n\
&urlCerrar=../Vistas/agregarEstudiantes.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/agregarEstudiantes.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar agregar los estudiantes, intente de nuevo\n\
&urlConfirm=../Vistas/agregarEstudiantes.jsp\n\
&urlCerrar=../Vistas/agregarEstudiantes.jsp";
</script> 
<%}%>

