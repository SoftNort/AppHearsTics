<%@page import="ClasesDTO.Usuario"%>
<%@page import="ClasesDTO.TareaArchivo"%>
<%@page import="ClasesDTO.TareaEstudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<div>
    <div class="col-md-12">
        <%
            String dato = request.getParameter("valor");
            ArrayList<TareaEstudiante> tareas = null;
            String respuesta = "";
            Usuario usuario = null;
            int con = 0;
            if (session.getAttribute("usuario") == null || session.getAttribute("tareas") == null) {
                out.print("Hubo un error al cargar la tarea");
            } else {
                usuario = (Usuario) session.getAttribute("usuario");
                tareas = controlador.listarTareasMateria(usuario.getIdUsuario(), Long.parseLong(dato));
                respuesta += "<div class='card card-block sameheight-item'>" + "\n"
                        + "<div class='title-block'><h3 class='title'>Listado de tareas</h3></div>" + "\n"
                        + "<div class='table-responsive'><table class='table table-striped table-bordered table-hover'>" + "\n"
                        + "<tr>" + "\n"
                        + "<th>Asunto</th>" + "\n"
                        + "<th>Fecha de entrega</th>" + "\n"
                        + "<th>Ver</th>" + "\n"
                        + "</tr>" + "\n";

                if (tareas != null&&!tareas.isEmpty()) {
                    for (TareaEstudiante tA : tareas) {
                        respuesta += "<tr>" + "\n"
                                + "<td>" + tA.getTarea().getAsunto() + "</td>" + "\n"
                                + "<td>" + tA.getFechaEntrega() + "</td>" + "\n"
                                + "<td><a title='Ver' id='carga" + con + "' class='boton'><i class='fa fa-eye'></i></a></td>" + "\n"
                                + "</tr>" + "\n";
                    }
                    respuesta += "</table></div></div>";
                } else {
                    respuesta += "<td colspan='3'>No hay tareas asociadas a esa materia</td>" + "\n"
                            + "</table></div></div>";
                }
                out.print(respuesta);
            }
        %>
    </div>
    <div class="col-md-12">
        <div id="tablaMaterias"></div>
    </div>
    <script>
        $(document).ready(function() {
            $(".boton").click(function() {
                document.getElementById("tablaMaterias").innerHTML = "";
                var imagen = document.createElement("img");
                imagen.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen.setAttribute("class", "img-gif");
                var bloq = document.getElementById("tablaMaterias");
                bloq.appendChild(imagen);
                var valores = "";
                var ruta = "../UtilVistas/cargarEstudiantesTarea.jsp";
                $(this).parents("tr").find("td").each(function() {
                    valores += $(this).html() + "/@";
                });
                $.post(ruta, {valor: valores},
                function(data, status) {
                    $("#tablaMaterias").html(data);
                });
            });
        });
    </script>
</div>
