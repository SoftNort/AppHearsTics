<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%    session.setAttribute("paginaActual", "administrar-noticias.jsp");

    int pg = 0; //pagina a mostrar
    if (request.getParameter("pg") == null || request.getParameter("pg").equals("null")) {
        pg = 1;
    } else {
        pg = Integer.parseInt(request.getParameter("pg"));
    }

    int numreg = controlador.contarFilas(); // numero de registros 
    int numpg = numreg / 10; //numero de paginas a mostrar
    //calcular el inicio del arreglo
    int inipg = 0;//variable del inicio del arreglo
    int r = (pg - 1) % 10;
    if (r == 0) {
        inipg = pg - 1; //enpieza desde 0 y va de 10 en 10
    } else {
        inipg = ((pg - 1) / 10) * 10;
    }
    ArrayList<NoticiasHtml> noticias = controlador.getNoticiasPaginas(pg, 10);
%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <title> ModularAdmin - Free Dashboard Theme | HTML Version </title>
        <%@include file="AdministrarHtml/Links.jsp" %>
        <script type="text/javascript" src="../../ckeditor/ckeditor.js" ></script>
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
                            Administrar noticias <a href="javascript:void(0);" onclick="nuevo(1);">Nueva noticia</a>
                        </h1>
                        <p class="title-description"> Doble clic al texto para editar  </p>
                    </div>
                    <section class="section" id="session-nueva-noticia" style="display: none">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title-block col-xs-12">
                                    <h3 class="title ">
                                        Nueva noticia 
                                    </h3>                                    
                                </div>
                                <form action="<%=rutaPath%>/NoticiasAgregar.do" method="post" autocomplete="off" enctype="multipart/form-data">
                                    <div class="card-block col-xs-12">
                                        <div class="panel-update-noticias">
                                            <input type="hidden" name="pagina" value="<%=pg%>">
                                            <div class="form-group"> 
                                                <label class="control-label">Titulo</label> 
                                                <input type="text" name="titulo" required="" class="form-control boxed" > 
                                            </div>
                                            <div class="form-group"> 
                                                <label class="control-label">Parrafo</label> 
                                                <input type="text" name="parrafo" class="form-control boxed" > 
                                            </div>
                                            <div class="form-group"> 
                                                <label class="control-label">Descripcion</label> 
                                                <textarea name="descripcion" id="descNotiAgg"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <input type="file" id="subirImagen" name="imagenInsert" onchange="subirFoto(this)" style="display: none;">
                                                <label for="subirImagen" class="btn btn-warning" >
                                                    Subir imagen
                                                </label>
                                                <input type="text" class="form-control boxed" style="width: 50%; float: left;" name="nombreImg" id="nombreImg" value="" readonly/>
                                            </div>
                                        </div> 
                                        <button type="submit" class="btn btn-primary">Agregar</button>
                                        <button type="button" class="btn btn-danger" style="float: right" onclick="nuevo(2);">Cancelar</button>
                                    </div>                                
                                </form>
                            </div>
                        </div>
                    </section>
                    <% for (NoticiasHtml lista : noticias) {%>                    
                    <section class="section">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title-block">
                                    <h3 class="title ">
                                        Noticia 
                                        <a href="javascript:void(0);" onclick="eliminarNoticia('<%=rutaPath%>/NoticiasEditar.do?idNot=<%=lista.getIdNot()%>&pg=<%=pg%>');"
                                           class="btn-eliminar" title="Eliminar" >
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </h3>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <h3>Titulo</h3>
                                                    <% if (lista.getTitulo().equals("")) {%>
                                                    <p>
                                                        <a href="javascript:void(0);" title="Agregar" onclick="editarNoticias(5,<%=lista.getIdNot()%>);" id="pEditNot<%=lista.getIdNot()%>titulo">Agregar</a>
                                                    </p>
                                                    <%} else {%>
                                                    <a href="javascript:void(0);" title="Editar" onclick="editarNoticias(5,<%=lista.getIdNot()%>);" id="pEditNot<%=lista.getIdNot()%>titulo"><i class="fa fa-pencil"></i></a>
                                                    <p><%=lista.getTitulo()%> </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditNot<%=lista.getIdNot()%>titulo" class="form-group editar-slider-up">
                                                        <form action="<%=rutaPath%>/NoticiasEditar.do" method="post"  id="form-editar-noticias<%=lista.getIdNot()%>titulo" autocomplete="off">
                                                            <input type="hidden" name="idNoti" value="<%=lista.getIdNot()%>">
                                                            <input type="hidden" name="opcion" value="4">
                                                            <input type="hidden" name="pagina" value="<%=pg%>">
                                                            <input type="text" class="form-control boxed" name="titulo" value="<%=lista.getTitulo()%>">
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarNoticias(2,<%=lista.getIdNot()%>);">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formEditarNoticias(4,<%=lista.getIdNot()%>);">
                                                                <i class="fa fa-check"></i>
                                                            </a>
                                                        </form>
                                                    </div> 
                                                </td>
                                                <td rowspan="2" style=" width: 50%;vertical-align:middle; box-shadow: 0 0 2px gray inset">
                                                    <form id="formu<%=lista.getIdNot()%>" action="<%=rutaPath%>/SubirImagen" method="post" enctype="multipart/form-data" >
                                                        <input type="file" onchange="cargarArchivo(this,<%=lista.getIdNot()%>)" name="imagen" id="d<%=lista.getIdNot()%>" style="display: none"/>
                                                        <label class="label-aling-img"  for="d<%=lista.getIdNot()%>">
                                                            <div class="panel-update-noticias">
                                                                <em class="fa fa-camera panel-update-noticias__img-logo"></em>
                                                                <%if (!lista.getUrlImg().equals("")) {%>
                                                                <img class="panel-update-noticias__img" src="<%=rutaPath%>/recursos/img/img-noticias/<%=lista.getUrlImg()%>" >
                                                                <%} else {%>
                                                                <span class="panel-update-noticias__img">Subir Imagen</span>
                                                                <%}%>
                                                            </div>
                                                        </label>
                                                        <input type="hidden" name="opcion" value="2">
                                                        <input type="hidden" name="pagina" value="<%=pg%>">
                                                        <input type="hidden" name="idNoticia" value="<%=lista.getIdNot()%>">
                                                        <input type="hidden" name="nombreImagen" id="nombreImagen<%=lista.getIdNot()%>" value=""/>
                                                    </form>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h3>Parrafo</h3>
                                                    <% if (lista.getParrafo().equals("")) {%>
                                                    <a href="javascript:void(0);" title="Agregar" onclick="editarNoticias(3,<%=lista.getIdNot()%>);" id="pEditNot<%=lista.getIdNot()%>url">Agregar</a>
                                                    <%} else {%>
                                                    <a href="javascript:void(0);" onclick="editarNoticias(3,<%=lista.getIdNot()%>);" id="pEditNot<%=lista.getIdNot()%>url"><i class="fa fa-pencil"></i></a>
                                                    <p>
                                                        <%=lista.getParrafo()%>                                                     
                                                    </p>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditNot<%=lista.getIdNot()%>url" class="form-group editar-slider-up">
                                                        <form action="<%=rutaPath%>/NoticiasEditar.do" method="post" id="form-editar-noticias<%=lista.getIdNot()%>url" autocomplete="off">
                                                            <input type="hidden" name="idNoti" value="<%=lista.getIdNot()%>">
                                                            <input type="hidden" name="opcion" value="2">
                                                            <input type="hidden" name="pagina" value="<%=pg%>">
                                                            <input class="form-control boxed" name="parrafo" value="<%=lista.getParrafo()%>">
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarNoticias(2,<%=lista.getIdNot()%>);">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formEditarNoticias(2,<%=lista.getIdNot()%>);">
                                                                <i class="fa fa-check"></i>
                                                            </a>
                                                        </form>
                                                    </div> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <h3>Descripción</h3>
                                                    <% if (lista.getDescri().equals("")) {%>
                                                    <a href="javascript:void(0);" title="Agregar" onclick="editarNoticias(1,<%=lista.getIdNot()%>);" id="pEditNot<%=lista.getIdNot()%>des">Agregar</a>
                                                    <%} else {%>
                                                    <div id="pEditNot<%=lista.getIdNot()%>des">
                                                        <a href="javascript:void(0);" title="Editar" onclick="editarNoticias(1,<%=lista.getIdNot()%>);" ><i class="fa fa-pencil"></i></a>
                                                        <p ><%=lista.getDescri()%></p>
                                                    </div>
                                                    <%}%>
                                                    <div style="display: table-column " id="divEditNot<%=lista.getIdNot()%>des" class="form-group editar-slider-up">
                                                        <form action="<%=rutaPath%>/NoticiasEditar.do" method="post" id="form-editar-noticias<%=lista.getIdNot()%>des" autocomplete="off">
                                                            <input type="hidden" name="idNoti" value="<%=lista.getIdNot()%>">
                                                            <input type="hidden" name="opcion" value="1">
                                                            <input type="hidden" name="pagina" value="<%=pg%>">
                                                            <textarea id="descNoti<%=lista.getIdNot()%>" name="desc"><%=lista.getDescri()%></textarea>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarNoticias(2,<%=lista.getIdNot()%>);">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                            <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formEditarNoticias(1,<%=lista.getIdNot()%>);">
                                                                <i class="fa fa-check"></i>
                                                            </a>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>                                            
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <script type="text/javascript">
                        CKEDITOR.replace("descNoti<%=lista.getIdNot()%>");
                    </script>
                    <%}%>
                    <% if (numreg > 9) {%>
                    <div class="paginacion">
                        <% if (pg > 1) {%>
                        <a class="paginacion__a previous" href="?pg=<%=pg - 1%>">Anterior</a>
                        <%}%>
                        <%for (int j = inipg; j < 10 + inipg; j++) {
                                if (j <= numpg) {%>
                        <a class="paginacion__a" id="paginacion__a-active<%=j + 1%>" href="?pg=<%=j + 1%>"><%=j + 1%></a> 
                        <%}
                            }
                            if (pg <= numpg) {%>
                        <a class="paginacion__a after" href="?pg=<%=pg + 1%>">Siguiente</a>
                        <%}%>
                    </div> 
                    <%}%>
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
        <script type="text/javascript">
            CKEDITOR.replace("descNotiAgg");
        </script>
    </body>
</html>