<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%
    ArrayList<String> rutas = new ArrayList<String>();
    int idMateria=0;
    FileItemFactory file_factory = new DiskFileItemFactory();
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    List items = servlet_up.parseRequest(request);
    String ruta = request.getServletContext().getRealPath("/Nube");
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
            if (!url.endsWith("Nube/")) {
                rutas.add("/Nube/" + item.getName());
                File archivo = new File(url);
                item.write(archivo);
            }
        } else {
            if (item.getFieldName().equalsIgnoreCase("sltMaterias")) {
               idMateria =  Integer.parseInt(item.getString());
            }
        }
    }
    if (!controlador.insertarArchivoNube(rutas, idMateria)) {
        out.print("Los archivos se han subido");
    } else {
        out.print("No se pudo realizar la operación");
    }

%>