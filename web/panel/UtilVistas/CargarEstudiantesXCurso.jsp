<%@page import="ClasesDTO.Estudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    int valor = Integer.parseInt(request.getParameter("valor"));
    ArrayList<Estudiante> estudiantes = controlador.listarEstudianteGrupo(valor);%>
<table class="table table-striped table-bordered table-hover ">
    <%if (estudiantes != null && !estudiantes.isEmpty()) {%>
    <tr>
        <th>Tipo de Documento</th>
        <th>Número de Documento</th>
        <th>Nombre</th>
        <th>Usuario</th>
        <th>Curso</th>
        <th>Ver acudientes</th>
    </tr>

    <% for (Estudiante e : estudiantes) {%>
    <tr>
        <td><%=e.getTipoDoc().getNombreDoc()%></td>
        <td><%=e.getNumDoc()%></td>
        <td><%=e.getNombres() + " " + e.getApellidos()%></td>
        <td><%=e.getUsuario()%></td>
        <%if (e.getCurso() != 0) {%>
        <td><%=e.getGrupo()+ " " + e.getCurso()%></td>
        <%} else {%>
        <td>Sin Grado</td>
        <%}%>
        <td class="boton">
            <button type="button" value="<%="/@" + e.getIdUsuario() + "/@"%>" 
                    class="btn btn-info btn-sm" data-toggle="modal" 
                    data-target="#myModal">
                Ver
            </button>
        </td>
    </tr>
    <%}
    } else {%>
    <tr>
        <th colspan="6" align="center">No hay Estudiantes</th>
    </tr>
    <%}%>
</table>
<script src="../../recursos/js/funciones.js" ></script>
