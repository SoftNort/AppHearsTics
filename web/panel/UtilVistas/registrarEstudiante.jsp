<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="javax.print.attribute.Size2DSyntax.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Date fecha = new Date();
    String year = "";
    int iEntero = fecha.getYear() + 1900;
    year = String.valueOf(iEntero) + "-11-30";
%>

<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    request.setCharacterEncoding("UTF-8");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String tipoDoc = request.getParameter("tipoDoc");
    String numDoc = request.getParameter("numDoc");
    String correo = request.getParameter("correo");
    String fechaNacimiento = request.getParameter("fechaNacimiento");
    String fechaVencimiento = request.getParameter("fechaVencimiento");
    String tipoSangre = request.getParameter("tipoSangre");
    String ciudadNacimiento = request.getParameter("ciudadNacimiento");
    String departamentoNacimiento = request.getParameter("departamentoNacimiento");
    String paisNacimiento = request.getParameter("paisNacimiento");
    String ciudadActual = request.getParameter("ciudadActual");
    String departamentoActual = request.getParameter("departamentoActual");
    String paisActual = request.getParameter("paisActual");
    String genero = request.getParameter("genero");
    String eps = request.getParameter("eps");
    String telefono = request.getParameter("telefono");
    String usuario = request.getParameter("usuario");
    String contra = request.getParameter("contra");
    int grupo = Integer.parseInt(request.getParameter("grupo"));

    SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
    Date fechaNac = null;
    try {
        if (fechaVencimiento.equals("")) {
            fechaVencimiento = year;
        }
        if (fechaNacimiento != null && !fechaNacimiento.isEmpty()) {
            fechaNac = formatoDelTexto.parse(fechaNacimiento);
        }

        String es = controlador.registrarUsuario(Integer.parseInt(tipoDoc), numDoc, correo, fechaNac,
                tipoSangre, ciudadActual, departamentoActual, genero, eps,
                nombre, apellido, telefono, ciudadNacimiento, departamentoNacimiento,
                paisNacimiento, paisActual, usuario, contra, grupo, fechaVencimiento);
        if (es != null) {
            String pin = es.substring(0, 15);
            String idEst = es.substring(15);
%>
<script text="javascript">
    var s = "<%=pin%>";
    window.location.href = "../Vistas/registrarEstudiante.jsp\n\
?tipoModal=confirmar\n\
&mensajeModal=El pin es: " + s + " , <br>Desea imprimirlo?\n\
&urlConfirm=../../GenerarPinEstudiante?idEst=<%=idEst%>\n\
&urlCerrar=../Vistas/registrarEstudiante.jsp";
//    alert("Su pin es: "+s);
//    window.location.href = "../Vistas/imprimirPin.jsp";
</script>
<%
} else {%>
<script text="javascript">
    window.location.href = "../Vistas/registrarEstudiante.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar el estudiante, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/registrarEstudiante.jsp\n\
&urlCerrar=../Vistas/registrarEstudiante.jsp";
</script>
<%

        }

    } catch (ParseException ex) {

        ex.printStackTrace();

    }

%>
