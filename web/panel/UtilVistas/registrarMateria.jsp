<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    String materia = request.getParameter("materia");
    boolean b = controlador.registrarMateria(materia);

    if (!b) {%>
<script>
    window.location.href = "../Vistas/gestionarMaterias.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La materia ha sido registrada\n\
&urlConfirm=../Vistas/gestionarMaterias.jsp\n\
&urlCerrar=../Vistas/gestionarMaterias.jsp";
</script>
<%} else {%>
<script>
    window.location.href = "../Vistas/gestionarMaterias.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar la materia, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/gestionarMaterias.jsp\n\
&urlCerrar=../Vistas/gestionarMaterias.jsp";
</script>
<%}
%>
