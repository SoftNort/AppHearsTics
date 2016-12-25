<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "asignarPermisos.jsp");
    ArrayList<TipoUsuario> tipos = controlador.listarTiposUsuario();
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
                            Gestionar permisos
                        </h3>
                        <p class="title-description"> 
                            Agregar y/o eliminar permisos 
                        </p>
                    </div>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12">
                                <div class="card card-block sameheight-item">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Roles Disponibles
                                        </h3> 
                                    </div>
                                    <div class="form-group">
                                        <select name="roles" id="roles" class="form-control">
                                            <option value="">Seleccion el rol</option>
                                            <%for (TipoUsuario e : tipos) {%>
                                            <option value="<%=e.getId()%>"><%=e.getRol()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-6" id="respuesta1">
                            </div>
                            <div class="col-md-6" id="respuesta2">
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
            $("#roles").on("change", function() {
                document.getElementById("respuesta1").innerHTML = "";
                var valor = document.getElementById('roles').value;
                var imagen1 = document.createElement("img");
                imagen1.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen1.setAttribute("class", "img-gif");
                var bloq1 = document.getElementById("respuesta1");
                bloq1.appendChild(imagen1);
                var ruta = "listarPermisos.jsp";
                $.post(ruta,
                        {
                            valor: valor,
                        },
                        function(data, status) {
                            $("#respuesta1").html(data);
                        });
                
            });

        </script>
        
         <script>
            $("#roles").on("change", function() {
                document.getElementById("respuesta2").innerHTML = "";
                var imagen = document.createElement("img");
                imagen.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen.setAttribute("class", "img-gif");
                var bloq = document.getElementById("respuesta2");
                bloq.appendChild(imagen);
                var valor = document.getElementById('roles').value;
                var ruta1 = "listarPermisos_1.jsp";
                $.post(ruta1,
                        {
                            valor: valor,
                        },
                        function(data, status) {
                            $("#respuesta2").html(data);
                        });
                
            });

        </script>

    </body>
</html>
