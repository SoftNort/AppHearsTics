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
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String descripcion = "";
    String fechaEntrega = "";
    String asunto = "";
    String materia = "";
    ArrayList<String> rutas = new ArrayList<String>();
    ArrayList<String> grupos = new ArrayList<String>();
    ArrayList<String> estudiantes = new ArrayList<String>();
    FileItemFactory file_factory = new DiskFileItemFactory();
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    List items = servlet_up.parseRequest(request);
    String ruta = request.getServletContext().getRealPath("/Tareas");
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
            if (!url.endsWith("Tareas/")) {
                rutas.add("/Tareas/" + item.getName());
                File archivo = new File(url);
                item.write(archivo);
            }
        } else {
            if (item.getFieldName().equalsIgnoreCase("grupoMateria")) {
                grupos.add(item.getString());
            }
            if (item.getFieldName().equalsIgnoreCase("descripcion")) {
                descripcion = item.getString();
            }
            if (item.getFieldName().equalsIgnoreCase("agregar")) {
                estudiantes.add(item.getString());
            }
            if (item.getFieldName().equalsIgnoreCase("fechaEntrega")) {
                fechaEntrega = item.getString();
            }
            if (item.getFieldName().equalsIgnoreCase("asunto")) {
                asunto = item.getString();
            }
            if (item.getFieldName().equalsIgnoreCase("materiasDisponibles")) {
                materia = item.getString();
            }
        }
    }
    if (asunto.isEmpty()) {
        out.print("Debe agregar un asunto a la tarea");
    } else {
        if (!estudiantes.isEmpty() || !grupos.isEmpty()) {
            if (!controlador.registrarTarea(estudiantes, grupos, rutas, descripcion, fechaEntrega, usuario.getIdUsuario(), asunto, materia)) {
                out.print("La tarea ha sido creada");
            } else {
                out.print("No se pudo crear la tarea");
            }
        } else {
            out.print("No ha agregado destinatarios a la tarea");
        }
    }
%>
