<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "registrarPagina.jsp");
    ArrayList<Pagina> paginas = controlador.listarPaginas();
    ArrayList<CarpetaPagina> CarpetaPaginas = controlador.listarCarpetasPaginas();
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
                            Gestionar Paginas <a href="javascript:void(0);" onclick="nuevo(1);">Agregar Nueva</a>
                        </h3>
                        <p class="title-description"> 
                            Agregar y/o eliminar paginas
                        </p>
                    </div>

                    <section class="section" id="session-nueva-noticia" style="display: none">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title-block">
                                    <h3 class="title ">
                                        Registrar un nueva pagina
                                    </h3> 
                                </div>
                                <form action="../UtilVistas/registrarPagina.jsp" method="post" id="frmRegistrarPagina" >
                                    <div class="form-group">
                                        <label for="exampleInputName2">Dirección de la página</label>
                                        <input type="text" name="nombre" value="" class="form-control" placeholder="Ej. RegistroAlumno.jsp" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputName2">Nombre de la Pagina</label>
                                        <input type="text" name="descripcion" value="" class="form-control" placeholder="Ej. Registrar Alumno" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputName2">Carpeta a la que pertenece</label>
                                        <select name="carpeta" class="form-control">
                                            <option value="0">Seleccione una carpeta</option>
                                            <% for (CarpetaPagina carp : CarpetaPaginas) {%>
                                            <option value="<%=carp.getCodigo()%>"><%=carp.getNombre()%></option>
                                            <%}%>

                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-success">Registrar</button>
                                    <button type="button" class="btn btn-danger" style="float: right" onclick="nuevo(2);">Cancelar</button>
                                </form>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-block">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Paginas disponibles
                                        </h3> 
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tr>
                                                <th>
                                                    <span>Nombre</span>
                                                    <span style="float: right;">Descripción</span>
                                                </th>
                                                <th>Eliminar</th>
                                            </tr>
                                            <%if (paginas.isEmpty()) {%>
                                            <td colspan="3"><%="No hay páginas registradas "%></td>
                                            <%} else {
                                                for (Pagina e : paginas) {%>

                                                <form class="formulario" action="../UtilVistas/paginasEditar.jsp" method="post">
                                                <tr>
                                                    <td class="boxBtnMostrarForm">
                                                        <a class="btnMostrarForm">
                                                            <i class="fa fa-pencil"></i>
                                                        </a>&nbsp;
                                                        <span><%=e.getNombre()%></span>
                                                        <span style="float: right;"><%=e.getDescripcion()%></span>
                                                    </td>
                                                    <td class="boxFormulario form-group" style="display: none;">
                                                        <input type="hidden" name="id" value="<%=e.getCodigo()%>">
                                                        <label>Nombre de la pagina</label>
                                                        <input type="text" class="form-control" required value="<%=e.getNombre()%>" name="nombre" placeholder="Nombre de la pagina">
                                                        <label>Descripción de la pagina</label>
                                                        <input type="text" class="form-control" required value="<%=e.getDescripcion()%>" name="descripcion" placeholder="Descripción de la pagina">
                                                        <a class="btnEnviarForm" title="Enviar"><i class="fa fa-check"></i>
                                                        </a>&nbsp;
                                                        <a class="btnOcultarForm" title="Cerrar">
                                                            <i class="fa fa-times"></i>
                                                        </a>
                                                    </td>
                                                    <td style="width: 30%"><a href="../UtilVistas/paginaEliminar.jsp?id=<%=e.getCodigo()%>" title="Eliminar"><i class="fa fa-trash-o"></i></a></td>
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
