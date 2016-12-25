<%@page import="ClasesDTO.TareaEstudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<%
    String valor = request.getParameter("valor").split("/@")[0];
    String respuesta = "";
    ArrayList<TareaEstudiante> tareas = controlador.listarPorAsunto(valor);
%>
<div class="card card-block sameheight-item">
    <div class="title-block"><h3 class="title">Listado de estudiantes</h3></div>
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td>#</td>
                <th>Estudiante</th>
                <th>Calificación</th>
                <th>Estado</th>
                <th>Ver</th>
                <th>Calificar</th>
            </tr>
            <%int cont = 1;
                for (TareaEstudiante t : tareas) {%>
            <tr>
                <td><%=cont%></td>
                <td><%=t.getEstudiante().getNombres() + " " + t.getEstudiante().getApellidos()%></td>

                <% if (t.getEstado().equals("sin responder")) {%>
                <td><input type="number" max="5" min="1"value="<%=t.getCalificacion()%>" id="pos<%=cont%>" name="calificacion" readonly/></td>
                <td style="color: red"><%=t.getEstado()%></td>
                <td class="boton"><button type="button" value="<%="/@" + t.getEstudiante().getIdUsuario() + "-" + t.getTarea().getId() + "/@"%>" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">Ver</button></td>
                <td></td>
                <%} else if (t.getEstado().equals("contestada")) {%>
                <td><input type="number" max="5" min="1"value="<%=t.getCalificacion()%>" id="pos<%=cont%>" name="calificacion" /></td>
                <td style="color: green"><%=t.getEstado()%></td>
                <td class="boton"><button type="button" value="<%="/@" + t.getEstudiante().getIdUsuario() + "-" + t.getTarea().getId() + "/@"%>" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">Ver</button></td>
                <td class="calificar"><input type="button" name="enviarDatos" value="Guardar" class="btn btn-success"/></td>
                    <%} else {%>
                <td></td><td></td><td></td>                
                <%}%>                
            </tr>
            <%cont++;
                }%>
            <tr colspan="4"></tr>
        </table>
    </div>
</div>
<div id="mensajeNota"></div>
<div id="myModal" class="modal fade" role="dialog">

</div>

<script>
    $(document).ready(function() {
        var imagen = document.createElement("img");
        imagen.setAttribute("src", "../../recursos/img/cargando.gif");
        imagen.setAttribute("class", "img-gif");
        var bloq = document.getElementById("myModal");
        bloq.appendChild(imagen);
        $(".boton").click(function() {
            var valores = "";
            var ruta = "../UtilVistas/cargarArchivosTarea.jsp";
            $(this).parents("tr").find("td").each(function() {
                valores += $(this).html() + "/@";
            });
            $.post(ruta, {valor: valores},
            function(data, status) {
                $("#myModal").html(data);
            });
        });
    });
</script>

<script>
    $(document).ready(function() {
        $(".calificar").click(function() {
            var imagen = document.createElement("img");
            imagen.setAttribute("src", "../../recursos/img/cargando.gif");
            imagen.setAttribute("class", "img-gif");
            var bloq = document.getElementById("mensajeNota");
            bloq.appendChild(imagen);
            var valores = "";
            var ruta = "../UtilVistas/calificarTareaEstudiante.jsp";
            $(this).parents("tr").find("td").each(function() {
                valores += $(this).html() + "/@";
            });
            var filaCompleta = valores.split("/@");
            var nota = filaCompleta[0];
            var posicion = 'pos' + nota;
            var finalNota = document.getElementById(posicion).value;
            console.log(finalNota);
            $.post(ruta, {valor: valores, nota: finalNota},
            function(data, status) {
                $("#mensajeNota").html(data);
            });
        });
    });
</script>