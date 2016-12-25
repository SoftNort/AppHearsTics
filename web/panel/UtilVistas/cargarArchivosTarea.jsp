<%@page import="java.util.ArrayList"%>
<%@page import="ClasesDTO.ArchivoRespuesta"%>
<%@page import="ClasesDTO.TareaRespuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    String datos = request.getParameter("valor");
    String vec[] = datos.split("/@");
    TareaRespuesta tarea = controlador.listarTareasEstudiante(vec[5]);
    ArrayList<String> t = null;
    String respuesta = "No ha contestado";
    if (tarea != null) {
        t = tarea.getArchivo().getUrls();
        respuesta = tarea.getRespuesta();
    }
%>
<div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
        <div class="modal-header small">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Tarea de <%=vec[1]%></h4>
            <h6>Respuesta: <br><%=respuesta%></h6>
        </div>
        <div class="modal-body">
            <table>
                <%if (t != null) {
                        String rutaDescarga[];
                        for (String s : t) {
                            rutaDescarga = s.split("/");
                %>
                <tr><th>Descargar</th></tr>
                <tr>
                    <td><a href="../Util/descargar.jsp?url=<%=s%>"target="_blank" download="<%request.getServletContext().getRealPath(s);%>"> <%=rutaDescarga[rutaDescarga.length - 1]%> </a></td>
                </tr>

                <%}
                    } else {
                        out.print("No hay archivos asosciados a esta respuesta");
                    }
                %>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
    </div>

</div>