<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "actualizarCE.jsp");
    ArrayList<Estudiante> estudiantes = controlador.listarEstudiantesGrupo();;
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
                            Listado de estudiantes sin grado asignado
                        </h3>
                        <p class="title-description">  </p>
                    </div>
                    <section class="section">
                        <div class="card">
                            <div class="card-block">
                                <div class="title-block">
                                    <h3 class="title">
                                        Listado de estudiantes
                                    </h3> 
                                </div>
                                <div class="table-responsive">
                                    <form id="frmEliminarTipoDoc" action="../UtilVistas/actualizarGrado.jsp" method="post">
                                        <select name="estudiante" id="estudiante" class="form-control">
                                            <option value="">Seleccion el estudiante </option>
                                            <%for (Estudiante e : estudiantes) {%>
                                            <option value="<%=e.getIdUsuario()%>"><%=e.getNombres() + " " + e.getApellidos()%></option>
                                            <%}%>
                                        </select>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </section>

                    <div id="respuesta"></div>
                </article>
                <%@include file="AdministrarHtml/Ventanas.jsp" %>
                <%@include file="AdministrarHtml/Footer.jsp" %>
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
            $("#estudiante").on("change", function() {
                document.getElementById("respuesta").innerHTML = "";
                var imagen = document.createElement("img");
                imagen.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen.setAttribute("class", "img-gif");
                var bloq = document.getElementById("respuesta");
                bloq.appendChild(imagen);
                var valor = document.getElementById('estudiante').value;
                var ruta = "../UtilVistas/actualizarCurso.jsp";
                $.post(ruta,
                        {
                            valor: valor
                        },
                function(data) {
                    $("#respuesta").html(data);
                });
            });
        </script>
    </body>
</html>