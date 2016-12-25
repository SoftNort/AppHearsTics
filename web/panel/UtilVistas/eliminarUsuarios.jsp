
<%@page import="ClasesDTO.Acudiente"%>
<%@page import="ClasesDTO.Estudiante"%>
<%@page import="ClasesDTO.Usuario"%>
<%@page import="ClasesDTO.TipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    request.setCharacterEncoding("UTF-8");
    ArrayList<TipoUsuario> tipos = controlador.listarTiposUsuario();

    int idUsuario;
    if (request.getParameter("idUsu") == null) {
        idUsuario = 0;
    } else {
        idUsuario = Integer.parseInt(request.getParameter("idUsu"));
    }
    Usuario dtoUsu = controlador.datosUsuario(idUsuario);
    String tipoU = "";
    for (TipoUsuario tipUs : tipos) {
        if (tipUs.getId() == dtoUsu.getIdTipoUsuario()) {
            tipoU = tipUs.getRol();
        }
    }
%>
<%
    String tipoUsu = tipoU;

    if (!tipoUsu.equalsIgnoreCase("estudiante") && !tipoUsu.equalsIgnoreCase("docente") && !tipoUsu.equalsIgnoreCase("acudiente")) {
        boolean es = controlador.eliminarUsuario(idUsuario);
        if (es) {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrarUsuarios.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede eliminar el usuario, <br>Intente mas tarde\n\
&urlConfirm=../Vistas/administrarUsuarios.jsp\n\
&urlCerrar=../Vistas/administrarUsuarios.jsp";
</script>
<%
} else {%>
<script text="javascript">
    window.location.href = "../Vistas/administrarUsuarios.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El usuario ha sido eliminado\n\
&urlConfirm=../Vistas/administrarUsuarios.jsp\n\
&urlCerrar=../Vistas/administrarUsuarios.jsp";
</script>
<%}
    }
    if (tipoUsu.equalsIgnoreCase("estudiante")) {
        boolean es = controlador.eliminarEstudiante(idUsuario);
        if (es) {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrarUsuarios.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede eliminar el estudiante, <br>Intente mas tarde\n\
&urlConfirm=../Vistas/administrarUsuarios.jsp\n\
&urlCerrar=../Vistas/administrarUsuarios.jsp";
</script>
<%
} else {%>
<script text="javascript">
    window.location.href = "../Vistas/administrarUsuarios.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El estudiante ha sido eliminado\n\
&urlConfirm=../Vistas/administrarUsuarios.jsp\n\
&urlCerrar=../Vistas/administrarUsuarios.jsp";
</script>
<%}
    }
    if (tipoUsu.equalsIgnoreCase("acudiente")) {
        boolean es = controlador.eliminarAcudiente(idUsuario, dtoUsu.getUsuario());
        if (es) {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrarUsuarios.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede eliminar el acudiente, <br>Intente mas tarde\n\
&urlConfirm=../Vistas/administrarUsuarios.jsp\n\
&urlCerrar=../Vistas/administrarUsuarios.jsp";
</script>
<%
} else {%>
<script text="javascript">
    window.location.href = "../Vistas/administrarUsuarios.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El acudiente ha sido eliminado\n\
&urlConfirm=../Vistas/administrarUsuarios.jsp\n\
&urlCerrar=../Vistas/administrarUsuarios.jsp";
</script>
<%}
    }%>
