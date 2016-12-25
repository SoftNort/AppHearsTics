<%@page import="ClasesDTO.Periodo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    Periodo p = controlador.activarPeriodo();
    String mensaje ="No ha sido llamado el metodo";
    if(p!=null){
        mensaje = "El periodo "+p.getNumero()+" del año "+p.getYear()+" ha sido activado";
        session.setAttribute("periodo", p);
    }else{
        mensaje= "No existe un periodo válido para activación";
    }
    out.print(mensaje);
%>
