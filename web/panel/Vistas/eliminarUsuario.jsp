<%@page import="ClasesDTO.PaginaTipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../Util/head.jsp" flush="true"/>
    </head>
    <body>
        <jsp:include page="../validar.jsp" flush="true"/>
        <%session.setAttribute("paginaActual","eliminarUsuario.jsp");%>
        <jsp:include page="../Util/validarPermisos.jsp" flush="true"/>
        <%

        %>
        <h1>Eliminar Usuarios</h1>
    </body>
</html>
