<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%  session.setAttribute("paginaActual", "administrar-paginas.jsp");
    String idLi;
    if (request.getParameter("idLi") == null || request.getParameter("idLi").equals("")) {
        idLi = "0";
%>
<script type="text/javascript">
    window.location.href = "sinPermisos.jsp";
</script>
<%
    } else {
        idLi = request.getParameter("idLi");
    }
    //String[] datosLi = new Cabecera().getLiXid(idLi);
    String[] datosPagina = controlador.getPaginaXidLi(idLi);
    CabeceraHtml cabec = controlador.getLiXid(idLi);
    //String[] datosPagina = new Paginas().getPaginaXidLi(idLi);
    for (int i = 1; i < 4; i++) {
        if (datosPagina[i] == null) {
            datosPagina[i] = "";
        } else {
            datosPagina[i] = datosPagina[i];
        }
    }
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
                            Administrar Pagina Cabecera
                        </h1>
                        <p class="title-description"></p>
                    </div>
                    <section class="section">
                        <div class="col-md-12" id="nuevo-carrucel">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-title-block">
                                        <h3 class="title">
                                            Administrar Pagina<%%>
                                        </h3> 
                                    </div>
                                    <section class="example">
                                        <form action="<%=rutaPath%>/PaginasAgregar.do" method="post" autocomplete="off" enctype="multipart/form-data">
                                            <input type="hidden" name="idLi" value="<%=cabec.getIdLi()%>">
                                            <table class="table">
                                                <% if (datosPagina[0] == null) {%>
                                                <input type="hidden" name="opcion" value="1">
                                                <%} else {%>
                                                <input type="hidden" name="opcion" value="2">
                                                <%}%>
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <label class="control-label">Nombre<%%></label>
                                                            <input type="text" class="form-control boxed" readonly value="<%=cabec.getTitulo()%>/<%=cabec.getNombre()%>.jsp" >
                                                        </div>
                                                    </td>
                                                    <td rowspan="2" style="vertical-align:middle;">
                                                        <%if (datosPagina[3].equals("") || datosPagina[3] == null) {
                                                        %>
                                                        <div class="form-group">
                                                            <input type="file" onchange="subirFoto(this)" name="imagenInsert" id="subirImagen" style="display: none"/>
                                                            <label class="label-aling-img"  for="subirImagen">
                                                                <div class="panel-update-noticias">
                                                                    <em class="fa fa-camera panel-update-noticias__img-logo"></em>
                                                                    <span>Subir Imagen</span> 
                                                                </div>
                                                            </label>
                                                            <input type="hidden" class="form-control boxed" name="nombreImg" id="nombreImg" value="<%=datosPagina[3]%>" readonly/>
                                                        </div>
                                                        <%} else {%>
                                                        <input type="file" onchange="subirFoto(this)" name="imagenInsert" id="subirImagen" style="display: none; color: red"/>
                                                        <label class="label-aling-img"  for="subirImagen">
                                                            <div class="panel-update-noticias">
                                                                <em class="fa fa-camera panel-update-noticias__img-logo"></em>
                                                                <img class="panel-update-noticias__img" src="../../recursos/img/img-paginas/<%=datosPagina[3]%>" >                                               
                                                                <input type="hidden" class="form-control boxed" name="nombreImg" id="nombreImg" value="<%=datosPagina[3]%>" readonly/>
                                                            </div>
                                                        </label>
                                                        <%}%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <label class="control-label">Titulo</label>
                                                            <input type="text" class="form-control boxed" name="titulo" value="<%=datosPagina[1]%>" required>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="control-label">Contenido</label>
                                                            <textarea id="ContenidoPaginas" name="contenido" ><%=datosPagina[2]%></textarea>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <button type="submit" class="btn btn-primary" style="float: left;">Agregar</button>
                                                        <button type="button" class="btn btn-danger" style="float: right;" onclick="location.href = 'administrar-cabecera.jsp'">Cancelar</button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </form>
                                    </section>
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
        </div>
        <script type="text/javascript">
            CKEDITOR.replace("ContenidoPaginas");
        </script>
    </body>

</html>