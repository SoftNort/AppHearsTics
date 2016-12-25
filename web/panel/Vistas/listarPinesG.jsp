<%@page import="ClasesDTO.Pin"%>
<%@page import="ClasesDTO.PaginaTipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio"/>
<%
    String dato = request.getParameter("valor");
    String[] v = dato.split("-");
    ArrayList<Pin> listPin2 = controlador.listarEstudiantesPinGrupo(Integer.parseInt(v[0]), v[1].charAt(0));
    String resultado = "<div class='card card-block' style='height:100%!important'>" + "\n"
            + "<div class='title-block'><h3 class='title'>Estudiantes del Grupo: "+v[1].charAt(0)+" </h3></div>" + "\n"
            + "<section class='example'><div class='table-responsive'>" + "\n"
            + "<table class='table table-striped table-bordered table-hover' style='font-size: .8em' >" + "\n"
            + "<tr>" + "\n"
            + "<th><label><input checked type='checkbox' class='checkbox' id='opciones' onclick='marcar(1,this);'/><span></span></label></th>" + "\n"
            + "<th>Nombres y apellidos</th>" + "\n"
            + "<th>Pin</th>" + "\n"
            + "<th>&nbsp;</th>" + "\n"
            + "</tr>" + "\n";

    if (listPin2.isEmpty() == false) {
        for (Pin p : listPin2) {
            resultado += "<tr >" + "\n"
                    + "<td>" + "\n"
                    + "<label>" + "\n"
                    + "<input class='checkbox grupo' name='imprimir' type='checkbox' value='" + p.getIdUsuario() + "' checked/>" + "\n"
                    + "<span></span>" + "\n"
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
