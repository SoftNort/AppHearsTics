<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    String idCarpeta = request.getParameter("idCarpeta");
    String nombre = request.getParameter("nombre");
    String icono = request.getParameter("icono");
    boolean b = controlador.editarCarpetaPagina(Integer.parseInt(idCarpeta), nombre, icono);
    if (b) {%>
<script>
    window.location.href = "../Vistas/administrarCarpetasPaginas.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La carpeta ha sido actualizada\n\
&urlConfirm=../Vistas/administrarCarpetasPaginas.jsp\n\
&urlCerrar=../Vistas/administrarCarpetasPaginas.jsp";
</script> 
<%} else {%>
<script>
    window.location.href = "../Vistas/administrarCarpetasPaginas.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar actualizar la materia\n\
&urlConfirm=../Vistas/administrarCarpetasPaginas.jsp\n\
&urlCerrar=../Vistas/administrarCarpetasPaginas.jsp";
</script>
<%}
%>
