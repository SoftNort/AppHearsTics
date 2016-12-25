<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "gestionTipoUsuario.jsp");
    ArrayList<TipoUsuario> usuarios = controlador.listarTiposUsuario();
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
                            Gestionar tipo de usuario <a href="javascript:void(0);" onclick="nuevo(1);">Agregar nuevo rol</a>
                        </h3>
                        <p class="title-description"> 
                            Agregar y/o eliminar los roles
                        </p>
                    </div>
                    <section class="section" id="session-nueva-noticia" style="display: none">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title">
                                    <h3 class="title ">
                                        Nuevo Rol
                                    </h3>                                    
                                </div>
                                <form action="../UtilVistas/registrarTipoUsuario.jsp" method="post" id="frmRegistrarTipoDoc" >
                                    <div class="form-group">
                                        <label for="exampleInputName2">Nombre del Rol: </label>
                                        <input type="text" name="rol"  value="" class="form-control" placeholder="Ej Docente" required/>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success">Registrar</button>
                                        <button type="button" class="btn btn-danger" style="float: right" onclick="nuevo(2);">Cancelar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12">
                                <div class="card card-block sameheight-item">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Roles disponibles
                                        </h3> 
                                    </div>
                                    <div class="table-responsive">
                                        <form id="frmEliminarTipoDoc" action="../UtilVistas/eliminarTipoUsuario.jsp" method="post">
                                            <table class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>Rol</th>
                                                    <th>Eliminar</th>
                                                </tr>
                                                <%for (TipoUsuario e : usuarios) {%>
                                                <tr>
                                                    <td><%=e.getRol()%></td>
                                                    <td>
                                                        <label>
                                                            <input name="eliminar" class="checkbox" type="checkbox" value="<%=e.getId()%>">
                                                            <span><i class="fa fa-trash-o"></i></span>
                                                        </label> 
                                                    </td>

                                                </tr>
                                                <%}%>
                                            </table>
                                            <input type="submit" name="guardarCambios" value="Eliminar" class="btn btn-warning"/>
                                        </form>
                                    </div>
                                </div>
                            </div>
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
