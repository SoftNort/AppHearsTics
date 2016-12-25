<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="javax.print.attribute.Size2DSyntax.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    request.setCharacterEncoding("UTF-8");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String tipoDoc = request.getParameter("tipoDoc");
    String numDoc = request.getParameter("numDoc");
    String correo = request.getParameter("correo");
    String fechaNacimiento = request.getParameter("fechaNacimiento");
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
    String rol = request.getParameter("rol");
    String contra = request.getParameter("contra");

    SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
    Date fecha = null;
    try {
        if (fechaNacimiento != null && !fechaNacimiento.isEmpty()) {
            fecha = formatoDelTexto.parse(fechaNacimiento);
        }
        boolean es = controlador.registrarUser(Integer.parseInt(tipoDoc), numDoc, correo, fecha,
                tipoSangre, ciudadActual, departamentoActual, genero, eps,
                nombre, apellido, telefono, ciudadNacimiento, departamentoNacimiento,
                paisNacimiento, paisActual, usuario, contra, Integer.parseInt(rol));
        if (!es) {
%>
<script text="javascript">
    window.location.href = "../Vistas/registrarUsuario.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar el usuario, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/registrarUsuario.jsp\n\
&urlCerrar=../Vistas/registrarUsuario.jsp";
</script>
<%
} else {%>
<script text="javascript">
    window.location.href = "../Vistas/registrarUsuario.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El usuario ha sido registrado\n\
&urlConfirm=../Vistas/registrarUsuario.jsp\n\
&urlCerrar=../Vistas/registrarUsuario.jsp";
</script>
<%

        }

    } catch (ParseException ex) {

        ex.printStackTrace();

    }

%>
