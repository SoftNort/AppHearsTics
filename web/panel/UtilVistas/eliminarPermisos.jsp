
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio"/>
<%
    String dato = (String) session.getAttribute("rolActual");
    int codUsuario = Integer.parseInt(dato);
    String[] paginas = request.getParameterValues("eliminar");
    boolean b = controlador.eliminar(paginas, codUsuario);
    if (!b) {%>
<script text="javascript">
    window.location.href = "../Vistas/asignarPermisos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Los permisos fueron eliminados\n\
&urlConfirm=../Vistas/asignarPermisos.jsp\n\
&urlCerrar=../Vistas/asignarPermisos.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/asignarPermisos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar eliminar algunos permisos\n\
&urlConfirm=../Vistas/asignarPermisos.jsp\n\
&urlCerrar=../Vistas/asignarPermisos.jsp";
</script>
<%}

%>
