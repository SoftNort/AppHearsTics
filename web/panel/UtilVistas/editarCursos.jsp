<%-- 
    Document   : cambiarGrado
    Created on : 24/10/2016, 02:02:28 PM
    Author     : JHON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />

<%
    String[] modificar = request.getParameterValues("modificar");
    String[] eliminar = request.getParameterValues("eliminar");
    String opcion = request.getParameter("v");
    if (Integer.parseInt(opcion) == 2) {
        if (eliminar != null) {
            boolean c = controlador.eliminarCursos(eliminar);
            if (!c) {
%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El curso ha sido eliminado\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede eliminar el curso, <br>Intente de nuevo\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%}
} else {
%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Seleccione un curso\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%}
} else if (Integer.parseInt(opcion) == 1) {

    if (modificar != null) {

        boolean c = controlador.modificarCurso(modificar);
        if (!c) {%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El curso ha sido editado\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede editar el curso, <br>Intente de nuevo\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%}
} else {
%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarCursos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Selecione un curso\n\
&urlConfirm=../Vistas/gestionarCursos.jsp\n\
&urlCerrar=../Vistas/gestionarCursos.jsp";
</script>
<%}
    }else {
    %>
    <script>
        window.location.href="../Vistas/menuPrincipal.jsp";
    </script>
<%
}
%>
