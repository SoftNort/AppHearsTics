
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>

<%
    int grupo = Integer.parseInt(request.getParameter("grupo"));
    char letra = request.getParameter("letra").charAt(0);
    int titular = Integer.parseInt(request.getParameter("titular"));
    boolean b = controlador.crearGrupo(letra, grupo, titular);
    if (!b) {%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarGrados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El grado ha sido registrado\n\
&urlConfirm=../Vistas/gestionarGrados.jsp\n\
&urlCerrar=../Vistas/gestionarGrados.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarGrados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar el grado, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/gestionarGrados.jsp\n\
&urlCerrar=../Vistas/gestionarGrados.jsp";
</script>
<%}
%>