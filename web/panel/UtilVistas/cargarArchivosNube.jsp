<%@page import="java.util.ArrayList"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%
    int idMateria = Integer.parseInt(request.getParameter("valor"));
    ArrayList<String> archivos = controlador.listarArchivosNube(idMateria);%>
<table>
    <%String rutaDescarga[];
        for (String s : archivos) {
            rutaDescarga = s.split("/");
    %>
    <tr><th>Descargar</th></tr>
    <tr>
        <td><a href="../Util/descargar.jsp?url=<%=s%>"target="_blank" download="<%request.getServletContext().getRealPath(s);%>"> <%=rutaDescarga[rutaDescarga.length - 1]%> </a></td>
    </tr>

    <%}
    %>

