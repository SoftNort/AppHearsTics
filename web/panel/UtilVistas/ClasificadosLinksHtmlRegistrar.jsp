<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    String idClasificado = request.getParameter("idClasif");
    String nombreLink = request.getParameter("nombre");
    String tituloLink = request.getParameter("titulo");
    String httpLink = request.getParameter("http");

    boolean b = controlador.registrarLink(idClasificado, nombreLink, tituloLink, httpLink);

    if (!b) {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El link ha sido registrado\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar el link, intente mas tarde\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
    }
%>