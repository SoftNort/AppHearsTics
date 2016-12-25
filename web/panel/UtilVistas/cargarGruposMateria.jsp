<%@page import="ClasesDTO.MateriaDocente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%
    int idMateria = Integer.parseInt(request.getParameter("valor"));
    ArrayList<MateriaDocente> materias = controlador.listarPorMateria(idMateria);
%>
<div class="title-block"><h3 class="title">Listado de Grupos en la materia</h3></div>

<%if (materias != null && !materias.isEmpty()) {
        for (MateriaDocente m : materias) {%>
<input type="checkbox" id="seleccion" name="grupoMateria" value="<%=m.getGrupo().getIdCurso().getIdCurso() + "-" + m.getGrupo().getIdGrupo()%>"/><%=m.getGrupo().getIdCurso().getDescripcion() + " " + m.getGrupo().getIdGrupo()%>
<br>
<%}%>
<hr>
<div class="form-group">
    <label>Selección por estudiantes</label>
    <div id="respuesta">
        <select id="gruposEstudiantes" class="form-control">
            <option>Seleccione un grupo para cargar los estudiantes</option>
            <%for (MateriaDocente m : materias) {%>
            <option value="<%=m.getGrupo().getIdCurso().getIdCurso() + "-" + m.getGrupo().getIdGrupo()%>">
                <%=m.getGrupo().getIdCurso().getDescripcion() + " " + m.getGrupo().getIdGrupo()%>
            </option>
            <%} %>
        </select>
    </div>
</div>
            <div id="listaEstudiantes"></div>
<%}%>
<script>
            $("#gruposEstudiantes").on("change", function() {
                document.getElementById("listaEstudiantes").innerHTML="";
                var valor = document.getElementById('gruposEstudiantes').value;
                var imagen1 = document.createElement("img");
                imagen1.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen1.setAttribute("class", "img-gif");
                var bloq1 = document.getElementById("listaEstudiantes");
                bloq1.appendChild(imagen1);
                var ruta = "../UtilVistas/listarEstudiantes.jsp";
                $.post(ruta,
                        {
                            valor: valor
                        },
                function(data) {
                    $("#listaEstudiantes").html(data);
                });
            });
        </script>


