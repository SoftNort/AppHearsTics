<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    String idCarpeta = request.getParameter("id");
    String[] paginas = request.getParameterValues("agregar");
    boolean b = controlador.actualizarPaginaCarpeta(Integer.parseInt(idCarpeta), paginas);
    if (!b) {%>
<script>
    window.location.href = "../Vistas/AgregarPaginasCarpetas.jsp?id=<%=idCarpeta %>\n\
&tipoModal=mensaje\n\
&mensajeModal=La pagina ha sido Agregadas\n\
&urlConfirm=../Vistas/AgregarPaginasCarpetas.jsp?id=<%=idCarpeta %>\n\
&urlCerrar=../Vistas/AgregarPaginasCarpetas.jsp?id=<%=idCarpeta %>";
</script> 
<%} else {%>
<script>
    window.location.href = "../Vistas/AgregarPaginasCarpetas.jsp?id=<%=idCarpeta %>\n\
&tipoModal=mensaje\n\
&mensajeModal=Error al intentar eliminar la pagina\n\
&urlConfirm=../Vistas/AgregarPaginasCarpetas.jsp?id=<%=idCarpeta %>\n\
&urlCerrar=../Vistas/AgregarPaginasCarpetas.jsp?id=<%=idCarpeta %>";
</script>
<%}
%>