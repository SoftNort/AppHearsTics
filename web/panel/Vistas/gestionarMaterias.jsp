<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "gestionarMaterias.jsp");
    ArrayList<Materia> materias = controlador.listarMaterias();
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
                            Gestionar Materias <a href="javascript:void(0);" onclick="nuevo(1);">Agregar Nueva</a>
                        </h3>
                        <p class="title-description"> 
                            Agregar y/o eliminar materias
                        </p>
                    </div>

                    <section class="section" id="session-nueva-noticia" style="display: none">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title-block">
                                    <h3 class="title ">
                                        Registrar una nueva materia
                                    </h3> 
                                </div>
                                <form action="../UtilVistas/registrarMateria.jsp" method="post" id="frmRegistrarMaterais" >
                                    <div class="form-group">
                                        <label for="exampleInputName2">Nombre de la Materia</label>
                                        <input id="exampleInputName2" type="text" name="materia" value="" class="form-control" placeholder="Ej. Matematicas" required/>
                                    </div>
                                    <button type="submit" class="btn btn-success">Registrar</button>
                                    <button type="button" class="btn btn-danger" style="float: right;" onclick="nuevo(2);">Cancelar</button>
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
                                            Materias disponibles
                                        </h3> 
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tr>
                                                <th>Rol</th>
                                                <th>Eliminar</th>
                                            </tr>
                                            <%int contador = -1;
                                                for (Materia e : materias) {
                                            %>
                                            <tr>
                                                <td class="boxBtnMostrarForm">
                                                    <a class="btnMostrarForm">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>&nbsp;
                                                    <%=e.getNombre()%>
                                                </td>
                                            <form class="formulario" action="../UtilVistas/editarMaterias.jsp" method="POST">
                                                <td class="boxFormulario" style="display: none;">
                                                    <input type="hidden" name="idMateria" value="<%=e.getId()%>">
                                                    <input type="text" required value="<%=e.getNombre()%>" name="descripcion" placeholder="Nombre de la materia">
                                                    <a class="btnEnviarForm" title="Enviar"><i class="fa fa-check"></i>
                                                    </a>&nbsp;
                                                    <a class="btnOcultarForm" title="Cerrar">
                                                        <i class="fa fa-times"></i>
                                                    </a>
                                                </td>
                                            </form>
                                            <td>
                                                <a href="../UtilVistas/eliminarMateria.jsp?eliminar=<%=e.getId() %>"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                            </tr>
                                            <%}%>
                                        </table>
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
        <script type="text/javascript"  src="../../recursos/js/funciones.js"></script>
    </body>
</html>
