
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    String idCabecera = request.getParameter("idClasificado");
    String idCabeceraLink = request.getParameter("idClasificadoLink");
    boolean b1, b2, b3;

    if (idCabeceraLink != null) {
        b1 = controlador.eliminarClasificadohijoLink(idCabeceraLink);
        if (!b1) {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El link ha sido eliminado\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede eliminar el link, intente mas tarde\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
    }
} else {
    b2 = controlador.eliminarClasificado(idCabecera);
    if (!b2) {
        b3 = controlador.eliminarClasificadohijoLink(idCabeceraLink);
        if (!b3) {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El clasificado ha sido eliminado\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede eliminar el clasificado, intente mas tarde\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
    }
} else {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se pudo eliminar el clasificado, intente mas tarde\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
        }
    }
%>