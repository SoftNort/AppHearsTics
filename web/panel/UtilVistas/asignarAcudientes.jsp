
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />

<%
    String acudiente = "";
    String est[] = request.getParameterValues("subir");
    if(session.getAttribute("userAcudiente")!=null){
     acudiente = (String) session.getAttribute("userAcudiente");
    }else{
        acudiente = request.getParameter("acudienteSlt");
    }
    boolean p = controlador.asignarAcudiente(est, acudiente);

    if (p) {%>
<script text="javascript">
    window.location.href = "../Vistas/asignarAcudientes.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Los estudiantes han sido agregados\n\
&urlConfirm=../Vistas/asignarAcudientes.jsp\n\
&urlCerrar=../Vistas/asignarAcudientes.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/asignarAcudientes.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar asignar los estudiantes, intente de nuevo\n\
&urlConfirm=../Vistas/asignarAcudientes.jsp\n\
&urlCerrar=../Vistas/asignarAcudientes.jsp";
</script> 
<%}%>
