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
    String rol = request.getParameter("roles");
    int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));    
    String tipoUsu = request.getParameter("tipoUsu");    
    String curso = request.getParameter("curso");
    String profesion = request.getParameter("profesion");

    SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
    Date fecha = null;

    try {
        if (fechaNacimiento != null && !fechaNacimiento.isEmpty()) {
            fecha = formatoDelTexto.parse(fechaNacimiento);
        }
        if (!tipoUsu.equalsIgnoreCase("estudiante") && !tipoUsu.equalsIgnoreCase("docente") && !tipoUsu.equalsIgnoreCase("acudiente")) {
            boolean es = controlador.actualizarUser(Integer.parseInt(tipoDoc), numDoc, correo, fecha,
                    tipoSangre, ciudadActual, departamentoActual, genero, eps,
                    nombre, apellido, telefono, ciudadNacimiento, departamentoNacimiento,
                    paisNacimiento,
                    paisActual,
                    Integer.parseInt(rol),
                    idUsuario);
            if (es) {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&tipoModal=mensaje\n\
&mensajeModal=No se puede actualizar el usuario, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&urlCerrar=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>";
</script>
<%
} else {%>
<script text="javascript">
    window.location.href = "../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&tipoModal=mensaje\n\
&mensajeModal=El usuario ha sido actualizado\n\
&urlConfirm=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&urlCerrar=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>";
</script>
<%}
    }
    if (tipoUsu.equalsIgnoreCase("estudiante")) {
        boolean es = controlador.actualizarEstudiante(Integer.parseInt(tipoDoc), numDoc, correo, fecha,
                tipoSangre, ciudadActual, departamentoActual, genero, eps,
                nombre, apellido, telefono, ciudadNacimiento, departamentoNacimiento,
                paisNacimiento,
                paisActual,
                Integer.parseInt(curso),
                idUsuario);
        if (es) {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&tipoModal=mensaje\n\
&mensajeModal=No se puede actualizar el estudiante, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&urlCerrar=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>";
</script>
<%
} else {%>
<script text="javascript">
    window.location.href = "../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&tipoModal=mensaje\n\
&mensajeModal=El estudiante ha sido actualizado\n\
&urlConfirm=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&urlCerrar=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>";
</script>
<%}
    }
    if (tipoUsu.equalsIgnoreCase("acudiente")) {
        boolean es = controlador.actualizarAcudiente(Integer.parseInt(tipoDoc), numDoc, correo, fecha,
                tipoSangre, ciudadActual, departamentoActual, genero, eps,
                nombre, apellido, telefono, ciudadNacimiento, departamentoNacimiento,
                paisNacimiento,
                paisActual,
                profesion,
                idUsuario);
        if (es) {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&tipoModal=mensaje\n\
&mensajeModal=No se puede actualizar el acudiente, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&urlCerrar=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>";
</script>
<%
} else {%>
<script text="javascript">
    window.location.href = "../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&tipoModal=mensaje\n\
&mensajeModal=El acudiente ha sido actualizado\n\
&urlConfirm=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>\n\
&urlCerrar=../Vistas/administrarInformacion.jsp?idUsu=<%=idUsuario%>";
</script>
<%}
        }
    } catch (ParseException ex) {
        ex.printStackTrace();
    }
%>
