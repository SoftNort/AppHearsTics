<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio"/>
<%
    String dato = (String) session.getAttribute("rolActual");
    int codUsuario = Integer.parseInt(dato);
    String[] paginas = request.getParameterValues("agregar");
    boolean b = controlador.agregarPermisos(codUsuario, paginas);
    if (!b) {%>
<script text="javascript">
    window.location.href = "../Vistas/asignarPermisos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede agregar los permisos, <br>intente de nuevo\n\
&urlConfirm=../Vistas/asignarPermisos.jsp\n\
&urlCerrar=../Vistas/asignarPermisos.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/asignarPermisos.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Los permisos fueron agregados \n\
&urlConfirm=../Vistas/asignarPermisos.jsp\n\
&urlCerrar=../Vistas/asignarPermisos.jsp";
</script>
<%}

%>
