<%@page import="ClasesDTO.Pin"%>
<%@page import="ClasesDTO.PaginaTipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    String dato = request.getParameter("valor");
    String[] v = dato.split("-");
    ArrayList<Pin> ListPin = controlador.listarEstudiantesPinCurso(Integer.parseInt(v[0]));
    String resultado = "<div class='card card-block' style='height:100%!important'>" + "\n"
            + "<div class='title-block'><h3 class='title'>Estudiantes del Curso: "+Integer.parseInt(v[0])+"&nbsp;<a href='agregarEstudiantes.jsp?grupo="+dato+"'>Agregar al grupo</a></h3></div>" + "\n"
            + "<section class='example'><div class='table-responsive'>" + "\n"
            + "<table class='table table-striped table-bordered table-hover' style='font-size: .8em' >" + "\n"
            + "<tr>" + "\n"
            + "<th><label><input type='checkbox' class='checkbox' id='opciones' onclick='marcar(2,this);'/><span></span></label></th>" + "\n"
            + "<th>Nombres y apellidos</th>" + "\n"
            + "<th>Pin</th>" + "\n"
            + "<th>&nbsp;</th>" + "\n"
            + "</tr>";
    if (ListPin.isEmpty() == false) {
        for (Pin p : ListPin) {
            resultado += "<tr >" + "\n"
                    + "<td>" + "\n"
                    + "<label>" + "\n"
                    + "<input class='checkbox curso' name='imprimir' type='checkbox' value='" + p.getIdUsuario() + "'/>" + "\n"
                    + "<span></i></span>" + "\n"
                    + "<label>" + "\n"
                    + "</td>" + "\n"
                    + "<td style='font-size: .75em'>" + p.getNombres() + " " + p.getApellidos() + "</td>" + "\n"
                    + "<td style='font-size: .75em'>" + p.getIdPin() + "</td>" + "\n"
                    + "<td><a href='../../GenerarPinEstudiante?idEst=" + p.getIdUsuario() + "'><i class='fa fa-eye'></i></a>" +"\n"
                    + "<a href='administrarPinEstudiante.jsp?idEst=" + p.getIdUsuario() + "'><i class='fa fa-pencil'></i></a></td>" + "\n"
                    + "</tr>" + "\n";
        }
        resultado += "</table></div></section></div>" + "\n";
    } else {
        resultado += "<tr><td colspan='4' align='center'>No hay estudiantes registrados </td></tr></table>" + "\n"
                + "</div></section></div>";
    }    
%>
<%=resultado%>
