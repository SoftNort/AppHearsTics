<%@page import="ClasesDTO.Grupo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    int valor = Integer.parseInt(request.getParameter("valor"));
    ArrayList<Grupo> grupos = controlador.listarGruposByCurso(valor);%>
<div class="form-group">
    <label>Seleccione un grado</label>
    <select class="form-control" id="grupoCursoList">
        <option>Seleccione un Grado</option>
        <%if (grupos != null && !grupos.isEmpty()) {
                for (Grupo g : grupos) {%>
        <option value="<%=valor + "-" + g.getIdGrupo()%>"><%=g.getIdCurso().getDescripcion() + " "+ g.getIdGrupo()%></option>
        <%}
        } else {%>
        <option>No hay Grados disponibles</option>
        <%}%>
    </select>
</div>
<script src="../../recursos/js/funciones.js" ></script>