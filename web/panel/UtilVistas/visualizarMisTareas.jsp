<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
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
    Calendar fecha = new GregorianCalendar();
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

    String respuesta = "<div class='col-md-6'><div class='card card-block sameheight-item'>" + "\n"
            + "<div class='title-block'><h3 class='title'>Contenido de la tarea</h3></div>" + "\n"
            + "<input type='hidden' name='tareaCambio' value='" + dato + "'/>" + "\n"
            + "<div class='form-group'>" + "\n"
            + "<label>Asunto de la tarea</label>" + "\n"
            + "<input type='text' class='form-control' requerid='requerid' name='asuntoTarea' value='"+ tarea.getTarea().getAsunto() +"' maxlength='250' /> "+"\n"
            + "</div>" + "\n"
            + "<div class='form-group'>" + "\n"
            + "<label>Descripción de la tarea</label>" + "\n"
            + "<textarea class='form-control' requerid='requerid' maxlength='250' rows='3' name='descripcionTarea' style='resize:none'>" + tarea.getTarea().getDescripcion() + "</textarea>" + "\n"
            + "</div>" + "\n"
            + "<div class='form-group'>" + "\n"
            + "<label>Fecha máxima de entrega</label>" + "\n"
            + "<input type='date' requerid='requerid' name='fechaEntregaTarea' class='form-control' min="+fecha.get(Calendar.YEAR) + "-" + (fecha.get(Calendar.MONTH) + 1) + "-" + fecha.get(Calendar.DAY_OF_MONTH)+" value='" + tarea.getFechaEntrega() + "'>" + "\n"
            + "</div></div></div>" + "\n";
    respuesta +="<div class='col-md-6'><div class='card card-block sameheight-item'>" + "\n"
            + "<div class='title-block'><h3 class='title'>Archivos asociados a la tarea</h3></div>" + "\n" 
            +"<div table-responsive>" + "\n"
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
    respuesta += "</table></div></div></div>";
    out.print(respuesta);
%>
