<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    String rol = request.getParameter("rol");
    boolean b = controlador.registrarTipoUsuario(rol);
    if(!b){%>
    <script>        
        window.location.href = "../Vistas/gestionTipoUsuario.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El tipo de usuario ha sido registrado\n\
&urlConfirm=../Vistas/gestionTipoUsuario.jsp\n\
&urlCerrar=../Vistas/gestionTipoUsuario.jsp";
    </script>
    <%}else{%>
    <script>        
        window.location.href = "../Vistas/gestionTipoUsuario.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar el tipo de usuario, revise que los datos sean validos\n\
&urlConfirm=../Vistas/gestionTipoUsuario.jsp\n\
&urlCerrar=../Vistas/gestionTipoUsuario.jsp";
    </script>
    <%}
%>
