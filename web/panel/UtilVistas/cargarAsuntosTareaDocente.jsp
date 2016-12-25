<%@page import="ClasesDTO.TareaEstudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ClasesDTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<!DOCTYPE html>
<%
    int idMateria = Integer.parseInt(request.getParameter("valor"));
    Usuario usuario = null;
    ArrayList<TareaEstudiante> tareas = null;
    if (session.getAttribute("usuario") != null && session.getAttribute("rol") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
        tareas = controlador.listarMisTareasDocente(usuario.getIdUsuario());
        session.setAttribute("tareas", tareas);
    }
%>
<select id="tareas" class="form-control">
    <option value="">Seleccione la tarea</option>
    <%if (tareas == null||tareas.isEmpty()) {%>
    <option>No hay tareas disponibles</option>  
    <%} else
        for (TareaEstudiante t : tareas) {
            if (idMateria==t.getMateria().getId()) {%>
    <option value="<%=t.getTarea().getId()%>"><%=t.getTarea().getAsunto()%></option>
    <%}
        }%>
</select>


 <script>
            $("#tareas").on("change", function() {
                var imagen = document.createElement("img");
                imagen.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen.setAttribute("class", "img-gif");
                var bloq = document.getElementById("respuestaTarea");
                bloq.appendChild(imagen);
                var valor = document.getElementById("tareas").value;
                var ruta = "../UtilVistas/visualizarMisTareas.jsp";
                $.post(ruta,
                        {
                            valor: valor,
                        },
                        function(data, status) {
                            $("#respuestaTarea").html(data);
                            document.getElementById("oculto").style.visibility="visible";
                        });
            });
        </script>