
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    String idLi = request.getParameter("idLi");
    String url = request.getParameter("url");

    String rutaPath = getServletContext().getRealPath("");
    String carpeta_crear = rutaPath + "\\..\\..\\web\\" + url;
//    String 1carpeta_crear = "../../" + url;
    File fichero = new File(carpeta_crear);
    String b1;

    boolean b = controlador.eliminarLi(idLi);
    if (!b) {
        if (fichero.delete()) {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrar-cabecera.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El submenu ha sido eliminado\n\
&urlConfirm=../Vistas/administrar-cabecera.jsp\n\
&urlCerrar=../Vistas/administrar-cabecera.jsp";
</script>
<%
} else {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrar-cabecera.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El submenu ha sido eliminado de la base de datos, <br>Pero no se pudo eliminar de la pagina\n\
&urlConfirm=../Vistas/administrar-cabecera.jsp\n\
&urlCerrar=../Vistas/administrar-cabecera.jsp";
</script>
<%
    }

} else {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrar-cabecera.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al eliminar el submenu, intentelo mas tarde\n\
&urlConfirm=../Vistas/administrar-cabecera.jsp\n\
&urlCerrar=../Vistas/administrar-cabecera.jsp";
</script>
<%
    }
%>