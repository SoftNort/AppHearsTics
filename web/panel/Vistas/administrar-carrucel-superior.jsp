<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%  session.setAttribute("paginaActual", "administrar-carrucel-superior.jsp");
    ArrayList<SliderMainHtml> slider = controlador.getSlider();
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
                            Administrar Carrucel Superior  <a href="javascript:void(0);" onclick="nuevo(3);">Agregar uno nuevo</a>
                        </h1>
                        <p class="title-description"> Doble clic al texto para editar  </p>
                    </div>

                    <section class="section">
                        <div class="col-md-6" id="nuevo-carrucel" style="display: none;">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title">
                                            Nuevo Carrucel 
                                        </h3> 
                                    </div>
                                    <section class="example">
                                        <form action="<%=request.getContextPath()%>/SliderAgregar.do" method="post" autocomplete="off" enctype="multipart/form-data">
                                            <table class="table">
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <label class="control-label">Posicion</label>
                                                            <input type="text" class="form-control boxed" name="posicion" required>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <label class="control-label">Titulo</label>
                                                            <input type="text" class="form-control boxed" name="titulo" >
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <label class="control-label">Descripcion</label>
                                                            <input type="text" class="form-control boxed" name="descripcion" >
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <label class="control-label">Http Link</label>
                                                            <input type="text" class="form-control boxed" name="http" >
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
                                                            <input type="text" class="form-control boxed" name="nombreImg" id="nombreImg" value="" readonly="readonly">
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
                        <% for (SliderMainHtml datos : slider) {%>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title">
                                            Carrucel: <span ondblclick="editarSliderUp(6,<%=datos.getIdSli()%>);" id="pEditSlider<%=datos.getIdSli()%>pos">
                                                <%=datos.getPosicion()%>
                                            </span>
                                            <a href="javascript:void(0);" onclick="eliminarSlider('<%=request.getContextPath()%>/SliderEditar.do?idSlider=<%=datos.getIdSli()%>');" class="btn-eliminar" title="Eliminar" >
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                            <div style="display: table-column " id="divEditSli<%=datos.getIdSli()%>pos" class="form-group editar-slider-up">

                                                <form action="<%=request.getContextPath()%>/SliderEditar.do" method="post" id="form-editar-slider-up<%=datos.getIdSli()%>pos" autocomplete="off">

                                                    <input type="hidden" name="idSlider" value="<%=datos.getIdSli()%>">

                                                    <input type="hidden" name="opcion" value="5">

                                                    <input type="text" class="form-control underlined" name="posicion" value="<%=datos.getPosicion()%>">

                                                    <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5,<%=datos.getIdSli()%>);">

                                                        <i class="fa fa-times"></i>

                                                    </a>
                                                    <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(5,<%=datos.getIdSli()%>);">

                                                        <i class="fa fa-check"></i>

                                                    </a>
                                                </form>
                                            </div>
                                        </h3> 
                                    </div>
                                    <section class="example">

                                        <form id="formu<%=datos.getIdSli()%>" action="<%=request.getContextPath()%>/SubirImagen" method="post" enctype="multipart/form-data" >
                                            <% if (!datos.getUrlImg().equals("")) {%>
                                            <input type="file" onchange="cargarArchivo(this,<%=datos.getIdSli()%>)" name="imagen" id="d<%=datos.getIdSli()%>" style="display: none"/>
                                            <label class="label-aling-img"  for="d<%=datos.getIdSli()%>">
                                                <div class="panel-update-noticias">
                                                    <em class="fa fa-camera panel-update-noticias__img-logo"></em>
                                                    <img class="panel-update-noticias__img" src="<%=request.getContextPath()%>/recursos/img/img-slider/<%=datos.getUrlImg()%>" >
                                                </div>
                                            </label>
                                            <input type="hidden" name="opcion" value="1">
                                            <input type="hidden" name="idSlider" value="<%=datos.getIdSli()%>">
                                            <input type="hidden" name="nombreImagen" id="nombreImagen<%=datos.getIdSli()%>" value=""/>
                                            <%} else {%>
                                            <input type="file" onchange="cargarArchivo(this,<%=datos.getIdSli()%>)" name="imagen" id="d<%=datos.getIdSli()%>" style="display: none"/>
                                            <label class="label-aling-img"  for="d<%=datos.getIdSli()%>">
                                                <div class="panel-update-noticias">
                                                    <em class="fa fa-camera panel-update-noticias__img-logo"></em>
                                                    <span class="panel-update-noticias__img" >
                                                        Subir imagen
                                                    </span>
                                                </div>
                                            </label>
                                            <input type="hidden" name="opcion" value="1">
                                            <input type="hidden" name="idSlider" value="<%=datos.getIdSli()%>">
                                            <input type="hidden" name="nombreImagen" id="nombreImagen<%=datos.getIdSli()%>" value=""/>
                                            <%}%>
                                        </form>
                                        <table class="table">
                                            <tr>
                                                <th>Título:</th>
                                                <td>
                                                    <% if (datos.getParraf1().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(1,<%=datos.getIdSli()%>);" id="pEditSlider<%=datos.getIdSli()%>text1">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(1,<%=datos.getIdSli()%>);" id="pEditSlider<%=datos.getIdSli()%>text1">
                                                        <%=datos.getParraf1()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdSli()%>text1" class="form-group editar-slider-up">

                                                        <form action="<%=request.getContextPath()%>/SliderEditar.do" method="post" id="form-editar-slider-up<%=datos.getIdSli()%>text1" autocomplete="off">

                                                            <input type="hidden" name="idSlider" value="<%=datos.getIdSli()%>">

                                                            <input type="hidden" name="opcion" value="1">

                                                            <input type="text" class="form-control underlined" name="parrafo1" value="<%=datos.getParraf1()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5,<%=datos.getIdSli()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(1,<%=datos.getIdSli()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Descripción:</th>
                                                <td>

                                                    <% if (datos.getParraf2().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(2,<%=datos.getIdSli()%>);" id="pEditSlider<%=datos.getIdSli()%>text2">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(2,<%=datos.getIdSli()%>)" id="pEditSlider<%=datos.getIdSli()%>text2">
                                                        <%=datos.getParraf2()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdSli()%>text2" class="form-group editar-slider-up">

                                                        <form action="<%=request.getContextPath()%>/SliderEditar.do" method="post" id="form-editar-slider-up<%=datos.getIdSli()%>text2" autocomplete="off">

                                                            <input type="hidden" name="idSlider" value="<%=datos.getIdSli()%>">

                                                            <input type="hidden" name="opcion" value="2">

                                                            <input type="text" class="form-control underlined" name="parrafo2" value="<%=datos.getParraf2()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5,<%=datos.getIdSli()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(2,<%=datos.getIdSli()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Http link:</th>
                                                <td>
                                                    <% if (datos.getUrlLink().equals("")) {%>
                                                    <a href="javascript:void(0);" onclick="editarSliderUp(4,<%=datos.getIdSli()%>);" id="pEditSlider<%=datos.getIdSli()%>urlLink">Agregar</a>
                                                    <%} else {%>
                                                    <p ondblclick="editarSliderUp(4,<%=datos.getIdSli()%>);" id="pEditSlider<%=datos.getIdSli()%>urlLink">
                                                        <%=datos.getUrlLink()%>
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditSli<%=datos.getIdSli()%>urlLink" class="form-group editar-slider-up">

                                                        <form action="<%=request.getContextPath()%>/SliderEditar.do" method="post" id="form-editar-slider-up<%=datos.getIdSli()%>urlLink" autocomplete="off">

                                                            <input type="hidden" name="idSlider" value="<%=datos.getIdSli()%>">

                                                            <input type="hidden" name="opcion" value="4">

                                                            <input type="text" class="form-control underlined" name="urlLink" value="<%=datos.getUrlLink()%>">

                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarSliderUp(5,<%=datos.getIdSli()%>);">

                                                                <i class="fa fa-times"></i>

                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formSliderUpdate(4,<%=datos.getIdSli()%>);">

                                                                <i class="fa fa-check"></i>

                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            </form>

                                            </tbody>
                                            <tbody style="display: table-column " id="mostrarForm<%=datos.getIdSli()%>">
                                            <form role="form" action="<%=request.getContextPath()%>/SliderEditar.do" method="post">
                                                <input type="hidden" value="<%=datos.getIdSli()%>" name="idNav">                                
                                                <tr> 

                                                    <td><div class="form-group"><input type="text" class="form-control underlined" name="posicion"></div></td>
                                                    <td><div class="form-group"><input type="text" class="form-control underlined" name="nombre"></div></td>
                                                    <td><div class="form-group"><input type="text" class="form-control underlined" name="url"></div></td>                                                            
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="right"><input type="button" class="btn btn-oval btn-sm btn-danger" value="cancelar" onclick="agregarLiCabecera(2,<%=datos.getIdSli()%>);"></td>
                                                    <td colspan="1" align="right"><input type="submit" class="btn btn-oval btn-sm btn-success" value="agregar"></td>
                                                </tr>
                                            </form>
                                            </tbody>
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