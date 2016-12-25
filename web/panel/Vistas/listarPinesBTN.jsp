<%@page import="ClasesDTO.Pin"%>
<%@page import="ClasesDTO.PaginaTipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    String dato = request.getParameter("valor");
    String[] v = dato.split("-");
    ArrayList<Pin> listPin2 = controlador.listarEstudiantesPinGrupo(Integer.parseInt(v[0]), v[1].charAt(0));
    ArrayList<Pin> ListPin = controlador.listarEstudiantesPinCurso(Integer.parseInt(v[0]));
    String resultado = "";  
    if ( ListPin.isEmpty() == false || listPin2.isEmpty() == false){
        resultado+= "<div class='col-md-12' style='text-align: center'> <input type='submit' value='Imprimir'  class='btn btn-success'/></div>";
    }
%>
<%=resultado%>
