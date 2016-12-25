<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%  session.setAttribute("paginaActual", "administrar-imagenes.jsp");
    ArrayList<PublicidadHtml> publiIzq = controlador.getDatosPublicidades("izq");
    ArrayList<PublicidadHtml> publiDer = controlador.getDatosPublicidades("der");
%>
<!doctype html>
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
                <article class="content static-tables-page">
                    <div class="title-block">
                        <h1 class="title"> 
                            Administrar Publicidad  <a href="javascript:void(0);" onclick="nuevo(3);">Agregar una nueva</a>
                        </h1>
                        <p class="title-description"> Doble clic al texto para editar  </p>
                    </div>

                    <section class="section"> 
                        <div class="col-md-12" id="nuevo-carrucel" style="display: none;">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title">
                                            Nueva Publicidad
                                        </h3> 
                                    </div>
                                    <section class="example">
                                        <form action="<%=rutaPath%>/PublicidadAgregar.do" method="post" autocomplete="off" enctype="multipart/form-data">
                                            <table class="table">                                               
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <label class="control-label">Titulo</label>
                                                            <input type="text" class="form-control boxed" name="titulo" required>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <label class="control-label">Lateralidad</label>
                                                            <select name="slider" class="form-control form-control-sm" >
                                                                <option value="izq">Izquierda</option>
                                                                <option value="der">Derecha</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <label class="control-label">Http Link</label>
                                                            <input type="text" class="form-control boxed" name="link" >
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <input type="file" id="subirImagen" name="imagenInsert" onchange="subirFoto(this);" style="display: none;">
                                                            <label for="subirImagen" class="btn btn-warning">
                                                                Subir imagen
                                                            </label>
                                                            <input type="text" class="form-control boxed" name="nombreImg" id="nombreImg" value="" required="" readonly="readonly">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <button type="submit" class="btn btn-primary" style="float: left;">Agregar</button>
                                                        <button type="button" class="btn btn-danger" style="float: right;" onclick="nuevo(4);">Cancelar</button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </form>
                                    </section>
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
                                            <% if (publiIzq.isEmpty() == true) {%>
                                            En la Izquierda no hay publicidades
                                            <%} else {%>
                                            Izquierda
                                            <%}%>
                                        </h3>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% for (PublicidadHtml datos : publiIzq) {%>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title">
                                            Imagen   
                                            <a href="javascript:void(0);" onclick="eliminarPublicidad('<%=rutaPath%>/PublicidadEditar.do?idPubli=<%=datos.getIdPublicidad()%>&slider=<%=datos.getSlider()%>');" class="btn-eliminar" title="Eliminar" >
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </h3> 
                                    </div>
                                    <section class="example">

                                        <form id="formu<%=datos.getIdPublicidad()%>" action="<%=rutaPath%>/SubirImagen" method="post" enctype="multipart/form-data" >


                                            <input type="file" onchange="cargarArchivo(this,<%=datos.getIdPublicidad()%>)" name="imagen" id="d<%=datos.getIdPublicidad()%>" style="display: none"/>
                                            <label class="label-aling-img"  for="d<%=datos.getIdPublicidad()%>">
                                                <div class="panel-update-noticias">
                                                    <em class="fa fa-camera panel-update-noticias__img-logo"></em>
                                                    <%if (!datos.getImg().equals("")) {%>
                                                    <img class="panel-update-noticias__img" src="<%=rutaPath%>/recursos/img/img-slider/<%=datos.getImg()%>" >
                                                    <%} else {%>
                                                    <span class="panel-update-noticias__img" >Subir Imagen</span>
                                                    <%}%>
                                                </div>
                                            </label>
                                            <input type="hidden" name="opcion" value="3">
                                            <input type="hidden" name="slider" value="<%=datos.getSlider()%>">
                                            <input type="hidden" name="idPubl" value="<%=datos.getIdPublicidad()%>">
                                            <input type="hidden" name="nombreImagen" id="nombreImagen<%=datos.getIdPublicidad()%>" value=""/>

                                        </form>
                                        <table class="table">
                                            <tr>
                                                <th>Título:</th>
                                                <td>
                                                    <% if (datos.getTitulo().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(1,<%=datos.getIdPublicidad()%>);" id="pEditSlider<%=datos.getIdPublicidad()%>text1">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(1,<%=datos.getIdPublicidad()%>);" id="pEditSlider<%=datos.getIdPublicidad()%>text1">
                                                        <%=datos.getTitulo()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdPublicidad()%>text1" class="form-group editar-slider-up">

                                                        <form action="<%=rutaPath%>/PublicidadEditar.do" method="post" id="form-editar-slider-up<%=datos.getIdPublicidad()%>text1" autocomplete="off">

                                                            <input type="hidden" name="idPubli" value="<%=datos.getIdPublicidad()%>">

                                                            <input type="hidden" name="slider" value="<%=datos.getSlider()%>">

                                                            <input type="hidden" name="opcion" value="3">

                                                            <input type="text" class="form-control underlined" name="titulo" value="<%=datos.getTitulo()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5,<%=datos.getIdPublicidad()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(1,<%=datos.getIdPublicidad()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Link:</th>
                                                <td>
                                                    <% if (datos.getLink().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(2,<%=datos.getIdPublicidad()%>)" id="pEditSlider<%=datos.getIdPublicidad()%>text2">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(2,<%=datos.getIdPublicidad()%>)" id="pEditSlider<%=datos.getIdPublicidad()%>text2">
                                                        <%=datos.getLink()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdPublicidad()%>text2" class="form-group editar-slider-up">

                                                        <form action="<%=rutaPath%>/PublicidadEditar.do" method="post" id="form-editar-slider-up<%=datos.getIdPublicidad()%>text2" autocomplete="off">

                                                            <input type="hidden" name="idPubli" value="<%=datos.getIdPublicidad()%>">

                                                            <input type="hidden" name="slider" value="<%=datos.getSlider()%>">

                                                            <input type="hidden" name="opcion" value="2">

                                                            <input type="text" class="form-control underlined" name="link" value="<%=datos.getLink()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5,<%=datos.getIdPublicidad()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(2,<%=datos.getIdPublicidad()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </section>
                    <!--Derecha-->
                    <section class="section col-md-6">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title" style="text-align: center">
                                            <% if (publiDer.isEmpty() == true) {%>
                                            En la derecha no hay publicidades
                                            <%} else {%>
                                            Derecha
                                            <%}%>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% for (PublicidadHtml datos : publiDer) {%>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title">
                                            <a href="javascript:void(0);" onclick="eliminarPublicidad('<%=rutaPath%>/PublicidadEditar.do?idPubli=<%=datos.getIdPublicidad()%>&slider=<%=datos.getSlider()%>');" class="btn-eliminar" title="Eliminar" >
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </h3> 
                                    </div>
                                    <section class="example">

                                        <form id="formu<%=datos.getIdPublicidad()%>" action="<%=rutaPath%>/SubirImagen" method="post" enctype="multipart/form-data" >

                                            <input type="file" onchange="cargarArchivo(this,<%=datos.getIdPublicidad()%>)" name="imagen" id="d<%=datos.getIdPublicidad()%>" style="display: none"/>
                                            <label class="label-aling-img"  for="d<%=datos.getIdPublicidad()%>">
                                                <div class="panel-update-noticias">
                                                    <em class="fa fa-camera panel-update-noticias__img-logo"></em>
                                                    <%if (!datos.getImg().equals("")) {%>
                                                    <img class="panel-update-noticias__img" src="<%=rutaPath%>/recursos/img/img-slider/<%=datos.getImg()%>" >
                                                    <%} else {%>
                                                    <span class="panel-update-noticias__img" >Subir Imagen</span>
                                                    <%}%>
                                                </div>
                                            </label>
                                            <input type="hidden" name="opcion" value="3">
                                            <input type="hidden" name="slider" value="<%=datos.getSlider()%>">
                                            <input type="hidden" name="idPubl" value="<%=datos.getIdPublicidad()%>">
                                            <input type="hidden" name="nombreImagen" id="nombreImagen<%=datos.getIdPublicidad()%>" value=""/>
                                        </form>
                                        <table class="table">
                                            <tr>
                                                <th>Título:</th>
                                                <td>
                                                    <% if (datos.getTitulo().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(1,<%=datos.getIdPublicidad()%>);" id="pEditSlider<%=datos.getIdPublicidad()%>text1">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(1,<%=datos.getIdPublicidad()%>);" id="pEditSlider<%=datos.getIdPublicidad()%>text1">
                                                        <%=datos.getTitulo()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdPublicidad()%>text1" class="form-group editar-slider-up">

                                                        <form action="<%=rutaPath%>/PublicidadEditar.do" method="post" id="form-editar-slider-up<%=datos.getIdPublicidad()%>text1" autocomplete="off">

                                                            <input type="hidden" name="idPubli" value="<%=datos.getIdPublicidad()%>">

                                                            <input type="hidden" name="slider" value="<%=datos.getSlider()%>">

                                                            <input type="hidden" name="opcion" value="3">

                                                            <input type="text" class="form-control underlined" name="titulo" value="<%=datos.getTitulo()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5,<%=datos.getIdPublicidad()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(1,<%=datos.getIdPublicidad()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Link:</th>
                                                <td>
                                                    <% if (datos.getLink().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(2,<%=datos.getIdPublicidad()%>)" id="pEditSlider<%=datos.getIdPublicidad()%>text2">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(2,<%=datos.getIdPublicidad()%>)" id="pEditSlider<%=datos.getIdPublicidad()%>text2">
                                                        <%=datos.getLink()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdPublicidad()%>text2" class="form-group editar-slider-up">

                                                        <form action="<%=rutaPath%>/PublicidadEditar.do" method="post" id="form-editar-slider-up<%=datos.getIdPublicidad()%>text2" autocomplete="off">

                                                            <input type="hidden" name="idPubli" value="<%=datos.getIdPublicidad()%>">

                                                            <input type="hidden" name="slider" value="<%=datos.getSlider()%>">

                                                            <input type="hidden" name="opcion" value="2">

                                                            <input type="text" class="form-control underlined" name="link" value="<%=datos.getLink()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5,<%=datos.getIdPublicidad()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(2,<%=datos.getIdPublicidad()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <%}%>
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
    </body>

</html>