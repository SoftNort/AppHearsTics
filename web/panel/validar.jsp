<%@page import="ClasesDTO.TipoUsuario"%>
<%@page import="ClasesDTO.Usuario"%>
<%@page import="ClasesDTO.PaginaTipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<PaginaTipoUsuario> pag = null;
    Usuario usuario = null;
    if (session.getAttribute("usuario") != null && session.getAttribute("rol") != null || session.getAttribute("paginas") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
        TipoUsuario tipo = (TipoUsuario) session.getAttribute("rol");
        pag = (ArrayList<PaginaTipoUsuario>) session.getAttribute("paginas");
    } else {%>
<script text="javascript">
    window.location.href = "<%=request.getContextPath()%>/panel/Vistas/inicioSessionFail.jsp";
</script>
<%}%>
