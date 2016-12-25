<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%
    String descripcion = request.getParameter("descripcionTarea");
    String asunto = request.getParameter("asuntoTarea");
    String fechaEntrega = request.getParameter("fechaEntregaTarea");
    int idTarea = Integer.parseInt(request.getParameter("tareaCambio"));
    SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
    Date fecha = formatoDelTexto.parse(fechaEntrega);
    boolean b = controlador.actualizarTarea(idTarea, asunto, descripcion, fecha);
    if (!b) {%>
<script>
    alert('Los cambios se han realizado con éxito');
    window.location.href = "../Vistas/verTareas.jsp";
</script>
<%} else {
%>
<script>
    alert('No se han podido realizar los cambios, inténtelo más tarde.');
    window.location.href = "../Vistas/verTareas.jsp";
</script>
<%}%>
