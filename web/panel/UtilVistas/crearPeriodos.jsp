<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    int year = Integer.parseInt(request.getParameter("year"));
    String fechaInicio1 = request.getParameter("fechaInicio1");
    String fechaFin1 = request.getParameter("fechaFin1");
    String fechaInicio2 = request.getParameter("fechaInicio2");
    String fechaFin2 = request.getParameter("fechaFin2");
    String fechaInicio3 = request.getParameter("fechaInicio3");
    String fechaFin3 = request.getParameter("fechaFin3");
    String fechaInicio4 = request.getParameter("fechaInicio4");
    String fechaFin4 = request.getParameter("fechaFin4");

    SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
    boolean b = true;
    try {
        Date fechaI1 = formatoDelTexto.parse(fechaInicio1);
        Date fechaF1 = formatoDelTexto.parse(fechaFin1);
        Date fechaI2 = formatoDelTexto.parse(fechaInicio2);
        Date fechaF2 = formatoDelTexto.parse(fechaFin2);
        Date fechaI3 = formatoDelTexto.parse(fechaInicio3);
        Date fechaF3 = formatoDelTexto.parse(fechaFin3);
        Date fechaI4 = formatoDelTexto.parse(fechaInicio4);
        Date fechaF4 = formatoDelTexto.parse(fechaFin4);
        if (fechaI1.compareTo(fechaF1)<0 && fechaI2.compareTo(fechaF2)<0 && fechaI3.compareTo(fechaF3)<0 &&fechaI4.compareTo(fechaF4)<0) {
            b = controlador.crearPeriodos(year, fechaI1, fechaI2, fechaI3, fechaI4, fechaF1, fechaF2, fechaF3, fechaF4);
        }
    } catch (ParseException ex) {
        ex.printStackTrace();
    }
    if (!b) {
%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarPeriodo.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se pudo llevar a cabo la transacción, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/gestionarPeriodo.jsp\n\
&urlCerrar=../Vistas/gestionarPeriodo.jsp";
</script>
<%
} else {%>
<script text="javascript">
    window.location.href = "../Vistas/gestionarPeriodo.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Los periodos han sido creados\n\
&urlConfirm=../Vistas/gestionarPeriodo.jsp\n\
&urlCerrar=../Vistas/gestionarPeriodo.jsp";
</script>
<%}%>
