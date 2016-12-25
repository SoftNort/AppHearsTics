<%@page import="ClasesDTO.MateriaDocente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%
    int idMateria = Integer.parseInt(request.getParameter("valor"));
    ArrayList<MateriaDocente> materias = controlador.listarPorMateria(idMateria);
%>
<form id="formulario" method="post">
    <div class="card card-block sameheight-item">
        <div class="title-block"><h3 class="title">Listado de Grupos</h3></div>
        <div class="form-group">
            <label>Grupos disponibles de la materia</label>
            <select name="sltMaterias" class="form-control">

                <%if (materias != null && !materias.isEmpty()) {
                    for (MateriaDocente m : materias) {%>
                <option>Seleccion un grupo</option>
                <option value="<%=m.getId()%>"><%=m.getGrupo().getIdCurso().getDescripcion() + " " + m.getGrupo().getIdGrupo()%></option>
                <%}
            } else {%>
                <option>No hay grupos asociados a esa materia</option>
                <%}%>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleInputFile">Subir Archivos</label>
            <input type="file" multiple="multiple" id="file" name="files[]" class="btn btn-primary"/>
            <p class="help-block">Seleccione los archivos que desea agregar a la tarea</p>
        </div>
        <div class="form-group">
            <input type="button" id="subirArchivos" class="btn btn-success" value="Subir"/>
        </div>
    </div>
</form>
<div id="progreso"></div>


<script type="text/javascript">
    $("#subirArchivos").on("click", function() {
        document.getElementById("progreso").innerHTML = "";
        var imagen = document.createElement("img");
        imagen.setAttribute("src", "../../recursos/img/cargando.gif");
        imagen.setAttribute("class", "img-gif");
        var bloq = document.getElementById("progreso");
        bloq.appendChild(imagen);
        var formData = new FormData($("#formulario")[0]);
        var ruta = "../UtilVistas/subirANube.jsp";
        console.log(formData);
        $.ajax({
            url: ruta,
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function(datos)
            {
                $("#progreso").html(datos);
            }
        });
        document.getElementById("asunto").value = "";
        document.getElementById("descripcion").value = "";
        document.getElementById("fechaEntrega").value = "";
        document.getElementById("file").value = "";
    });
    CKEDITOR.replace("descTareaAgg");
</script>
