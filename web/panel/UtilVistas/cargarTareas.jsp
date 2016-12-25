<%@page import="ClasesDTO.TareaArchivo"%>
<%@page import="ClasesDTO.TareaEstudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    String dato = request.getParameter("valor");
    ArrayList<TareaEstudiante> tareas = null;
    TareaEstudiante tarea = null;
    ArrayList<TareaArchivo> archivos = null;
    String vec[];
    if (session.getAttribute("tareas") != null) {
        tareas = (ArrayList<TareaEstudiante>) session.getAttribute("tareas");
    }
    if (tareas != null) {
        for (TareaEstudiante t : tareas) {
            if (t.getTarea().getId() == Integer.parseInt(dato)) {
                tarea = t;
            }
        }
        archivos = controlador.listarTareaArchivos(tarea.getTarea());
    }

    String respuesta = "<form id='formulario1' name='formulario' method='post'>" + "\n"
            + "<div class='col-md-6'><div class='card card-block sameheight-item'>" + "\n"
            + "<div class='title-block'><h3 class='title'>Contenido de la tarea</h3></div>" + "\n"
            + "<input type='hidden' name='tareaRespuesta' value='" + dato + "'/>" + "\n"
            + "<div class='form-group'>" + "\n"
            + "<label>Descripción de la tarea</label>" + "\n"
            + "<textarea class='form-control' maxlength='250' rows='3' readonly='readonly' style='resize:none'>" + tarea.getTarea().getDescripcion() + "</textarea>" + "\n"
            + "</div>" + "\n"
            + "<div class='form-group'>" + "\n"
            + "<label>Fecha máxima de entrega</label>" + "\n"
            + "<input type='date' class='form-control' readonly='readonly' value='" + tarea.getFechaEntrega() + "'>" + "\n"
            + "</div>" + "\n";
    respuesta += "<div table-responsive>" + "\n"
            + "<table class='table table-striped table-bordered table-hover'>" + "\n"
            + "<tr>" + "\n"
            + "<th>Descargar</th>" + "\n"
            + "</tr>" + "\n";
    for (TareaArchivo tA : archivos) {
        vec = tA.getArchivoUrl().split("/");
        respuesta += "<tr>" + "\n"
                + "<td><a href='" + "../Util/descargar.jsp?url=" + tA.getArchivoUrl() + "'target='_blank' download='" + request.getServletContext().getRealPath(tA.getArchivoUrl()) + "'>" + vec[vec.length - 1] + "</a></td>" + "\n"
                + "</tr>" + "\n";
    }
    respuesta += "</table></div></div></div>" + "\n"
            + "<div class='col-md-6'><div class='card card-block sameheight-item'>" + "\n"
            + "<div class='title-block'><h3 class='title'>Responder la tarea</h3></div>" + "\n"
            + "<div class='form-group'>" + "\n"
            + "<label>Respuesta de la tarea</label>" + "\n"
            + "<textarea rows='5' class='form-control' style='resize:none' name='respuesta' placeholder='Escriba aquì su respuesta'></textarea>" + "\n"
            + "</div>" + "\n"
            + "<div class='form-group'>" + "\n"
            + "<label>Subir un archivo</label><br>" + "\n"
            + "<input type='file' class='btn btn-warning' value='Subir' name='files[]' multiple='multiple'/>" + "\n"
            + "</div>" + "\n"
            + "<input id='btnResponderTarea' type='button' value='Enviar' class='btn btn-success lg'/>" + "\n"
            + "</div></div></form>";
    respuesta += "<script>$('#btnResponderTarea').on('click', function() {" + "\n"
            + "var imagen = document.createElement('img');" + "\n"
            + "imagen.setAttribute('src', '../../recursos/img/cargando.gif');" + "\n"
            + "imagen.setAttribute('class', 'img-gif');" + "\n"
            + "var bloq = document.getElementById('respuesta2');" + "\n"
            + "bloq.appendChild(imagen);" + "\n"
            + "var formData = new FormData($('#formulario1')[0]);" + "\n"
            + "var ruta = '../UtilVistas/responderTarea.jsp';" + "\n"
            + "$.ajax({url: ruta,type: 'POST',data: formData,contentType: false, processData: false,success: function(datos){$('#respuesta2').html(datos);}});" + "\n"
            + "});</script>";
    out.print(respuesta);
%>