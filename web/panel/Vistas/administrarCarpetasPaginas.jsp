
<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "administrarCarpetasPaginas.jsp");
    ArrayList<CarpetaPagina> CarpetasPaginas = controlador.listarCarpetasPaginas();
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
                            Gestionar Carpetas 
                        </h3>
                        <p class="title-description"> 
                            Agregar y/o eliminar Carpetas Paginas
                        </p>
                    </div>

                    <section class="section">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title-block">
                                    <h3 class="title ">
                                        Registrar un nueva carpeta pagina
                                    </h3> 
                                </div>
                                <form action="../UtilVistas/registrarCarpetasPaginas.jsp" method="post" id="frmRegistrarPagina" >
                                    <div class="form-group">
                                        <label for="exampleInputName2">Nombre carpeta</label>
                                        <input type="text" name="nombre" value="" class="form-control" placeholder="Ej. Tareas" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputName2">Icono Carpeta</label>
                                        <div> 
                                            <label>
                                                <input class="radio" value="folder" name="icono" type="radio" checked>
                                                <span><i class="fa fa-folder"></i>&nbsp;folder</span>
                                            </label> 
                                            <%String[] iconos = {"gears", "inbox", "globe", "home", "comments-o", "bar-chart-o",
                                                    "suitcase", "users", "user", "th-large", "th-list", "pencil-square-o", "bars", "book"};
                                                for (int i = 0; i < iconos.length; i++) {%>
                                            <label>
                                                <input class="radio" value="<%=iconos[i]%>" name="icono" type="radio" >
                                                <span><i class="fa fa-<%=iconos[i]%>"></i>&nbsp;<%=iconos[i]%></span>
                                            </label>&nbsp;
                                            <%}%>

                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-success">Registrar</button>
                                </form>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12">
                                <div class="card card-block">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Carpetas paginas disponibles
                                        </h3> 
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Eliminar</th>
                                                <th>Agregar Paginas</th>
                                            </tr>

                                            <%if (CarpetasPaginas.isEmpty()) {%>
                                            <td colspan="3"><%="No hay carpetas de páginas registradas "%></td>
                                            <%} else {
                                                for (CarpetaPagina e : CarpetasPaginas) {%>
                                            <form class="formulario" action="../UtilVistas/editarCarpeta.jsp" method="post">
                                                <tr>
                                                    <td class="boxBtnMostrarForm">
                                                        <a class="btnMostrarForm">
                                                            <i class="fa fa-pencil"></i>
                                                        </a>&nbsp;
                                                        <i class="fa fa-<%=e.getIcono()%>"></i><%="     " + e.getNombre()%>
                                                    </td>
                                                    <td class="boxFormulario" style="display: none;">
                                                        <input type="hidden" name="idCarpeta" value="<%=e.getCodigo()%>">
                                                        <input type="text" required value="<%=e.getNombre()%>" name="nombre" placeholder="Nombre de la carpeta">
                                                        <input type="text" required value="<%=e.getIcono()%>" name="icono" placeholder="Icono de la carpeta">
                                                        <a class="btnEnviarForm" title="Enviar"><i class="fa fa-check"></i>
                                                        </a>&nbsp;
                                                        <a class="btnOcultarForm" title="Cerrar">
                                                            <i class="fa fa-times"></i>
                                                        </a>
                                                    </td>
                                                    <td><a href="../UtilVistas/eliminarCarpetas.jsp?id=<%=e.getCodigo()%>"><i class="fa fa-trash-o"></i></a></td>
                                                    <td><a href="AgregarPaginasCarpetas.jsp?id=<%=e.getCodigo()%>" title="Agregar Paginas"><i class="fa fa-check"></i></a></td>
                                                </tr>
                                            </form>
                                            <%}
                                                }%>
                                        </table>
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
        <script src="../../recursos/js/funciones.js"></script>
    </body>
</html>
