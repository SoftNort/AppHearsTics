<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Heart Tics </title>
        <%@include file="AdministrarHtml/Links.jsp" %>
        <script type="text/javascript" src="../../ckeditor/ckeditor.js" ></script>
    </head>
    <body>
        <%            session.setAttribute("paginaActual", "gestionarPeriodo.jsp");
        %>
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
                            Gestión de periodos
                        </h3>
                        <p class="title-description"></p>

                    </div>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12">
                                <div class="card card-block ">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Datos del periodo
                                        </h3>
                                        <div class="title-description" id="respuesta"></div>
                                    </div>
                                    <form id="formPeriodo" method="post" action="../UtilVistas/crearPeriodos.jsp">                                        
                                        <div class="form-group">
                                            <label >Año<span>*</span></label>
                                            <input type="number" class="form-control" required="required" name="year"/>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label >Periodo 1</label>
                                            </div>

                                            <div class="form-group">
                                                <label >Fecha de inicio<span>*</span></label>
                                                <input type="date" class="form-control" required="required" name="fechaInicio1"/>
                                            </div>

                                            <div class="form-group">
                                                <label >Fecha de fin<span>*</span></label>
                                                <input type="date" class="form-control" required="required" name="fechaFin1"/>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label >Periodo 2</label>
                                            </div>

                                            <div class="form-group">
                                                <label >Fecha de inicio<span>*</span></label>
                                                <input type="date" class="form-control" required="required" name="fechaInicio2"/>
                                            </div>

                                            <div class="form-group">
                                                <label >Fecha de fin<span>*</span></label>
                                                <input type="date" class="form-control" required="required" name="fechaFin2"/>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label >Periodo 3</label>
                                            </div>

                                            <div class="form-group">
                                                <label >Fecha de inicio<span>*</span></label>
                                                <input type="date" class="form-control" required="required" name="fechaInicio3"/>
                                            </div>

                                            <div class="form-group">
                                                <label >Fecha de fin<span>*</span></label>
                                                <input type="date" class="form-control" required="required" name="fechaFin3"/>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label >Periodo 4</label>
                                            </div>

                                            <div class="form-group">
                                                <label >Fecha de inicio<span>*</span></label>
                                                <input type="date" class="form-control" required="required" name="fechaInicio4"/>
                                            </div>

                                            <div class="form-group">
                                                <label >Fecha de fin<span>*</span></label>
                                                <input type="date" class="form-control" required="required" name="fechaFin4"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <button type="submit" name="enviar" id="enviar" value="Crear" class="btn btn-success"/>Guardar Cambios
                                            </div>
                                            <div class="col-md-3 col-md-offset-5">
                                                <button type="button" name="activar" id="activar" value="Activar Periodo" class="btn btn-primary"/>Activar Periodo
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                    </section>
                </article>
            </div>
        </div>

        <script>
            $("#activar").on("click", function() {
                var imagen = document.createElement("img");
                var bloq = document.getElementById("respuesta");
                imagen.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen.setAttribute("class", "img-gif");
                bloq.appendChild(imagen);
                var ruta = "../UtilVistas/activarPeriodo.jsp";
                var valor = "";
                $.post(ruta,
                        {
                            valor:valor
                        },
                        function(data, status) {
                            $("#respuesta").html(data);
                        });
            });
        </script>
    </body>
</html>
