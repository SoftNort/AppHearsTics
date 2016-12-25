<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%  session.setAttribute("paginaActual", "asignarProfesor.jsp");
    ArrayList<Docente> docentes = controlador.listarDocentes();
    ArrayList<Grupo> grupos = controlador.listarGrupos();
    ArrayList<Materia> materias = controlador.listarMaterias();
    ArrayList<MateriaDocente> lista = controlador.listarMateriaDocente();    
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
                            Docentes Asignados <a href="javascript:void(0);" onclick="nuevo(1);">Asignar nuevo profesor</a>
                        </h1>
                        <p class="title-description"> Agregar y/o eliminar docentes de grupos </p>
                    </div>
                    <section class="section" id="session-nueva-noticia" style="display: none">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title-block col-xs-12">
                                    <h3 class="title ">
                                        Asignar profesor a grupo
                                    </h3> 
                                </div>
                                <section class="example">
                                    <form id="frmAsignaProfesor" action="../UtilVistas/asignarProfesor.jsp" method="post" >
                                        <div class="form-group">
                                        <select name="grupo" class="form-control">
                                            <option>Seleccione un grupo</option>
                                            <%for (Grupo g : grupos) {%>
                                            <option value="<%=g.getIdCurso().getIdCurso() + "-" + g.getIdGrupo()%>"><%=g.getIdCurso().getDescripcion() + "-" + g.getIdGrupo()%></option>  
                                            <%}%>
                                        </select>
                                        </div>
                                        <div class="form-group">
                                        <select name="materia" class="form-control">
                                            <option>Seleccione una materia</option>
                                            <%for (Materia m : materias) {%>
                                            <option value="<%=m.getId()%>"><%=m.getNombre()%></option>  
                                            <%}%>
                                        </select>
                                        </div>
                                        <div class="form-group">
                                        <select name="docente" class="form-control">
                                            <option>Seleccione un docente</option>
                                            <%for (Docente d : docentes) {%>
                                            <option value="<%=d.getIdUsuario()%>"><%=d.getNombres() + " " + d.getApellidos()%></option>  
                                            <%}%>
                                        </select>
                                        </div>
                                        <input type="submit" name="enviar" value="Registrar" class="btn btn-success">
                                        <button type="button" class="btn btn-danger" style="float: right" onclick="nuevo(2);">Cancelar</button>
                                        
                                    </form>                                    
                                </section>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12">
                                <div class="card card-block sameheight-item">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Docentes Asignados
                                        </h3>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tr>
                                                <th>Docente Encargado</th>
                                                <th>Materia</th>
                                                <th>Curso</th>
<!--                                                <th>Eliminar</th>-->
                                            </tr>
                                            <tbody>
                                                <%for (MateriaDocente m : lista) {%>
                                                <tr>
                                                    <td><%=m.getDocente().getNombres() + " " + m.getDocente().getApellidos()%></td>
                                                    <td><%=m.getMateria().getNombre()%></td>
                                                    <td><%=m.getGrupo().getIdCurso().getDescripcion() + "-" + m.getGrupo().getIdGrupo()%></td>
<!--                                                    <td>
                                                        <label>
                                                            <input class="checkbox" type="checkbox" name="eliminar" value="">
                                                            <span><i class="fa fa-trash-o" ></i></span>
                                                        </label>
                                                    </td>-->
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
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
    </body>

</html>
