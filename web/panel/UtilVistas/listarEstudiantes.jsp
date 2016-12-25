<%@page import="com.google.gson.Gson"%>
<%@page import="ClasesDTO.Estudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    String grupo[] = request.getParameter("valor").split("-");
    ArrayList<Estudiante> estudiantes = controlador.listarEstudianteCurso(Integer.parseInt(grupo[0]), grupo[1].charAt(0));

    String respuesta = "" + "\n"
            + "" + "\n"
            + "<table class='table table-striped table-bordered table-hover'>" + "\n"
            + "<tr>" + "\n"
            + "<th>Nombre</th>" + "\n"
            + "<th>Curso</th>" + "\n"
            + "<th>Agregar</th>" + "\n"
            + "</tr>" + "\n";
    for (Estudiante e : estudiantes) {
        respuesta += "<tr>" + "\n"
                + "<td>" + e.getNombres() + " " + e.getApellidos() + "</td>" + "\n";
        if (e.getCurso() != 0) {
            respuesta += "<td>" + e.getGrupo() + " " + e.getCurso() + "</td>" + "\n";
        } else {
            respuesta += "<td>No está asignado a ningún grupo</td>" + "\n";
        }
        respuesta += "<td><label><input class='checkbox' type='checkbox' value=" + e.getIdUsuario() + " name='agregar' checked/><span></span></label</td>" + "\n"
                + "</tr>" + "\n";
    }
    respuesta += "</table>" + "\n";
%>
<%=respuesta%>