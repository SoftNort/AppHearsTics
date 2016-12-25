<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "registrarPagina.jsp");
    String idCarpeta = "0";
    if (request.getParameter("id") != null) {
        idCarpeta = request.getParameter("id");
    }
    ArrayList<PaginaTipoUsuario> pagDif = controlador.listarPaginasDiferentes(Integer.parseInt(idCarpeta));
    ArrayList<PaginaTipoUsuario> pagIgu = controlador.listarPaginasIguales(Integer.parseInt(idCarpeta));
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
                            Gestionar Paginas en Carpetas
                        </h3>
                        <p class="title-description"> 
                            Agregar y/o eliminar paginas
                            <a href="administrarCarpetasPaginas.jsp" >Administrar otra carpeta</a>
                        </p>
                    </div>
                    <section class="section">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card card-block">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Paginas disponibles
                                        </h3> 
                                    </div>
                                    <div class="table-responsive">
                                        <form action="../UtilVistas/PaginaCarpetaAgregar.jsp" method="post">
                                            <table class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Descripcion</th>
                                                    <th>Agregar</th>
                                                </tr>

                                                <%if (pagDif.isEmpty()) {%>
                                                <td colspan="3"><%="No hay páginas disponibles "%></td>
                                                <%} else {
                                                    for (PaginaTipoUsuario e : pagDif) {%>
                                                <tr>
                                                    <td><%=e.getPagina().getNombre()%></td>
                                                    <td><%=e.getPagina().getDescripcion()%></td>
                                                    <td>
                                                        <label>
                                                            <input class="checkbox" name="agregar" type="checkbox" value="<%=e.getPagina().getCodigo()%>"/>
                                                            <span>
                                                                <% if (e.getPagina().getCarpeta()!= 0) {%>                                                                
                                                                <i class="fa fa-check"></i>
                                                                <%} else {%>
                                                                <i class="fa fa-times"></i>
                                                                <%}%>
                                                            </span>
                                                        </label>
                                                    </td>
                                                </tr>
                                                <%}
                                                    }%>
                                            </table>
                                            <input type="hidden" name="id" value="<%=idCarpeta%>" >
                                            <input type="submit" value="Agregar"  class="btn btn-warning"/>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-block">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Paginas agregadas
                                        </h3> 
                                    </div>
                                    <div class="table-responsive">
                                        <form action="../UtilVistas/PaginaCarpetaEliminar.jsp" method="post">
                                            <table class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Descripcion</th>
                                                    <th>Eliminar</th>
                                                </tr>

                                                <%if (pagIgu.isEmpty()) {%>
                                                <td colspan="3"><%="No hay páginas en esta carpeta "%></td>
                                                <%} else {
                                                    for (PaginaTipoUsuario e : pagIgu) {%>
                                                <tr>
                                                    <td><%=e.getPagina().getNombre()%></td>
                                                    <td><%=e.getPagina().getDescripcion()%></td>
                                                    <td><label>
                                                            <input class="checkbox" name="eliminar" type="checkbox" value="<%=e.getPagina().getCodigo()%>"/>
                                                            <span>
                                                                <i class="fa fa-check"></i>
                                                            </span>
                                                        </label>
                                                    </td>
                                                </tr>
                                                <%}
                                                    }%>
                                            </table>
                                            <input type="hidden" name="id" value="<%=idCarpeta%>" >
                                            <input type="submit" value="Eliminar" class="btn btn-warning"/>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </article>
                <%@include file="AdministrarHtml/Footer.jsp" %>
                <%@include file="AdministrarHtml/Ventanas.jsp" %>
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
