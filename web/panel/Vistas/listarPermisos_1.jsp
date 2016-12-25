<%@page import="ClasesDTO.PaginaTipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio"/>
<%
    String dato = request.getParameter("valor");
    session.setAttribute("rolActual", dato);
    ArrayList<PaginaTipoUsuario> pag = controlador.listarPaginasTipoUsuario(Integer.parseInt(dato));
    String resultado = "<form id='frmEliminarTipoDoc' action='../UtilVistas/eliminarPermisos.jsp' method='post'>" + "\n"
            + "<div class='card card-block'><div class='title-block'><h3 class='title'>Paginas Disponibles<h3></div>" + "\n"
            + "<section class='example'><div class='table-responsive'><table class='table table-striped table-bordered table-hover' style='font-size: .8em'>" + "\n"
            + "<tr>" + "\n"
            + "<th>Nombre</th>" + "\n"
            + "<th>Descripcion</th>" + "\n"
            + "<th>Eliminar</th>" + "\n"
            + "</tr>" + "\n";
    if (pag != null && pag.size() > 0) {
        for (PaginaTipoUsuario p : pag) {
            resultado += "<tr>" + "\n"
                    + "<td>" + p.getPagina().getNombre() + "</td>" + "\n"
                    + "<td>" + p.getPagina().getDescripcion() + "</td>" + "\n"
                    + "<td>" + "\n"
                     + "<label>" + "\n"
                    + "<input class='checkbox' name='eliminar' type='checkbox' value='" + p.getPagina().getCodigo() + "'/>" + "\n"
                    + "<span><i class='fa fa-check'></i></span></label>" + "\n"
                    + "</td>" + "\n"
                    + "</tr>" + "\n";
        }
    } else {
        resultado += "<td colspan='3'>No hay p�ginas registradas </td>" + "\n";
    }
    resultado += "</table>" + "\n"
            + "<input type='submit' name='guardar' value='Eliminar'  class='btn btn-warning'/>" + "\n"
            + "</div>" + "\n"
            + "</section>"
            + "</div>" + "\n"
            + "</form>";
    out.print(resultado);
%>

