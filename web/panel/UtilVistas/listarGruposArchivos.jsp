<%@page import="ClasesDTO.MateriaDocente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%
    int idMateria = Integer.parseInt(request.getParameter("valor"));
    ArrayList<MateriaDocente> materias = controlador.listarPorMateria(idMateria);
%>
<div class="card card-block sameheight-item">
    <div class="title-block"><h3 class="title">Listado de Grupos</h3></div>
    <div class="form-group">
        <label>Grupos disponibles de la materia</label>
        <select name="sltMaterias" id="sltMaterias" class="form-control">
            <option>Seleccion un grupo</option>
            <%if (materias != null && !materias.isEmpty()) {

                    for (MateriaDocente m : materias) {%>

            <option value="<%=m.getId()%>"><%=m.getGrupo().getIdCurso().getDescripcion() + " " + m.getGrupo().getIdGrupo()%></option>
            <%}
            } else {%>
            <option>No hay grupos asociados a esa materia</option>
            <%}%>
        </select>
    </div>
</div>
<div id="archivosNube"></div>
<script>
    $("#sltMaterias").on("change", function() {
        var imagen = document.createElement("img");
        imagen.setAttribute("src", "../../recursos/img/cargando.gif");
        imagen.setAttribute("class", "img-gif");
        var bloq = document.getElementById("archivosNube");
        bloq.appendChild(imagen);
        var ruta = "../UtilVistas/cargarNube.jsp";
        var valor = document.getElementById("sltMaterias").value;
        $.post(ruta, {valor: valor},
        function(data, status) {
            $("#archivosNube").html(data);
        });
    });
</script>
