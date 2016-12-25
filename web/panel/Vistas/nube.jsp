<%@page import="ClasesDTO.Usuario"%>
<%@page import="ClasesDTO.Materia"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="AdministrarHtml/Links.jsp"%>    
    </head>
    <body>
        <%session.setAttribute("paginaActual", "nube.jsp");%>
        <jsp:include page="../validar.jsp" flush="true"/>
        <jsp:include page="../Util/validarPermisos.jsp" flush="true"/>        
        <%@include file="AdministrarHtml/MensajesAlerts.jsp" %>
        <%
            ArrayList<Materia> materias = null;
            Usuario usuario = null;
            if (session.getAttribute("usuario") != null) {
                usuario = (Usuario) session.getAttribute("usuario");
                materias = controlador.listarMateriaDocente(usuario.getIdUsuario());
            }

        %>
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
                            Nube Heart Tics
                        </h3>
                        <p class="title-description"> </p>
                    </div>
                    <section class="section">
                            <div class="col col-xs-12 col-sm-12 col-md-12 col-xl-12 history-col">
                                <div class="card " data-exclude="xs">
                                    <div class="card-header card-header-sm bordered">
                                        <div class="header-block">
                                        <h3 class="title">Materias</h3> 
                                    </div>
                                    <ul class="nav nav-tabs pull-right" role="tablist">
                                        <li class="nav-item"> <a class="nav-link active" href="#ver" role="tab" data-toggle="tab">Ver archivos</a> </li>
                                        <li class="nav-item"> <a class="nav-link" href="#subir" role="tab" data-toggle="tab">Subir archivos</a> </li>
                                    </ul>
                                </div>
                                <div class="card-block">
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active fade in" id="ver">
                                            <form id="archivosDisponibles" method="post">
                                                <div class="form-group">
                                                    <label>Seleccione la materia para cargar grupos</label>
                                                    <select class="form-control" name="materias" id="materias">
                                                        <%if (materias == null || materias.isEmpty()) {%>
                                                        <option>No hay materias disponibles</option>
                                                        <%} else {%>
                                                        <option>Seleccione una materia</option>    
                                                        <%for (Materia m : materias) {%>
                                                        <option value="<%=m.getId()%>"><%=m.getNombre()%></option>
                                                        <%}
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div id="respuesta"></div>
                                            </form>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade in" id="subir">
                                            <form id="subirArchivos" method="post">
                                                <div class="form-group">
                                                    <label>Seleccione la materia</label>
                                                    <select class="form-control" name="materias2" id="materias2">
                                                        <%
                                                            if (materias == null || materias.isEmpty()) {%>
                                                        <option>No hay materias disponibles</option>
                                                        <%} else {%>
                                                        <option>Seleccione una materia</option>
                                                        <% for (Materia m : materias) {%>
                                                        <option value="<%=m.getId()%>"><%=m.getNombre()%></option>
                                                        <%}
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div id="respuesta2"></div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
            $("#materias").on("change", function() {
                var valor = document.getElementById('materias').value;
                var imagen1 = document.createElement("img");
                imagen1.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen1.setAttribute("class", "img-gif");
                var bloq1 = document.getElementById("respuesta");
                bloq1.appendChild(imagen1);
                var ruta = "../UtilVistas/listarGruposArchivos.jsp";
                $.post(ruta,
                        {
                            valor: valor},
                function(data) {
                    $("#respuesta").html(data);
                });
            });
        </script>

        <script>
            $("#materias2").on("change", function() {
                var valor = document.getElementById('materias2').value;
                var imagen1 = document.createElement("img");
                imagen1.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen1.setAttribute("class", "img-gif");
                var bloq1 = document.getElementById("respuesta2");
                bloq1.appendChild(imagen1);
                var ruta = "../UtilVistas/listarGruposMaterias.jsp";
                $.post(ruta,
                        {
                            valor: valor
                        },
                function(data) {
                    $("#respuesta2").html(data);
                });
            });
        </script>
    </body>
</html>
