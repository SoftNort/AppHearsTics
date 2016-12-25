<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "listarEstudiantes.jsp");
    ArrayList<Curso> cursos = controlador.listarCursos();
%>
<html class="no-js" lang="en">

    <head>
        <title> ModularAdmin - Free Dashboard Theme | HTML Version </title>
        <%@include file="AdministrarHtml/Links.jsp" %>
    </head>

    <body>
        <jsp:include page="../validar.jsp" flush="true"/>
        <jsp:include page="../Util/validarPermisos.jsp" flush="true"/>        
        <%@include file="AdministrarHtml/MensajesAlerts.jsp" %>
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
                            Listado de estudiantes 
                        </h3>
                        <p class="title-description"> 

                        </p>
                    </div>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12">
                                <div class="card card-block">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Estudiantes
                                        </h3> 
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Seleccione el curso</label>
                                        <select id="cursosList" class="form-control">
                                            <option>Seleccione un Curso </option>
                                            <%for (Curso e : cursos) {%>
                                            <option value="<%=e.getIdCurso()%>"><%=e.getDescripcion()%></option>
                                            <%}%>
                                        </select>
                                    </div>   
                                    <div class="form-group col-md-6" id="gruposList">                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12">
                                <div class="card card-block">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Estudiantes Registrados
                                        </h3> 
                                    </div>
                                    <div class="table-responsive" id="cargarEstudiantes">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </article>
                <div id="myModal" class="modal fade" role="dialog">

                </div>
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
        <script src="../../recursos/js/funciones.js" ></script>
        <script>
            //Ver Grupos y Estudiantes segun el Curso seleccionado
            $("#cursosList").on("change", function() {
                document.getElementById("gruposList").innerHTML = "";
                document.getElementById("cargarEstudiantes").innerHTML = "";
                var imagen1 = document.createElement("img");
                var imagen2 = document.createElement("img");
                imagen1.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen1.setAttribute("class", "img-gif");
                imagen2.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen2.setAttribute("class", "img-gif");
                var bloq = document.getElementById("gruposList");
                var bloq1 = document.getElementById("cargarEstudiantes");
                bloq.appendChild(imagen1);
                bloq1.appendChild(imagen2);
                var curso = document.getElementById("cursosList").value;
                console.log(curso + "curso");
                var ruta = "../UtilVistas/CargarGradosPorCurso.jsp";
                var ruta1 = "../UtilVistas/CargarEstudiantesXCurso.jsp";
                $.post(ruta, {valor: curso},
                function(data, status) {
                    $("#gruposList").html(data);
                });
                $.post(ruta1, {valor: curso},
                function(data, status) {
                    $("#cargarEstudiantes").html(data);
                });
            });
        </script>

    </body>
</html>
