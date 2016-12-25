<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%
    String datos = request.getParameter("valor");
    float nota = Float.parseFloat(request.getParameter("nota"));
    String vec[] = datos.split("/@");
    String mensaje = "Error";
    if (vec[3].equalsIgnoreCase("contestada")) {
        boolean b = controlador.calificarTareasEstudiante(vec[5], nota);
        if (!b) {
            mensaje = "La calificación de " + vec[1] + " ha sido guardada con éxito";
        } else {
            mensaje = "La calificación no se ha podido guardar, inténtalo mas tarde";
        }
    }else{
        mensaje = "El estudiante "+vec[1]+" aún no ha contestado a esta tarea";
    }
        
    out.print(mensaje);
%>
