<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />
<!DOCTYPE html>

<%
    String docs[] = request.getParameterValues("eliminar");
    boolean b = controlador.eliminarTipoUsuario(docs);
    if(!b){%>
    <script>        
        window.location.href = "../Vistas/gestionTipoUsuario.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El tipo de usuario ha sido eliminado\n\
&urlConfirm=../Vistas/gestionTipoUsuario.jsp\n\
&urlCerrar=../Vistas/gestionTipoUsuario.jsp";
    </script>
    <%}else{%>
    <script>        
        window.location.href = "../Vistas/gestionTipoUsuario.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede eliminar el tipo de usuario, intente de nuevo\n\
&urlConfirm=../Vistas/gestionTipoUsuario.jsp\n\
&urlCerrar=../Vistas/gestionTipoUsuario.jsp";
    </script>
    <%}
%>