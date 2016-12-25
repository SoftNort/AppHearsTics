<%@page import="ClasesDTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
    int idUsuario =-1;
    String foto="";
    FileItemFactory file_factory = new DiskFileItemFactory();
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    List items = servlet_up.parseRequest(request);
    String ruta = request.getServletContext().getRealPath("/Perfil");
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
            if (!url.endsWith("Perfil/")) {
                File archivo = new File(url);
                item.write(archivo);
                foto="Perfil/"+item.getName();
            }
        } else {
            if (item.getFieldName().equalsIgnoreCase("estudiantesSlt")) {
                idUsuario = Integer.parseInt(item.getString());
            }
        }
    }
    if(!controlador.actualizarFoto(idUsuario, foto)){
        out.print("La foto de perfil ha sido agregada"+idUsuario+" - "+foto);
    }else{
        out.print("No se ha podido agregar la foto de perfil");
    }
    
%>

