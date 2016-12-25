<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "administrarPines.jsp");
    ArrayList<Grupo> grupos = controlador.listarGrupos();
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
                            Administrar Pines
                        </h3>
                        <p class="title-description">  </p>
                    </div>
                    <form action="<%=request.getContextPath()%>/GenerarPinesGrupo" target="_black" method="post">
                        <section class="section">
                            <div class="row sameheight-container">
                                <div class="col-md-12">
                                    <div class="card card-block sameheight-item">
                                        <div class="title-block">
                                            <h3 class="title">
                                                Grupos Registrados
                                            </h3> 
                                        </div>
                                        <div class="form-group">
                                            <select name="roles" id="roles" class="form-control">
                                                <option value="">Seleccion un Grupo </option>
                                                <%for (Grupo e : grupos) {%>
                                                <option value="<%=e.getIdCurso().getIdCurso() + "-" + e.getIdGrupo()%>"><%=e.getIdCurso().getDescripcion() + "-" + e.getIdGrupo() + "-" + e.getTitular().getNombres() + " " + e.getTitular().getApellidos()%></option>
                                                <%}%>
                                            </select>
                                        </div>                                    
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="section">
                            <div class="row sameheight-container" >
                                <div class="col-md-6" id="respuestaC"  ></div>
                                <div class="col-md-6" id="respuestaG"  ></div>
                                <div class="col-md-12" id="respuestaBTN"></div>
                            </div>
                        </section>
                    </form>
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
                var valor = document.getElementById('roles').value;
                var imagen1 = document.createElement("img");
                var imagen2 = document.createElement("img");
                imagen1.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen1.setAttribute("class", "img-gif");
                imagen2.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen2.setAttribute("class", "img-gif");
                var bloq1 = document.getElementById("respuestaG");
                var bloq2 = document.getElementById("respuestaC");
                bloq1.appendChild(imagen1);
                bloq2.appendChild(imagen2);
                var ruta = "listarPinesG.jsp";
                var ruta1 = "listarPinesC.jsp";
                var ruta2 = "listarPinesBTN.jsp";
                $.post(ruta,
                        {
                            valor: valor,
                        },
                        function(data, status) {
                            $("#respuestaG").html(data);
                        });
                $.post(ruta1,
                        {
                            valor: valor,
                        },
                        function(data, status) {
                            $("#respuestaC").html(data);
                        });
                $.post(ruta2,
                        {
                            valor: valor,
                        },
                        function(data, status) {
                            $("#respuestaBTN").html(data);
                        });
            });

            function marcar(tipo, source) {
                if (tipo === 1) {
                    checkboxes1 = document.getElementsByClassName('grupo');
                    for (i = 0; i < checkboxes1.length; i++) { //recoremos todos los controles

                        if (checkboxes1[i].type == "checkbox") { //solo si es un checkbox entramos
                            checkboxes1[i].checked = source.checked; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                        }
                    }
                } else if (tipo === 2) {
                    checkboxes2 = document.getElementsByClassName('curso');//obtenemos todos los controles del tipo Input
                    for (i = 0; i < checkboxes2.length; i++) { //recoremos todos los controles

                        if (checkboxes2[i].type == "checkbox") { //solo si es un checkbox entramos
                            checkboxes2[i].checked = source.checked; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                        }
                    }
                }

            }

        </script>

    </body>
</html>
