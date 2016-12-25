<%-- 
    Document   : CabeceraAgregar
    Created on : 13/12/2016, 01:47:55 PM
    Author     : Usuario
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    String idNav = request.getParameter("idNav");
    String tituloNav = request.getParameter("tituloNav");
    String posicion = request.getParameter("posicion");
    String nombre = request.getParameter("nombre");

    String rutaPath = getServletContext().getRealPath("");

    String carpeta_crear = rutaPath + "\\..\\..\\web\\" + tituloNav;
    String archivo_nuevo = nombre + ".jsp";
    String archivo_origen = rutaPath + "/../../web/includes/Respaldo.jsp";

    String url = tituloNav + "/" + archivo_nuevo;
    boolean b = controlador.insertarLi(idNav, posicion, nombre, url);
    if (!b) {%>
<script text="javascript">
    window.location.href = "../Vistas/administrar-cabecera.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El submenu ha sido registrado\n\
&urlConfirm=../Vistas/administrar-cabecera.jsp\n\
&urlCerrar=../Vistas/administrar-cabecera.jsp";
</script>
<%
} else {
%>
<script text="javascript">
    window.location.href = "../Vistas/administrar-cabecera.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al registrar el submenu, <br>verifique que los datos sean correctos\n\
&urlConfirm=../Vistas/administrar-cabecera.jsp\n\
&urlCerrar=../Vistas/administrar-cabecera.jsp";
</script>
<%}

    try {
        File carpeta = new File(carpeta_crear);

        File destino = new File(carpeta_crear + "/" + archivo_nuevo);
        if (destino.exists()) {
        } else if (carpeta.exists()) {
            destino.createNewFile();
        } else {
            carpeta.mkdirs();
        }
        File origen = new File(archivo_origen);

        InputStream in = new FileInputStream(origen);
        OutputStream outa = new FileOutputStream(destino);

        byte[] buf = new byte[1024];
        int len;

        while ((len = in.read(buf)) > 0) {
            outa.write(buf, 0, len);
        }

        in.close();
        out.close();
    } catch (IOException ex) {
        ex.printStackTrace();
    }
%>