<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "administrarInformacion.jsp");
    ArrayList<TipoDocumento> documentos = controlador.cargarDocumentos();
    ArrayList<TipoUsuario> tipos = controlador.listarTiposUsuario();
    ArrayList<Curso> cursos = controlador.listarCursos();

    int idUsuario;
    if (request.getParameter("idUsu") == null) {
        idUsuario = 0;
%>
<script>
    window.location.href = "sinPermisos.jsp";
</script>
<%
    } else {
        idUsuario = Integer.parseInt(request.getParameter("idUsu"));
    }
    Usuario dtoUsu = controlador.datosUsuario(idUsuario);
    Estudiante dtoEst = controlador.getdtoEstudiante(idUsuario);
    Acudiente dtoAcu = controlador.getDtoAcudiente(idUsuario);
    String tipoU = "";
    try {
        for (TipoUsuario tipUs : tipos) {
            if (tipUs.getId() == dtoUsu.getIdTipoUsuario()) {
                tipoU = tipUs.getRol();
            }
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
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
                <form action="../UtilVistas/actualizarUsuario.jsp" method="post">
                    <input type="text" name="idUsuario" value="<%=dtoUsu.getIdUsuario()%>">
                    <input type="hidden" name="tipoUsu" value="<%=tipoU%>"> 
                    <article class="content dashboard-page">
                        <div class="title-block">
                            <h3 class="title">
                                Actualizar Información de <%=dtoUsu.getNombres() + " " + dtoUsu.getApellidos()%>
                            </h3>
                            <p class="title-description"> </p>
                        </div>
                        <section class="section">
                            <div class="col col-xs-12 col-sm-12 col-md-12 col-xl-12 history-col">
                                <div class="card sameheight-item" data-exclude="xs">
                                    <div class="card-header card-header-sm bordered">
                                        <div class="header-block">
                                            <h3 class="title">Formulario</h3> 
                                        </div>
                                        <ul class="nav nav-tabs pull-right" role="tablist">
                                            <li class="nav-item"> <a class="nav-link active" href="#personal" role="tab" data-toggle="tab">Usuario</a> </li>
                                            <li class="nav-item"> <a class="nav-link" href="#ubicacion" role="tab" data-toggle="tab">Ubicación</a> </li>
                                            <li class="nav-item"> <a class="nav-link" href="#usuario" role="tab" data-toggle="tab">Personal</a> </li>
                                        </ul>
                                    </div>
                                    <div class="card-block">
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane active fade in" id="personal">
                                                <p class="title-description"> Datos del Usuario </p>
                                                <div >
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Nombres
                                                        </label><spand>*</spand>
                                                        <input type="text" name="nombre" value="<%=dtoUsu.getNombres()%>"  class="form-control boxed" placeholder="Nombres" required> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Apellidos
                                                        </label><spand>*</spand>
                                                        <input type="text" name="apellido" value="<%=dtoUsu.getApellidos()%>"  class="form-control boxed" placeholder="Apellidos" required> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Tipo de Documento 
                                                        </label><spand>*</spand>
                                                        <select name="tipoDoc" class="form-control" required>
                                                            <option value="">Seleccione el tipo de documento</option>
                                                            <%for (TipoDocumento t : documentos) {
                                                                    if (t.getIdTipoDoc() == dtoUsu.getTipoDoc().getIdTipoDoc()) {
                                                            %>
                                                            <option value="<%=t.getIdTipoDoc()%>" selected><%=t.getNombreDoc()%></option>
                                                            <%
                                                            } else {
                                                            %>
                                                            <option value="<%=t.getIdTipoDoc()%>"><%=t.getNombreDoc()%></option>
                                                            <%}
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Numero de Documento
                                                        </label><spand>*</spand>
                                                        <input type="text" name="numDoc" value="<%=dtoUsu.getNumDoc()%>" class="form-control boxed" placeholder="Número de Documento"> 
                                                    </div> 

                                                    <div class="form-group">
                                                        <label class="control-label">Teléfono
                                                        </label><spand>*</spand>
                                                        <input type="text" name="telefono" value="<%=dtoUsu.getTelefono()%>"  class="form-control boxed" placeholder="3001234567-5802222" required>
                                                    </div>
                                                    <% if (tipoU.equalsIgnoreCase("estudiante")) {%>
                                                    <div class="form-group"> 
                                                        <label class="control-label" >Curso</label><spand>*</spand>
                                                        <select name="curso" class="form-control">
                                                            <%for (Curso c : cursos) {
                                                                    if (c.getIdCurso() == dtoEst.getGrupo()) {%>
                                                            <option value="<%=c.getIdCurso()%>" selected><%=c.getDescripcion()%></option>        
                                                            <%} else {%>
                                                            <option value="<%=c.getIdCurso()%>"><%=c.getDescripcion()%></option>
                                                            <%}
                                                                }%>
                                                        </select>
                                                    </div>
                                                    <%}%>
                                                    <% if (!tipoU.equalsIgnoreCase("estudiante") && !tipoU.equalsIgnoreCase("docente") && !tipoU.equalsIgnoreCase("acudiente")) {%>
                                                    <div class="form-group"> 
                                                        <label class="control-label" >Rol</label><spand>*</spand>
                                                        <select name="roles" id="roles" class="form-control">
                                                            <option value="">Seleccion el rol</option>
                                                            <%for (TipoUsuario e : tipos) {
                                                                    if (!e.getRol().equalsIgnoreCase("estudiante") && !e.getRol().equalsIgnoreCase("docente") && !e.getRol().equalsIgnoreCase("acudiente")) {
                                                                        if (e.getId() == dtoUsu.getIdTipoUsuario()) {
                                                            %>
                                                            <option value="<%=e.getId()%>" selected><%=e.getRol()%></option>
                                                            <%} else {%>
                                                            <option value="<%=e.getId()%>"><%=e.getRol()%></option>
                                                            <%}
                                                                    }
                                                                }%>
                                                        </select>
                                                    </div>   
                                                    <%}%>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="ubicacion">
                                                <p class="title-description"> Datos de Ubicación </p>
                                                <div >
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Ciudad de Nacimiento
                                                        </label> 
                                                        <input type="text" name="ciudadNacimiento" value="<%=dtoUsu.getCiudadNacimiento()%>"class="form-control boxed"> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Departamento de Nacimiento
                                                        </label> 
                                                        <input type="text" name="departamentoNacimiento" value="<%=dtoUsu.getDepartamentoNacimiento()%>" class="form-control boxed"> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Pais de Nacimiento
                                                        </label> 

                                                        <input type="text" name="paisNacimiento" value="<%=dtoUsu.getPaisNacimiento()%>" class="form-control boxed"> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Ciudad Actual
                                                        </label> 
                                                        <input type="text" name="ciudadActual" value="<%=dtoUsu.getCiudadActual()%>" class="form-control boxed"> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Departamento Actual
                                                        </label> 
                                                        <input type="text" name="departamentoActual" value="<%=dtoUsu.getDepartamentoActual()%>" class="form-control boxed"> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Pais Actual
                                                        </label> 
                                                        <input type="text" name="paisActual" value="<%=dtoUsu.getPaisActual()%>" class="form-control boxed"> 
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="usuario">
                                                <p class="title-description"> Datos Personales </p>
                                                <div class="form-group">
                                                    <label>Fecha de Nacimiento</label>
                                                    <input type="date" name="fechaNacimiento" value="<%=dtoUsu.getFechaNacimiento()%>" class="form-control boxed" />
                                                </div>
                                                <div class="form-group"> 
                                                    <label class="control-label">
                                                        Género
                                                    </label>
                                                    <select name="genero" class="form-control">
                                                        <option value="">Seleccione el género del usuario</option>
                                                        <option class="genero" value="Femenino">Femenino</option>
                                                        <option class="genero" value="Masculino">Masculino</option>
                                                        <option class="genero" value="Otro">Otro</option>
                                                    </select>
                                                    <input type="hidden" id="g" value="<%=dtoUsu.getGenero()%>">
                                                </div> 
                                                <% if (tipoU.equalsIgnoreCase("acudiente")) {%>
                                                <div class="form-group">
                                                    <label>Profesión</label><spand>*</spand>
                                                    <input type="text" name="profesion" value="<%=dtoAcu.getProfesion()%>" class="form-control" placeholder="Profesión del acudiente" required="" />
                                                </div>
                                                <%}%>
                                                <div class="form-group">
                                                    <label class="control-label">Correo Electrónico</label>
                                                    <input type="email" name="correo" value="<%=dtoUsu.getCorreo()%>" placeholder="Correo Electrònico" class="form-control"/>
                                                </div>                                            
                                                <div class="form-group">
                                                    <label class="control-label">EPS o ARS</label>
                                                    <input type="text" name="eps" value="<%=dtoUsu.getEps()%>" class="form-control boxed" placeholder="EPS o ARS afiliado" />
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Tipo de Sangre</label>
                                                    <select name="tipoSangre"  class="form-control">
                                                        <option value="">Seleccione el tipo de sangre</option>
                                                        <option class="sangre" value="A+">A+</option>
                                                        <option class="sangre" value="A-">A-</option>
                                                        <option class="sangre" value="B+">B+</option>
                                                        <option class="sangre" value="B-">B-</option>
                                                        <option class="sangre" value="O+">O+</option>
                                                        <option class="sangre" value="O-">O-</option>
                                                        <option class="sangre" value="AB+">AB+</option>
                                                        <option class="sangre" value="AB-">AB-</option>
                                                    </select>
                                                    <input type="hidden" id="sangre" value="<%=dtoUsu.getTipoSangre()%>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clear-fix"></div>
                            <div class="row">
                                <div class="col-md-3 col-md-offset-5">
                                    <input type="submit" value="Actualizar" class="btn btn-success btn-lg"/>
                                </div>
                            </div>
                        </section>
                    </article>
                </form>
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
        <script>
            function tipoUsuario() {

            }
            $(document).ready(function() {
                var tipo = document.getElementById("roles").value;
                document.getElementById("rolInput").value = tipo;
                var g = document.getElementById("g").value;
                var gs = document.getElementsByClassName("genero");
                var s = document.getElementById("sangre").value;
                var sg = document.getElementsByClassName("sangre");
                var i;
                for (i = 0; i < sg.length; i++) {
                    if (s === sg[i].value) {
                        sg[i].selected = true;
                    }
                }
                for (i = 0; i < gs.length; i++) {
                    if (g === gs[i].value) {
                        gs[i].selected = true;
                    }
                }

            });

        </script>
    </body>
</html>
