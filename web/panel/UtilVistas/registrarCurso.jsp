<%-- 
    Document   : registrarGrado
    Created on : 24/10/2016, 01:41:10 PM
    Author     : JHON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />
<%
    String descripcion = request.getParameter("descripcion");
    boolean a = controlador.registarCurso(descripcion);
    if (!a) {%>
<script type="text/javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El curso ha sido registrado\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%} else {%>
<script type="text/javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar el curso, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%}%>