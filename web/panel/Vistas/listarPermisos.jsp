<%@page import="ClasesDTO.PaginaTipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio"/>
<%
    String dato = request.getParameter("valor");
    session.setAttribute("rolActual", dato);
    String resultado = "<form action='../UtilVistas/agregarPermisos.jsp' method='post'>" + "\n"
            + "<div class='card card-block'><div class='title-block'><h3 class='title'>Paginas Disponibles<h3></div>" + "\n"
            + "<section class='example'><div class='table-responsive'><table class='table table-striped table-bordered table-hover' style='font-size: .8em'>" + "\n"
            + "<tr>" + "\n"
            + "<th>Nombre</th>" + "\n"
            + "<th>Descripcion</th>" + "\n"
            + "<th>Agregar</th>" + "\n"
            + "</tr>" + "\n";
    ArrayList<PaginaTipoUsuario> pag = controlador.listarPaginasTipoUsuario(Integer.parseInt(dato));
    ArrayList<PaginaTipoUsuario> pag2 = controlador.listarPaginas(Integer.parseInt(dato));
    if (pag != null) {
        for (PaginaTipoUsuario p : pag2) {
            resultado += "<tr>" + "\n"
                    + "<td>" + p.getPagina().getNombre() + "</td>" + "\n"
                    + "<td>" + p.getPagina().getDescripcion() + "</td>" + "\n"
                    + "<td>" + "\n"
                    + "<label>" + "\n"
                    + "<input class='checkbox' name='agregar' type='checkbox' value='" + p.getPagina().getCodigo() + "'/>" + "\n"
                    + "<span><i class='fa fa-check'></i></span>" + "\n"
                    + "<label>" + "\n"
                    + "</td>" + "\n"
                    + "</tr>" + "\n";
            }
    } else {
        resultado += "<td colspan='3'>No hay p�ginas registradas </td>" + "\n";
    }
    resultado += "</table>" + "\n"
            + "<input type='submit' name='guardar' value='Agregar Permisos'  class='btn btn-warning'/>" + "\n"
            + "</div>" + "\n"
            + "</section>"
            + "</div>" + "\n"
            + "</form>";
    out.print(resultado);
        
%>
