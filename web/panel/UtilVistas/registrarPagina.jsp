<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio"/>
<%
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String carpeta = request.getParameter("carpeta");
    boolean b = controlador.registrarPagina(nombre, descripcion, Integer.parseInt(carpeta));
    if (b) {%>
<script text="javascript">
    window.location.href = "../Vistas/registrarPagina.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar la página, <br>revise que los datos sean validos\n\
&urlConfirm=../Vistas/registrarPagina.jsp\n\
&urlCerrar=../Vistas/registrarPagina.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/registrarPagina.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La página ha sido registrada\n\
&urlConfirm=../Vistas/registrarPagina.jsp\n\
&urlCerrar=../Vistas/registrarPagina.jsp";
</script>
<%}
%>

