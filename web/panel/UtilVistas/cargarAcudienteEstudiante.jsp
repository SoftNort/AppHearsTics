<%@page import="ClasesDTO.Acudiente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ClasesDTO.ArchivoRespuesta"%>
<%@page import="ClasesDTO.TareaRespuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    String datos = request.getParameter("valor");
    String vec[] = datos.split("/@");
    ArrayList<Acudiente> acudientes= controlador.listarAcudientesEstudiante(Integer.parseInt(vec[1]));
%>
<div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
        <div class="modal-header small">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Listado de acudientes</h4>
            <h6>Acudientes</h6>
        </div>
        <div class="modal-body">
            <table class="table table-striped table-bordered table-hover">
                
                <tr>
                    <th>Nombre</th>
                    <th>Profesión</th>
                    <th>Teléfono</th>
                </tr>
                <%if(acudientes!=null&&!acudientes.isEmpty()){
                for(Acudiente a:acudientes){%>
                <tr>
                    <td><%=a.getNombres()+" "+a.getApellidos()%></td>
                    <td><%=a.getProfesion()%></td>
                    <td><%=a.getTelefono()%></td>
                </tr>
                <%}}else{%>
                    <tr>
                        <td colspan="3">No tiene acudientes asociados</td>
                </tr>
                <%}%>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
    </div>

</div>
