<%@page import="ClasesDTO.Materia"%>
<%@page import="ClasesDTO.MateriaDocente"%>
<%@page import="ClasesDTO.TareaEstudiante"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<!DOCTYPE html>
<%    session.setAttribute("paginaActual", "verTareas.jsp");
    Usuario usuario = null;
    ArrayList<Materia> materias = null;
    if (session.getAttribute("usuario") != null && session.getAttribute("rol") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
        materias = controlador.listarMateriaDocente(usuario.getIdUsuario());
    }
%>
<html class="no-js" lang="en">

    <head>
        <title> Heart TICS </title>
        <%@include file="AdministrarHtml/Links.jsp" %>
        <style>
            .img-gif{
                display: block;
                width: 30px;
                height: 30px;
            }
        </style>
    </head>
    <body>
        <div class="main-wrapper">
            <div class="app" id="app">
                <%@include file="AdministrarHtml/Header.jsp" %>
                <aside class="sidebar">
                    <div class="sidebar-container">
                        <%@include file="AdministrarHtml/Logo.jsp" %>
                        <nav class="menu">
                            <ul class="nav metismenu" id="sidebar-menu">
                                <%@include file="AdministrarHtml/MenuLinks.jsp" %>
                            </ul>
                        </nav>
                    </div>
                    <%@include file="AdministrarHtml/CambiarInterfaz.jsp" %>
                </aside>
                <div class="sidebar-overlay" id="sidebar-overlay"></div>

                <article class="content forms-page">
                    <div class="title-block">
                        <h3 class="title">
                            Mis Tareas
                        </h3>
                        <p class="title-description">  </p>
                    </div>
                    <section class="section">
                        <div class="col-md-12">
                            <div class="card card-block sameheight-item">
                                <form method="post" id="formu">
                                    <div class="form-group">
                                        <label>Materias disponibles</label>
                                        <select id="materiasGrupo" class="form-control">
                                            <option>Seleccione una materia</option>
                                            <%if (materias != null && !materias.isEmpty()) {
                                                    for (Materia ma : materias) {%>
                                            <option value="<%=ma.getId()%>"><%=ma.getNombre()%></option>
                                            <%}
                                            } else {%>
                                            <option>No hay materias disponibles</option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="table-responsive">  
                                        <div id="respuesta"></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <form method="post" action="../UtilVistas/modificarTarea.jsp" id="frmModificarTarea">
                            <div  id="respuestaTarea"></div>
                            <div id="oculto" style="visibility:hidden;">
                                <input type="submit" name="cambiar" value="Guardar Cambios" class="btn btn-warning" id="btnCambiar"/>Guardar Cambios
                            </div>
                        </form>

                        <div id="respuesta2"></div>
                    </section>
                </article>
                <%@include file="AdministrarHtml/Footer.jsp" %>
                <%@include file="AdministrarHtml/Ventanas.jsp" %>
            </div>
        </div>
        <!-- Reference block for JS -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>


        <script>
            $("#materiasGrupo").on("change", function() {
                document.getElementById("respuesta").innerHTML = "";
                var valor = document.getElementById('materiasGrupo').value;
                var imagen1 = document.createElement("img");
                imagen1.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen1.setAttribute("class", "img-gif");
                var bloq1 = document.getElementById("respuesta");
                bloq1.appendChild(imagen1);
                var ruta = "../UtilVistas/cargarAsuntosTareaDocente.jsp";
                $.post(ruta,
                        {
                            valor: valor},
                function(data) {
                    $("#respuesta").html(data);
                });
            });
        </script>
    </body>
</html>
