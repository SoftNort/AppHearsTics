<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "calificarTarea.jsp");
    Usuario usuario = null;
    if (session.getAttribute("usuario") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
    }
    ArrayList<Materia> materias = controlador.listarMateriaDocente(usuario.getIdUsuario());
    ArrayList<TareaEstudiante> tareas = controlador.listarTareaDocente(usuario.getIdUsuario());
    session.setAttribute("tareas", tareas);
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
                            Gestionar tipo de usuario 
                        </h3>
                        <p class="title-description"> 
                            Agregar y/o eliminar los roles
                        </p>
                    </div>
                    <section class="section">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-block sameheight-item">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Materias
                                        </h3> 
                                    </div>
                                    <div class="table-responsive">
                                        <form method="post" id="formu">
                                            <label>Seleccione la materia</label>
                                            <select id="materias" class="form-control">
                                                <option>Seleccione una opción</option>
                                                <%if (materias == null) {%>
                                                <option>No hay materias disponibles</option>  
                                                <%} else
                                                    for (Materia t : materias) {%>
                                                <option value="<%=t.getId()%>"><%=t.getNombre()%></option>
                                                <%}%>
                                            </select>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="respuestaTarea">
                            </div>
                        </div>
                    </section>
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
            $("#materias").on("change", function() {
                document.getElementById("respuestaTarea").innerHTML = "";
                var imagen = document.createElement("img");
                imagen.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen.setAttribute("class", "img-gif");
                var bloq = document.getElementById("respuestaTarea");
                bloq.appendChild(imagen);
                var valor = document.getElementById("materias").value;
                console.log(valor + "valor");
                var ruta = "../UtilVistas/cargarTareasDocente.jsp";
                $.post(ruta,
                        {
                            valor: valor
                        },
                function(data, status) {
                    $("#respuestaTarea").html(data);
                });
            });
        </script>
</html>
