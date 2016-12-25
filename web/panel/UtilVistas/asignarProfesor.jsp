<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    boolean b = true;
    if (request.getParameter("docente").isEmpty() || request.getParameter("materia").isEmpty() || request.getParameter("grupo").isEmpty()) {
        
    }else{
        int docente = Integer.parseInt(request.getParameter("docente"));
        int materia = Integer.parseInt(request.getParameter("materia"));
        String grupo[] = request.getParameter("grupo").split("-");
        b = controlador.registrarMateriaDocente(docente, materia, Integer.parseInt(grupo[0]), grupo[1].charAt(0));
    }
    if (!b) {%>
<script>
    window.location.href = "../Vistas/asignarProfesor.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Se ha asignado el profesor\n\
&urlConfirm=../Vistas/asignarProfesor.jsp\n\
&urlCerrar=../Vistas/asignarProfesor.jsp";
</script> 
<%} else {%>
<script>
    window.location.href = "../Vistas/asignarProfesor.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede asignar el profesor, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/asignarProfesor.jsp\n\
&urlCerrar=../Vistas/asignarProfesor.jsp";
</script> 
<%}
%>