<%@page import="Controlador.Servicio"%>
<%@page import="ClasesDTO.CarpetaPagina"%>
<%@page import="ClasesDTO.PaginaTipoUsuario"%>
<%@page import="java.util.ArrayList"%>

<%
    Servicio s = new Servicio();
    ArrayList<PaginaTipoUsuario> pag = (ArrayList<PaginaTipoUsuario>) session.getAttribute("paginas");
    ArrayList<PaginaTipoUsuario> pag2 = (ArrayList<PaginaTipoUsuario>) session.getAttribute("paginas2");
    for (PaginaTipoUsuario p1 : pag2) {%>
<li>
    <a href="<%=p1.getPagina().getNombre()%>"><%=p1.getPagina().getDescripcion()%></a>
</li>
<%}
%>

<% for (PaginaTipoUsuario pO : pag) {%>
<li >
    <a href=""> <i class="fa fa-<%=pO.getCarpeta().getIcono() %>"></i> <%=pO.getCarpeta().getNombre()%> </a>
    <ul>
        <%ArrayList<PaginaTipoUsuario> paO = s.listarPaginasIdCarpetas(pO.getTipo().getId(), pO.getCarpeta().getCodigo());
            for (PaginaTipoUsuario p : paO) {%>
        <li>
            <a href="<%=p.getPagina().getNombre()%>"><%=p.getPagina().getDescripcion()%></a>
        </li>
        <%}
        %>
    </ul>
</li>
<%} %>

<!--<li >
    <a href="menuPrincipal.jsp"> <i class="fa fa-home"></i> Menú principal </a>
</li>
<li>
    <a href=""> <i class="fa fa-cogs"></i>  <i class="fa arrow"></i> Permisos </a>
    <ul>
<%// if (pag != null) {for (PaginaTipoUsuario p : pag) {%>
<li>
    <a href="<%//=p.getPagina().getNombre()%>"><%//=p.getPagina().getDescripcion()%></a>
</li>
<%//}} else { out.print("Ha ocurrido un error"); }
%>
</ul>
</li>-->