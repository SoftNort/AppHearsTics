<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />

<%
    String[] cursos = request.getParameterValues("modificar");
    boolean c = controlador.modificarCurso(cursos);
    if (!c) {%>
<script text="javascript">
    alert("Los cambios se realizaron con éxito");
    window.location.href = "../Vistas/gestionarGrados.jsp";
</script>
<%}else{%>
<script text="javascript">
    alert("No se pudo realizar algunos cambios, intentelo mas tarde");
    window.location.href = "../Vistas/gestionarGrados.jsp";
</script>
<%}%>
