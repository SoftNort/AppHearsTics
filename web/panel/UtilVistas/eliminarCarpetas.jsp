<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    String idCarpeta = request.getParameter("id");
    boolean b = controlador.eliminarCarpetaPagina(Integer.parseInt(idCarpeta));
    if (b) {%>
<script>
    window.location.href = "../Vistas/administrarCarpetasPaginas.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La carpeta ha sido eliminada\n\
&urlConfirm=../Vistas/administrarCarpetasPaginas.jsp\n\
&urlCerrar=../Vistas/administrarCarpetasPaginas.jsp";
</script> 
<%} else {%>
<script>
    window.location.href = "../Vistas/administrarCarpetasPaginas.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar eliminar la materia\n\
&urlConfirm=../Vistas/administrarCarpetasPaginas.jsp\n\
&urlCerrar=../Vistas/administrarCarpetasPaginas.jsp";
</script>
<%}
%>
