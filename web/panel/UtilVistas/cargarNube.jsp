<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    int materia = Integer.parseInt(request.getParameter("valor"));
    ArrayList<String> urls = controlador.listarArchivosNube(materia);

%>
<table>
    <tr><th>Descargar</th></tr>
    <%if (urls != null && !urls.isEmpty()) {
            String rutaDescarga[];
            for (String s : urls) {
                rutaDescarga = s.split("/");
    %>
    
    <tr>
        <td>
            <a href="../Util/descargarNube.jsp?url=<%=s%>" target="_blank" download="<%request.getServletContext().getRealPath(s);%>">
                <%=rutaDescarga[rutaDescarga.length - 1]%> 
            </a>
        </td>
    </tr>

    <%}
        } else {
            out.print("No hay archivos asosciados a esta materia en este curso");
        }
    %>
</table>
