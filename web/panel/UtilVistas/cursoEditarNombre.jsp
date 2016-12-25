
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>

<%
    int id = Integer.parseInt(request.getParameter("idCurso"));
    String descripcion = request.getParameter("descripcion");
    if (!descripcion.equals("")) {
        boolean b = controlador.editarDescripcionCurso(id, descripcion);
        if (!b) {%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El curso ha sido actualizado\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede actualizar el curso, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%}
} else {
%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El nombre del curso es obligatorio\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%
    }

%>