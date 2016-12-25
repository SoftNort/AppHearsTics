<%@page import="ClasesDTO.Grupo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    int valor = Integer.parseInt(request.getParameter("valor"));
    ArrayList<Grupo> grupos = controlador.listarGruposCurso(valor);%>
<div class="form-group">
    <label>Seleccione el grupo</label>
    <select class="form-control" name="grupo" id="grupoSlt">
        <option>Seleccione un grupo</option>
        <%if (grupos != null && !grupos.isEmpty()) {
                for (Grupo g : grupos) {%>
        <option value="<%=valor+"-"+g.getIdGrupo()%>"><%=g.getIdGrupo()%></option>
        <%}
            }else{%>
            <option>No hay grupos disponibles</option>
        <%}%>
    </select>
</div>
    <div id="respuesta2"></div>
    <script src="../../recursos/js/funciones.js" ></script>

