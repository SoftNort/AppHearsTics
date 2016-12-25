<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%  session.setAttribute("paginaActual", "administrar-pie-de-pagina.jsp");
    ArrayList<FooterHtml> listFooterDire = controlador.getFooter("Dirección");
    ArrayList<FooterHtml> listFootertelefo = controlador.getFooter("Telefonos");
    ArrayList<FooterHtml> listFooterCorreos = controlador.getFooter("Correos de Contacto");
    ArrayList<FooterHtml> listFooterMemori = controlador.getFooter("En memoria del  Beato Padre Luis Variara");
    ArrayList<FooterHtml> listFooterRedes = controlador.getFooter("Redes Sociales");
%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <title> ModularAdmin - Free Dashboard Theme | HTML Version </title>
        <%@include file="AdministrarHtml/Links.jsp" %>
        <%@include file="../../includes/recursos.jsp" %>
        <style>
            p, span{
                cursor: pointer;
            }
        </style>
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
                <article class="content dashboard-page">
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col col-xs-12 col-sm-12 col-md-12 col-xl-12 stats-col">
                                <div class="card sameheight-item stats" data-exclude="xs">
                                    <div class="card-block">
                                        <div class="title-block">
                                            <h4 class="title">
                                                Administrar pie de página
                                            </h4>
                                            <p class="title-description">
                                                Doble click sobre el campo para editar
                                            </p>
                                        </div>
                                        <div class="row row-sm stats-container">
                                            <footer class="art-footer">

                                                <div class="art-content-layout">
                                                    <div class="art-content-layout-row">

                                                        <div class="art-layout-cell layout-item-0" style="width: 30%">

                                                            <h1><span style="text-decoration: underline; ">Direcci&oacute;n</span></h1><br>
                                                            <% for (FooterHtml direccion : listFooterDire) {%>

                                                            <p id="ocultar<%=direccion.getId()%>"
                                                               onclick="editarFooter(1,<%=direccion.getId()%>);">
                                                                <% if (direccion.getValor().equals("")) {%>
                                                                <a >Agregar dirección</a>
                                                                <%} else {%>
                                                                <%=direccion.getValor()%>
                                                                <%}%>
                                                            </p>
                                                            <div class="box-update-footer" id="mostrar<%=direccion.getId()%>" style="display: none">
                                                                <form action="<%=request.getContextPath()%>/EditarFooter.do" method="post" id="form-editar-footer-<%=direccion.getId()%>" autocomplete="off">
                                                                    <input type="hidden" id="input-ocul" name="id" value="<%=direccion.getId()%>">
                                                                    <input type="hidden" id="input-ocul" name="opcion" value="2">
                                                                    <input type="text" id="input-visi" name="valor" value="<%=direccion.getValor()%>" >
                                                                    <a class="enviar-editar-operario" onclick="editarFooter(3,<%=direccion.getId()%>);">&nbsp;</a>
                                                                </form>
                                                                <a class="cerrar-editar-operario" onclick="editarFooter(2,<%=direccion.getId()%>);">&nbsp;</a>
                                                            </div>

                                                            <%}%> 


                                                            <p><br></p>


                                                            <h1>Telefonos</h1>
                                                            <% for (FooterHtml telefono : listFootertelefo) {%>
                                                            <p id="ocultar<%=telefono.getId()%>"
                                                               onclick="editarFooter(1,<%=telefono.getId()%>);">
                                                                <%if (telefono.getValor().equals("")) {%>
                                                                <a id="ocultar<%=telefono.getId()%>" onclick="editarFooter(1,<%=telefono.getId()%>);">Agregar Telefono</a>
                                                                <%} else {%>                                                                
                                                                <%=telefono.getValor()%>
                                                                <%}%>

                                                            </p>
                                                            <div class="box-update-footer" id="mostrar<%=telefono.getId()%>" style="display: none">
                                                                <form action="<%=request.getContextPath()%>/EditarFooter.do" method="post" id="form-editar-footer-<%=telefono.getId()%>" autocomplete="off">
                                                                    <input type="hidden" id="input-ocul" name="id" value="<%=telefono.getId()%>">
                                                                    <input type="hidden" id="input-ocul" name="opcion" value="2">
                                                                    <input type="text" id="input-visi" name="valor" value="<%=telefono.getValor()%>" >
                                                                    <a class="enviar-editar-operario" onclick="editarFooter(3,<%=telefono.getId()%>);">&nbsp;</a>
                                                                </form>
                                                                <a class="cerrar-editar-operario" onclick="editarFooter(2,<%=telefono.getId()%>);">&nbsp;</a>
                                                            </div>
                                                            <%}%>


                                                        </div>
                                                        <div class="art-layout-cell layout-item-0" style="width: 40%">

                                                            <h1>
                                                                <span style="text-decoration: underline;">Correos de Contacto</span>
                                                            </h1>
                                                            <p>
                                                                <span style="text-decoration: underline;">
                                                                    <br>
                                                                </span>
                                                            </p>
                                                            <% for (FooterHtml Correos : listFooterCorreos) {%>
                                                            <!--H3 Subtitulos correos-->
                                                            <h3>                                                                
                                                                <span id="ocultar<%=Correos.getId()%>" style="text-decoration: underline; font-weight: bold; color: #000000;" 
                                                                      onclick="editarFooter(1,<%=Correos.getId()%>);">
                                                                    <%if (Correos.getSubtitulo().equals("")) {%>
                                                                    <a id="ocultar<%=Correos.getId()%>" style="text-decoration: underline; font-weight: bold; color: #000000;" 
                                                                       onclick="editarFooter(1,<%=Correos.getId()%>);">Agregar encabezado Correo</a>
                                                                    <%} else {%>                                                                
                                                                    <%=Correos.getSubtitulo()%>
                                                                    <%}%>
                                                                </span>
                                                                <div class="box-update-footer" id="mostrar<%=Correos.getId()%>" style="display: none">
                                                                    <form action="<%=request.getContextPath()%>/EditarFooter.do" method="post" id="form-editar-footer-<%=Correos.getId()%>" autocomplete="off">
                                                                        <input type="hidden" id="input-ocul" name="id" value="<%=Correos.getId()%>">
                                                                        <input type="hidden" id="input-ocul" name="opcion" value="3">
                                                                        <input type="text" id="input-visi" name="subtitulo" value="<%=Correos.getSubtitulo()%>" >
                                                                        <a class="enviar-editar-operario" onclick="editarFooter(3,<%=Correos.getId()%>);">&nbsp;</a>
                                                                    </form>
                                                                    <a class="cerrar-editar-operario" onclick="editarFooter(2,<%=Correos.getId()%>);">&nbsp;</a>
                                                                </div>
                                                                <%//}%> 
                                                            </h3>
                                                            <!--Parrafos Correos Electronicos-->
                                                            <p id="ocultar<%=Correos.getId()%>valor" 
                                                               onclick="editarFooter(4,<%=Correos.getId()%>);">
                                                                <%if (Correos.getValor().equals("")) {%>
                                                                <a id="ocultar<%=Correos.getId()%>valor" onclick="editarFooter(4,<%=Correos.getId()%>);">Agregar Correo</a>
                                                                <%} else {%>
                                                                <%=Correos.getValor()%>
                                                                <%}%>
                                                            <div class="box-update-footer" id="mostrar<%=Correos.getId()%>valor" style="display: none">
                                                                <form action="<%=request.getContextPath()%>/EditarFooter.do" method="post" id="form-editar-footer-<%=Correos.getId()%>valor" autocomplete="off">
                                                                    <input type="hidden" id="input-ocul" name="id" value="<%=Correos.getId()%>">
                                                                    <input type="hidden" id="input-ocul" name="opcion" value="2">
                                                                    <input type="text" id="input-visi" name="valor" value="<%=Correos.getValor()%>" >
                                                                    <a class="enviar-editar-operario" onclick="editarFooter(6,<%=Correos.getId()%>);">&nbsp;</a>
                                                                </form>
                                                                <a class="cerrar-editar-operario" onclick="editarFooter(5,<%=Correos.getId()%>);">&nbsp;</a>
                                                            </div>
                                                            </p>
                                                            <%}%>
                                                        </div>
                                                        <!--Redes Sociales-->
                                                        <div class="art-layout-cell layout-item-0" style="width: 30%">

                                                            <h1><span style="text-decoration: underline;">Redes Sociales</span></h1>
                                                            <%for (FooterHtml redes : listFooterRedes) {%>


                                                            <a href="#" onclick="editarFooter(1,<%=redes.getId()%>);"
                                                               id="ocultar<%=redes.getId()%>">
                                                                <p>
                                                                    <img width="32" height="32" alt="" src="<%=request.getContextPath()%>/recursos/img/<%=redes.getSubtitulo()%>" style="float: left; margin-right: 10px;" class="">
                                                                </p>
                                                            </a>
                                                            <div class="box-update-footer" id="mostrar<%=redes.getId()%>" style="display: none">
                                                                <form action="<%=request.getContextPath()%>/EditarFooter.do" method="post" id="form-editar-footer-<%=redes.getId()%>" autocomplete="off" >
                                                                    <input type="hidden" id="input-ocul" name="id" value="<%=redes.getId()%>">
                                                                    <input type="hidden" id="input-ocul" name="opcion" value="1">
                                                                    <input type="text" id="input-visi" name="url" value="<%=redes.getUrl()%>" >
                                                                    <a class="enviar-editar-operario" onclick="editarFooter(3,<%=redes.getId()%>);">&nbsp;</a>
                                                                </form>
                                                                <a class="cerrar-editar-operario" onclick="editarFooter(2,<%=redes.getId()%>);">&nbsp;</a>
                                                            </div>

                                                            <p style="padding-top: 5px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px;"
                                                               onclick="editarFooter(4,<%=redes.getId()%>);" id="ocultar<%=redes.getId()%>valor">
                                                                <% if (redes.getValor().equals("")) {%>
                                                                <a style="padding-top: 5px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px;"
                                                                   onclick="editarFooter(4,<%=redes.getId()%>);" id="ocultar<%=redes.getId()%>valor">Agregar Nombre Link</a>
                                                                <%} else {%>
                                                                <%=redes.getValor()%>
                                                                <%}%>
                                                            </p>
                                                            <div class="box-update-footer" id="mostrar<%=redes.getId()%>valor" style="display: none" >
                                                                <form action="<%=request.getContextPath()%>/EditarFooter.do" method="post" id="form-editar-footer-<%=redes.getId()%>valor" autocomplete="off" >
                                                                    <input type="hidden" id="input-ocul" name="id" value="<%=redes.getId()%>">
                                                                    <input type="hidden" id="input-ocul" name="opcion" value="2">
                                                                    <input type="text" id="input-visi" name="valor" value="<%=redes.getValor()%>" >
                                                                    <a class="enviar-editar-operario" onclick="editarFooter(6,<%=redes.getId()%>);">&nbsp;</a>
                                                                </form>
                                                                <a class="cerrar-editar-operario" onclick="editarFooter(5,<%=redes.getId()%>);">&nbsp;</a>
                                                            </div>
                                                            <p style="padding: 5px 0 10px 0">
                                                                <br>
                                                            </p>
                                                            <%}%>
                                                        </div>
                                                        </form>
                                                    </div>                        
                                                </div>
                                            </footer>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </article>
                <%@include file="AdministrarHtml/Ventanas.jsp" %>
                <%@include file="AdministrarHtml/Footer.jsp" %>
                <!-- /.modal -->
            </div>
        </div>
        <!-- Reference block for JS -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
    </body>

</html>