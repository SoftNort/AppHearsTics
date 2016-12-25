<%@page import="ClasesDTO.Estudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<!DOCTYPE html>
<link href="../../recursos/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
<script src="../../recursos/js/fileinput.min.js" type="text/javascript"></script>
<%
    String valor = request.getParameter("valor");
    ArrayList<Estudiante> estudiantes = controlador.listarEstudianteSinFoto(valor);%>
<form id='formulario1' name='formulario' method='post'>
    <div class="form-group">
        <label>Estudiantes disponibles</label>
        <select id="estudiantesSlt" name="estudiantesSlt" class="form-control">
            <option>Seleccione un estudiante</option>
            <%if (estudiantes != null && !estudiantes.isEmpty()) {
                    for (Estudiante e : estudiantes) {%>
            <option value="<%=e.getIdUsuario()%>"><%=e.getNombres() + " " + e.getApellidos()%></option>
            <%}
            } else {%>
            <option>No hay estudiantes disponibles en este grupo</option>
            <%}%>
        </select>
    </div>
    <input id="file" name="files[]" class='btn btn-warning' type="file" onchange="ValidarImagen(this);"/>
    <input type="button" id="btnEnviar" value="Guardar Foto" class="btn btn-success"/>
</form>
<div id="respuestaFoto"></div>

<script>$('#btnEnviar').on('click', function() {
        var imagen = document.createElement('img');
        imagen.setAttribute('src', '../../recursos/img/cargando.gif');
        imagen.setAttribute('class', 'img-gif');
        var bloq = document.getElementById('respuestaFoto');
        bloq.appendChild(imagen);
        var formData = new FormData($('#formulario1')[0])
        var ruta = '../UtilVistas/subirFotoPerfil.jsp';
        $.ajax({
            url: ruta,
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success:
                    function(datos)
                    {
                        $('#respuestaFoto').html(datos);
                    }});
    });
</script>


