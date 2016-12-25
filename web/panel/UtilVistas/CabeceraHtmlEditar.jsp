<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    String opcion = request.getParameter("opcion");
    String idLi = request.getParameter("idLi");
    String posicion = request.getParameter("posicion");

    Integer campo = Integer.parseInt(opcion);
    boolean b;

    switch (campo) {
        default:
            break;
        case 1://Editar Posicion
            b = controlador.editarLiPosicion(idLi, posicion);
            if (!b) {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrar-cabecera.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La posición fue editada\n\
&urlConfirm=../Vistas/administrar-cabecera.jsp\n\
&urlCerrar=../Vistas/administrar-cabecera.jsp";
</script>
<%
} else {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrar-cabecera.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar editar la posición\n\
&urlConfirm=../Vistas/administrar-cabecera.jsp\n\
&urlCerrar=../Vistas/administrar-cabecera.jsp";
</script>
<%
            }
            break;

    }
%>