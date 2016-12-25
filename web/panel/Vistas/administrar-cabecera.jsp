<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%  session.setAttribute("paginaActual", "administrar-cabecera.jsp");
    ArrayList<CabeceraHtml> listaCabeceraTitulo = controlador.getCabeceraTitulo();
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
                            Administrar Menú Cabecera
                        </h1>
                        <p class="title-description"> Administrar las opciones del la pagina  </p>
                    </div>
                    <section class="section">
                        <div class="row">
                            <% for (CabeceraHtml datos : listaCabeceraTitulo) {%>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-block">
                                        <div class="card-title-block">
                                            <h3 class="title">
                                                <%=datos.getTitulo()%> <a href="javascript:void(0);" onclick="agregarLiCabecera(1,<%=datos.getIdNav()%>);">Agregar</a>
                                            </h3> 
                                        </div>
                                        <section class="example">
                                            <table class="table">
                                                <% if (listaCabeceraTitulo.isEmpty() == false) {%>
                                                <thead>
                                                    <tr>
                                                        <th>&nbsp;</th>
                                                        <th>Posicion</th>
                                                        <th>nombre</th>
                                                        <th>url</th>
                                                    </tr>
                                                </thead>
                                                <%}%>
                                                <tbody>                                                    
                                                    <%
                                                        ArrayList<CabeceraHtml> listaCabeceraLi = controlador.getCabeceraLi(datos.getIdNav());
                                                        for (CabeceraHtml lista : listaCabeceraLi) {%>
                                                    <tr>
                                                        <td style="min-width: 60px; max-width: 60px;">
                                                            <a href="javascript:void(0);" onclick="eliminarLiCabe('../UtilVistas/CabeceraHtmlEliminar.jsp?idLi=<%=lista.getIdLi()%>%26url=<%=lista.getUrl()%>');" class="opciones-cabecera" title="Eliminar" ><i class="fa fa-trash-o"></i></a>
                                                            <a href="administrar-paginas.jsp?idLi=<%=lista.getIdLi()%>"  class="opciones-cabecera" title="Editar pagina" ><i class="fa fa-wrench"></i></a>
                                                        </td>
                                                        <td>
                                                            <p ondblclick="editarCabecera(1,<%=lista.getIdLi()%>)" id="pEditCab<%=lista.getIdLi()%>pos">
                                                                <%=lista.getPosicion()%>
                                                            </p>
                                                            <div style="display: table-column; " id="divEditCab<%=lista.getIdLi()%>pos" class="form-group editar-cabecera">
                                                                <form action="../UtilVistas/CabeceraHtmlEditar.jsp" method="post" id="form-editar-cabecera<%=lista.getIdLi()%>pos" autocomplete="off">
                                                                    <input type="hidden" name="idLi" value="<%=lista.getIdLi()%>">
                                                                    <input type="hidden" name="opcion" value="1">
                                                                    <input type="number" class="form-control boxed" name="posicion" value="<%=lista.getPosicion()%>">
                                                                    <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="editarCabecera(4,<%=lista.getIdLi()%>);">
                                                                        <i class="fa fa-times"></i>
                                                                    </a>
                                                                    <a class="opciones-editar-cabecera" href="javascript:void(0);" onclick="formCabeceraUpdate(1,<%=lista.getIdLi()%>);">
                                                                        <i class="fa fa-check"></i>
                                                                    </a>
                                                                </form>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p>
                                                                <%=lista.getNombre()%>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p >
                                                                <a target="_black" href="<%=rutaPath%>/<%=lista.getUrl()%>"  class="opciones-cabecera" title="<%=lista.getUrl()%>" ><i class="fa fa-globe"></i></a>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    </form>
                                                    <%}%>
                                                </tbody>
                                                <tbody style="display: table-column " id="mostrarForm<%=datos.getIdNav()%>">
                                                <form action="../UtilVistas/CabeceraHtmlAgregar.jsp" method="post" >
                                                    <input type="hidden" value="<%=datos.getIdNav()%>" name="idNav">       
                                                    <input type="hidden" value="<%=datos.getTitulo()%>" name="tituloNav">       
                                                    <tr> 

                                                        <td colspan="2"><div class="form-group"><input type="number" class="form-control boxed" name="posicion" id="inputPrimer<%=datos.getIdNav()%>" placeholder="Posición"></div></td>
                                                        <td colspan="2"><div class="form-group"><input type="text" class="form-control boxed" name="nombre" placeholder="Nombre"></div></td>                                                          
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="right"><input type="button" class="btn btn-oval btn-sm btn-danger" value="cancelar" onclick="agregarLiCabecera(2,<%=datos.getIdNav()%>);"></td>
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
    </body>
</html>