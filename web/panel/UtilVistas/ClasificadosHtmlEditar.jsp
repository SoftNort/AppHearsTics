
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    String idClasificado = request.getParameter("idClasificado");
    int opcion = Integer.parseInt(request.getParameter("opcion"));

    String titulo = request.getParameter("titulo");
    String parrafo = request.getParameter("parrafo");
    boolean b;

    switch (opcion) {
        case 3:
            b = controlador.editarTitulo(idClasificado, titulo);
            if (!b) {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El titulo ha sido actualizado\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
    window.location.href = "../Vistas/administrar-clasificados.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede actualizar el titulo, intente mas tarde\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
        }

        break;
    case 4:
        b = controlador.editarParrafo(idClasificado, parrafo);
        if (!b) {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La descripcion ha sido actualizada\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede actualizar la descripción, intente mas tarde\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
        }

        break;
    default:
%>
<script type="text/javascript">
    window.location.href = "../Vistas/administrar-clasificados.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error, intente mas tarde\n\
&urlConfirm=../Vistas/administrar-clasificados.jsp\n\
&urlCerrar=../Vistas/administrar-clasificados.jsp";
</script>
<%
            break;
    }
%>