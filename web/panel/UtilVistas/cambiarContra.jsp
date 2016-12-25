<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%
    int usuario = Integer.parseInt(request.getParameter("usuarios"));
    String contra = request.getParameter("contra");
    String contra2 = request.getParameter("contra2");
    if (!contra.equals(contra2)){
%>
<script>
    window.location.href = "../Vistas/cambiarContra.jsp?idUsu=<%=usuario %>\n\
?tipoModal=mensaje\n\
&mensajeModal=Las contraseñas no coinciden\n\
&urlConfirm=../Vistas/cambiarContra.jsp?idUsu=<%=usuario %>\n\
&urlCerrar=../Vistas/cambiarContra.jsp?idUsu=<%=usuario %>";
</script>
<%
} else {
    boolean b = controlador.cambiarContra(usuario, contra);
    String mensaje = "";
    if (b) {
        mensaje = "El cambio se ha realizado con éxito";
    } else {
        mensaje = "Lo sentimos, no se ha podido gruardar los cambios";
    }%>
<script>
    window.location.href = "../Vistas/cambiarContra.jsp?idUsu=<%=usuario %>\n\
?tipoModal=mensaje\n\
&mensajeModal=<%=mensaje %>\n\
&urlConfirm=../Vistas/cambiarContra.jsp?idUsu=<%=usuario %>\n\
&urlCerrar=../Vistas/cambiarContra.jsp?idUsu=<%=usuario %>";
</script>
<%
    }
%>
