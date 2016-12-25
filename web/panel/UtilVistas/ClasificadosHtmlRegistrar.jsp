
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    String lateralidad = request.getParameter("lateralidad");
    String titulo = request.getParameter("titulo");
    String parrafo = request.getParameter("parrafo");

    boolean b = controlador.registrarClasificado(lateralidad, titulo, parrafo);

    if (!b) {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El clasificado ha sido registrado\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar el clasificado, intente mas tarde\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
    }
%>