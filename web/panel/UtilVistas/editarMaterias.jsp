
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>

<%
    int id = Integer.parseInt(request.getParameter("idMateria"));
    String descripcion = request.getParameter("descripcion");
    if (!descripcion.equals("")) {
        boolean b = controlador.editarMateria(id, descripcion);
        if (!b) {%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarMaterias.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La materia ha sido actualizada-idMateria<%=id %> - descrip=<%=descripcion %>\n\
&urlConfirm=../Vistas/gestionarMaterias.jsp\n\
&urlCerrar=../Vistas/gestionarMaterias.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarMaterias.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede actualizar la materia, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/gestionarMaterias.jsp\n\
&urlCerrar=../Vistas/gestionarMaterias.jsp";
</script>
<%}
} else {
%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarMaterias.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El nombre de la materia es obligatorio\n\
&urlConfirm=../Vistas/gestionarMaterias.jsp\n\
&urlCerrar=../Vistas/gestionarMaterias.jsp";
</script>
<%
    }

%>