<%@page import="ClasesDTO.Usuario"%>
<%@page import="ClasesDTO.TareaEstudiante"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int idMateria = Integer.parseInt(request.getParameter("valor"));
    Usuario usuario=null;
    ArrayList<TareaEstudiante> tareas=null;
    if (session.getAttribute("usuario") != null && session.getAttribute("rol") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
        tareas = controlador.listarTareasMateria(idMateria, usuario.getIdUsuario());
    }
    
    
    int con = 0;
    float promedio = 0.0F;
%>
<table class="table table-striped table-bordered table-hover">
    <tr>
        <th>Asunto</th>
        <th>Fecha de entrega</th>
        <th>Calificación</th>
    </tr>
    <%if (tareas == null || tareas.isEmpty()) {%>
    <tr>
        <td colspan="3">No tienes tareas</td>
    </tr>
    <%} else {
        for (TareaEstudiante t : tareas) {
            promedio += t.getCalificacion();
            con++;%>
    <tr>
        <td><%=t.getTarea().getAsunto()%></td> 
        <td><%=t.getFechaEntrega()%></td> 
        <td><%=t.getCalificacion()%></td> 
    </tr>
    <%}
        }%>
</table>
<div class="form-group">
    <label>Promedio de tareas en la materia</label>
    <input type="number" readonly="readonly" value="<%=promedio/con%>"/>
</div>


