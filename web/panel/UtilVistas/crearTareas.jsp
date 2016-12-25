<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<%
    ArrayList<String> grupos = new ArrayList<String>();
    String descripcion;
    String fechaEntrega;
    ArrayList<String> estudiantes = new ArrayList<String>();
    /*FileItemFactory es una interfaz para crear FileItem*/
    FileItemFactory file_factory = new DiskFileItemFactory();
    /*ServletFileUpload esta clase convierte los input file a FileItem*/
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    /*sacando los FileItem del ServletFileUpload en una lista */
    List items = servlet_up.parseRequest(request);
    String ruta = request.getServletContext().getRealPath("/subidos/fisica");
    File f = new File(ruta);
    String url ="";
    int cont=0;
    for (int i = 0; i < items.size(); i++) {
        /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
        FileItem item = (FileItem) items.get(i);
        /*item.isFormField() false=input file; true=text field*/
        if (!item.isFormField()) {
            /*cual sera la ruta al archivo en el servidor*/
            File archivo_server = new File(ruta);
            if(!archivo_server.exists()){
                archivo_server.mkdir();
            }
            url = ruta+"/"+item.getName();
            File archivo = new File(url);
            item.write(archivo);
            cont++;
        }else{
            if(item.getFieldName().equalsIgnoreCase("descripcion")){
                descripcion = item.getString();
            }
            if(item.getFieldName().equalsIgnoreCase("fechaEntrega")){
                fechaEntrega = item.getString();
            }
            if(item.getFieldName().equalsIgnoreCase("agregar")){
                estudiantes.add(item.getString());
            }
            if(item.getFieldName().equalsIgnoreCase("seleccion")){
                grupos.add(item.getString());
            }
        }
    }
    
    
%>
