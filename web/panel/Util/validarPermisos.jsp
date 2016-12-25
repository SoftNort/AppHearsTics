<%@page import="ClasesDTO.Usuario"%>
<%@page import="ClasesDTO.PaginaTipoUsuario"%>
<%@page import="ClasesDTO.TipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%  ArrayList<PaginaTipoUsuario> pag = null;
    ArrayList<PaginaTipoUsuario> pag1 = null;
    ArrayList<PaginaTipoUsuario> pag2 = null;
    TipoUsuario tipo = null;
    Usuario usuario = null;
    String paginaActual = "";
    boolean b = false;
    if (session.getAttribute("usuario") != null && session.getAttribute("rol") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
        tipo = (TipoUsuario) session.getAttribute("rol");
        pag = controlador.listarPaginasTipoUsuario((int) tipo.getId());
        pag1 = controlador.listarCarpetasTipoUsuario((int) tipo.getId());
        pag2 = controlador.listarPaginasSinCarpeta((int) tipo.getId());
        session.setAttribute("paginas", pag1);
        session.setAttribute("paginas2", pag2);
    }
    if (session.getAttribute("paginaActual") != null) {
        paginaActual = (String) session.getAttribute("paginaActual");
    }
    for (PaginaTipoUsuario pa : pag) {
        if (pa.getPagina().getNombre().equalsIgnoreCase(paginaActual)) {
            b = true;
        }
    }
if (!b) {%>
<script>
    window.location = "<%=request.getContextPath()%>/panel/Vistas/sinPermisos.jsp";
</script>
<%}%>
