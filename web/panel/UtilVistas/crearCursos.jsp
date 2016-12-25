
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>

<%
    int grupo = Integer.parseInt(request.getParameter("grupo"));
    char letra = request.getParameter("letra").charAt(0);
    int titular = Integer.parseInt(request.getParameter("titular"));
    boolean b = controlador.crearGrupo(letra, grupo, titular);
    if (!b) {%>
<script text="javascript">
    alert("Registro exitoso");
    window.location.href = "../Vistas/crearCursos.jsp";
</script>
<%} else {%>
<script text="javascript">
    alert("No se pudo registrar, inténtelo más tarde");
    window.location.href = "../Vistas/crearCursos.jsp";
</script>
<%}
%>