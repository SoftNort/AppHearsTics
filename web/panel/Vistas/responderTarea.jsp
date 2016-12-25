<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%    session.setAttribute("paginaActual", "responderTarea.jsp");
    Usuario usuario = null;
    ArrayList<TareaEstudiante> tareas = null;
    ArrayList<MateriaDocente> materias = null;
    if (session.getAttribute("usuario") != null && session.getAttribute("rol") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
        materias = controlador.listarMateriasGrupo(usuario.getIdUsuario());
    }
%>
<html class="no-js" lang="en">

    <head>
        <title> ModularAdmin - Free Dashboard Theme | HTML Version </title>
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
                            Responder Tareas
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
                                                    for (MateriaDocente ma : materias) {%>
                                            <option value="<%=ma.getMateria().getId()%>"><%=ma.getMateria().getNombre()%></option>
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
                        <div  id="respuestaTarea"></div>

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
                var ruta = "../UtilVistas/cargarAsuntosTarea.jsp";
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
