
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    Date ahora = new Date();
    SimpleDateFormat formateador1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    String fechaActual = formateador1.format(ahora);
    SimpleDateFormat formateador2 = new SimpleDateFormat("hh:mm:ss");
    String horaActual = formateador2.format(ahora);
%>
<%    int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
    String idPin = request.getParameter("idPin");
    String fVencimi = request.getParameter("fVencim");
    char[] arrayChar = fVencimi.toCharArray();
    String fVencimi1 = "";
    if (arrayChar.length != 10) {
        fVencimi1 = fVencimi;
    } else {
        fVencimi1 = fVencimi+" "+ horaActual;
    }
    String estado = request.getParameter("estado");
    boolean c = controlador.editarPin(fechaActual, fVencimi1, idPin, estado, idUsuario);
    if (!c) {%>
<script text="javascript">
    window.location.href = "../Vistas/administrarPinEstudiante.jsp?idEst=<%=idUsuario%>\n\
&tipoModal=mensaje\n\
&mensajeModal=El pin ha sido editado\n\
&urlConfirm=../Vistas/administrarPinEstudiante.jsp?idEst=<%=idUsuario%>\n\
&urlCerrar=../Vistas/administrarPinEstudiante.jsp?idEst=<%=idUsuario%>";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/administrarPinEstudiante.jsp?idEst=<%=idUsuario%>\n\
&tipoModal=mensaje\n\
&mensajeModal=No se puede editar el pin,<br>Verifique que los datos sean correctos\n\
&urlConfirm=../Vistas/administrarPinEstudiante.jsp?idEst=<%=idUsuario%>\n\
&urlCerrar=../Vistas/administrarPinEstudiante.jsp?idEst=<%=idUsuario%>";
</script>
<%}
%>
