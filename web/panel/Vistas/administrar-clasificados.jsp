<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%  session.setAttribute("paginaActual", "administrar-clasificados.jsp");
    ArrayList<ClasificadosHtml> clasifIzq = controlador.getClasificadosLateral("izq");
    ArrayList<ClasificadosHtml> clasifDer = controlador.getClasificadosLateral("der");
%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <title> HeartsTics - Administrar Cabecera </title>
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
                <article class="content static-tables-page">
                    <div class="title-block">
                        <h1 class="title"> 
                            Administrar Clasificados  <a href="javascript:void(0);" onclick="nuevo(3);">Agregar uno nuevo</a>
                        </h1>
                        <p class="title-description"> Doble clic al texto para editar  </p>
                    </div>

                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12" id="nuevo-carrucel" style="display: none;">
                                <div class="card card-block">
                                    <div class="card-title-block">
                                        <h3 class="title">
                                            Nuevo Clasificado
                                        </h3> 
                                    </div>
                                    <form action="../UtilVistas/ClasificadosHtmlRegistrar.jsp" method="post" autocomplete="off" >
                                        <div class="form-group"> 
                                            <label class="control-label">Lateralidad</label>
                                            <select class="form-control form-control-sm" name="lateralidad">
                                                <option value="der">Derecha</option>
                                                <option value="izq" >Izquierda</option>
                                            </select> 
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Titulo</label>
                                            <input type="text" class="form-control boxed" name="titulo" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Descripcion</label>
                                            <input type="text" class="form-control boxed" name="parrafo">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary" style="float: left;">Agregar</button>
                                            <button type="button" class="btn btn-danger" style="float: right;" onclick="nuevo(4)
                                                            ;">Cancelar</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="section col-md-6">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title" style="text-align: center">
                                            <% if (clasifIzq.isEmpty() == true) {%>
                                            En la izquierda no hay clasificados
                                            <%} else {%>
                                            Izquierda
                                            <%}%>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% for (ClasificadosHtml datos : clasifIzq) {%>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title">
                                            Clasificado
                                            <a href="javascript:void(0);" onclick="eliminarClasificado('../UtilVistas/ClasificadosHtmlEliminar.jsp?idClasificado=<%=datos.getIdClasificado()%>');" class="btn-eliminar" title="Eliminar" >
                                                <i class="fa fa-trash-o"></i>
                                            </a>                                            
                                        </h3> 
                                    </div>
                                    <section class="example">
                                        <table class="table">
                                            <tr>
                                                <th>Título:</th>
                                                <td>
                                                    <% if (datos.getTitulo().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(1,<%=datos.getIdClasificado()%>);" id="pEditSlider<%=datos.getIdClasificado()%>text1">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(1,<%=datos.getIdClasificado()%>);" id="pEditSlider<%=datos.getIdClasificado()%>text1">
                                                        <%=datos.getTitulo()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdClasificado()%>text1" class="form-group editar-slider-up">

                                                        <form action="../UtilVistas/ClasificadosHtmlEditar.jsp" method="post" id="form-editar-slider-up<%=datos.getIdClasificado()%>text1" autocomplete="off">

                                                            <input type="hidden" name="idClasificado" value="<%=datos.getIdClasificado()%>">

                                                            <input type="hidden" name="opcion" value="3">

                                                            <input type="text" class="form-control underlined" name="titulo" value="<%=datos.getTitulo()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5
                                                                            ,<%=datos.getIdClasificado()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(1
                                                                            ,<%=datos.getIdClasificado()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Descripción:</th>
                                                <td>
                                                    <% if (datos.getParrafo().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(2,<%=datos.getIdClasificado()%>)" id="pEditSlider<%=datos.getIdClasificado()%>text2">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(2,<%=datos.getIdClasificado()%>)" id="pEditSlider<%=datos.getIdClasificado()%>text2">
                                                        <%=datos.getParrafo()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdClasificado()%>text2" class="form-group editar-slider-up">

                                                        <form action="../UtilVistas/ClasificadosHtmlEditar.jsp" method="post" id="form-editar-slider-up<%=datos.getIdClasificado()%>text2" autocomplete="off">

                                                            <input type="hidden" name="idClasificado" value="<%=datos.getIdClasificado()%>">

                                                            <input type="hidden" name="opcion" value="4">

                                                            <input type="text" class="form-control underlined" name="parrafo" value="<%=datos.getParrafo()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5
                                                                            ,<%=datos.getIdClasificado()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(2
                                                                            ,<%=datos.getIdClasificado()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>                                            
                                        </table>
                                        <table class="table">
                                            <% if (controlador.getClasificadosLinksLateral(datos.getIdClasificado()).isEmpty() == false) {%>
                                            <tr>
                                                <th>&nbsp;</th>
                                                <th>Nombre</th>
                                                <th>Titulo</th>
                                                <th>Http</th>
                                            </tr>

                                            <%}%>
                                            <% for (ClasificadosLinksHtml links : controlador.getClasificadosLinksLateral(datos.getIdClasificado())) {%>
                                            <tr>
                                                <td>
                                                    <a style="float: initial;" href="javascript:void(0);" onclick="eliminarClasificadoLink('../UtilVistas/ClasificadosHtmlEliminar.jsp?idClasificadoLink=<%=links.getIdClasificadoLink()%>');" title="Eliminar" >
                                                        <i class="fa fa-trash-o"></i>
                                                    </a>
                                                </td>

                                                <td><%=links.getNombreLink()%></td>
                                                <td><%=links.getTituloLink()%></td>
                                                <td><%=links.getHttpLink()%></td>
                                            </tr>
                                            <%}%>  
                                            <a href="javascript:void(0);" onclick="nuevoLink(1,<%=datos.getIdClasificado()%>);">Agregar Links</a>

                                        </table>

                                        <form style="display: none;" id="formAddLinks<%=datos.getIdClasificado()%>" action="../UtilVistas/ClasificadosLinksHtmlRegistrar.jsp" method="post">
                                            <input type="hidden" name="idClasif" value="<%=datos.getIdClasificado()%>">
                                            <table class="table" style="overflow: auto">
                                                <tr>
                                                    <td>
                                                        <label class="control-label">Nombre</label>
                                                        <input type="text" class="form-control boxed form-add-links" name="nombre">
                                                    </td>
                                                    <td>
                                                        <label class="control-label">Titulo</label>
                                                        <input type="text" class="form-control boxed form-add-links" name="titulo">
                                                    </td>
                                                    <td>
                                                        <label class="control-label">Http</label>
                                                        <input type="text" class="form-control boxed form-add-links" name="http">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <input type="submit" class="btn btn-primary" value="Guardar">
                                                    </td>
                                                    <td colspan="2" align="right">
                                                        <input type="button" class="btn btn-danger" value="Cancelar" onclick="nuevoLink(2,<%=datos.getIdClasificado()%>);" >
                                                    </td>
                                                </tr>
                                            </table>
                                        </form>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </section>
                    <section class="section col-md-6">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title" style="text-align: center">
                                            <% if (clasifDer.isEmpty() == true) {%>
                                            En la derecha no hay clasificados
                                            <%} else {%>
                                            Derecha
                                            <%}%>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% for (ClasificadosHtml datos : clasifDer) {%>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title">
                                            Clasificado
                                            <a href="javascript:void(0);" onclick="eliminarClasificado('../UtilVistas/ClasificadosHtmlEliminar.jsp?idClasificado=<%=datos.getIdClasificado()%>');" class="btn-eliminar" title="Eliminar" >
                                                <i class="fa fa-trash-o"></i>
                                            </a>                                            
                                        </h3> 
                                    </div>
                                    <section class="example">
                                        <table class="table">
                                            <tr>
                                                <th>Título:</th>
                                                <td>
                                                    <% if (datos.getTitulo().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(1,<%=datos.getIdClasificado()%>);" id="pEditSlider<%=datos.getIdClasificado()%>text1">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(1,<%=datos.getIdClasificado()%>);" id="pEditSlider<%=datos.getIdClasificado()%>text1">
                                                        <%=datos.getTitulo()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdClasificado()%>text1" class="form-group editar-slider-up">

                                                        <form action="../UtilVistas/ClasificadosHtmlEditar.jsp" method="post" id="form-editar-slider-up<%=datos.getIdClasificado()%>text1" autocomplete="off">

                                                            <input type="hidden" name="idClasificado" value="<%=datos.getIdClasificado()%>">

                                                            <input type="hidden" name="opcion" value="3">

                                                            <input type="text" class="form-control underlined" name="titulo" value="<%=datos.getTitulo()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5,<%=datos.getIdClasificado()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(1,<%=datos.getIdClasificado()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Descripción:</th>
                                                <td>
                                                    <% if (datos.getParrafo().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(2,<%=datos.getIdClasificado()%>)" id="pEditSlider<%=datos.getIdClasificado()%>text2">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(2,<%=datos.getIdClasificado()%>)" id="pEditSlider<%=datos.getIdClasificado()%>text2">
                                                        <%=datos.getParrafo()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdClasificado()%>text2" class="form-group editar-slider-up">

                                                        <form action="../UtilVistas/ClasificadosHtmlEditar.jsp" method="post" id="form-editar-slider-up<%=datos.getIdClasificado()%>text2" autocomplete="off">

                                                            <input type="hidden" name="idClasificado" value="<%=datos.getIdClasificado()%>">

                                                            <input type="hidden" name="opcion" value="4">

                                                            <input type="text" class="form-control underlined" name="parrafo" value="<%=datos.getParrafo()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5,<%=datos.getIdClasificado()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(2,<%=datos.getIdClasificado()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>

                                        </table>
                                        <table class="table">
                                            <% if (controlador.getClasificadosLinksLateral(datos.getIdClasificado()).isEmpty() == false) {%>
                                            <tr>
                                                <th>&nbsp;</th>
                                                <th>Nombre</th>
                                                <th>Titulo</th>
                                                <th>Http</th>
                                            </tr>

                                            <%}%>
                                            <% for (ClasificadosLinksHtml links : controlador.getClasificadosLinksLateral(datos.getIdClasificado())) {%>
                                            <tr>
                                                <td>
                                                    <a style="float: initial;" href="javascript:void(0);" onclick="eliminarClasificadoLink('../UtilVistas/ClasificadosHtmlEliminar.jsp?idClasificadoLink=<%=links.getIdClasificadoLink()%>');" title="Eliminar" >
                                                        <i class="fa fa-trash-o"></i>
                                                    </a>
                                                </td>

                                                <td><%=links.getNombreLink()%></td>
                                                <td><%=links.getTituloLink()%></td>
                                                <td><%=links.getHttpLink()%></td>
                                            </tr>
                                            <%}%> 
                                            <a href="javascript:void(0);" onclick="nuevoLink(1,<%=datos.getIdClasificado()%>);">Agregar Links</a>

                                        </table>

                                        <form style="display: none;" id="formAddLinks<%=datos.getIdClasificado()%>" action="../UtilVistas/ClasificadosLinksHtmlRegistrar.jsp" method="post">
                                            <input type="hidden" name="idClasif" value="<%=datos.getIdClasificado()%>">
                                            <table class="table" style="overflow: auto">
                                                <tr>

                                                    <td>
                                                        <label class="control-label">Nombre</label>
                                                        <input type="text" class="form-control boxed form-add-links" name="nombre">
                                                    </td>
                                                    <td>
                                                        <label class="control-label">Titulo</label>
                                                        <input type="text" class="form-control boxed form-add-links" name="titulo">
                                                    </td>
                                                    <td>
                                                        <label class="control-label">Http</label>
                                                        <input type="text" class="form-control boxed form-add-links" name="http">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <input type="submit" class="btn btn-primary" value="Guardar">
                                                    </td>
                                                    <td colspan="2" align="right">
                                                        <input type="button" class="btn btn-danger" value="Cancelar" onclick="nuevoLink(2,<%=datos.getIdClasificado()%>);" >
                                                    </td>
                                                </tr>
                                            </table>
                                        </form>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <%}%>
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
        </div>
    </body>

</html>