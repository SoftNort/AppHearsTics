<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="ClasesDTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%
    Usuario usuario = null;
    if (session.getAttribute("usuario") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
    }
    ArrayList<String> rutas = new ArrayList<String>();
    String tarea = "";
    String respuesta = "";
    FileItemFactory file_factory = new DiskFileItemFactory();
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    List items = servlet_up.parseRequest(request);
    String ruta = request.getServletContext().getRealPath("/Respuestas");
    String url = "";
    for (int i = 0; i < items.size(); i++) {
        FileItem item = (FileItem) items.get(i);
        /*item.isFormField() false=input file; true=text field*/
        if (!item.isFormField()) {
            /*cual sera la ruta al archivo en el servidor*/
            File archivo_server = new File(ruta);
            if (!archivo_server.exists()) {
                archivo_server.mkdir();
            }
            url = ruta + "/" + item.getName();
            if (!url.endsWith("Respuestas/")) {
                rutas.add("/Respuestas/" + item.getName());
                File archivo = new File(url);
                item.write(archivo);
            }
        } else {
            if (item.getFieldName().equalsIgnoreCase("respuesta")) {
                respuesta = item.getString();
            }
            if (item.getFieldName().equalsIgnoreCase("tareaRespuesta")) {
                tarea = item.getString();
            }
        }
    }
    boolean b = controlador.crearRespuesta(Long.parseLong(tarea), usuario.getIdUsuario(), respuesta, rutas);
    if (!b) {
%>
<script text="javascript">
    window.location.href = "../Vistas/misTareas.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La tarea ha sido enviada \n\
&urlConfirm=../Vistas/misTareas.jsp\n\
&urlCerrar=../Vistas/misTareas.jsp";
</script>
<%
//        out.print("Respuesta de la tarea enviada");
} else {
%>
<script text="javascript">
    window.location.href = "../Vistas/responderTarea.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede enviar la tarea, <br>Revise que los datos sean validos\n\
&urlConfirm=../Vistas/responderTarea.jsp\n\
&urlCerrar=../Vistas/responderTarea.jsp";
</script>
<%
//        out.print("No se pudo crear la respuesta");
    }
%>

