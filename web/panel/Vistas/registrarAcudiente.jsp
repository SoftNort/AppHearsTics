<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "registrarAcudiente.jsp");
    ArrayList<TipoDocumento> documentos = controlador.cargarDocumentos();
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
                <form id="frmRegistrarEstudiante" method="post" action="../UtilVistas/registrarAcudiente.jsp">
                    <article class="content dashboard-page">
                        <div class="title-block">
                            <h3 class="title">
                                Registrar Acudiente
                            </h3>
                            <p class="title-description"> </p>
                        </div>
                        <section class="section">
                            <div class="col col-xs-12 col-sm-12 col-md-12 col-xl-12 history-col">
                                <div class="card sameheight-item" data-exclude="xs">
                                    <div class="card-header card-header-sm bordered">
                                        <div class="header-block">
                                            <h3 class="title">Formulario de Registro</h3> 
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
                                                <p class="title-description"> Datos del usuario </p>
                                                <div >
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Nombres
                                                        </label><spand>*</spand>
                                                        <input type="text" name="nombre"  class="form-control boxed" placeholder="Nombres" required> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Apellidos
                                                        </label><spand>*</spand>
                                                        <input type="text" name="apellido"  class="form-control boxed" placeholder="Apellidos" required> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Tipo de Documento 
                                                        </label><spand>*</spand>
                                                        <select name="tipoDoc" class="form-control" required>
                                                            <option value="">Seleccione el tipo de documento</option>
                                                            <%for (TipoDocumento t : documentos) {
                                                            %><option value="<%=t.getIdTipoDoc()%>"><%=t.getNombreDoc()%></option>
                                                            <%
                                                                }
                                                            %>

                                                        </select>
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Numero de Documento
                                                        </label><spand>*</spand>
                                                        <input type="text" name="numDoc"  class="form-control boxed" placeholder="Número de Documento"> 
                                                    </div>                                                
                                                    <div class="form-group">
                                                        <label class="control-label">Teléfono
                                                        </label><spand>*</spand>
                                                        <input type="text" name="telefono"  class="form-control boxed" placeholder="3001234567-5802222" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Usuario</label><spand>*</spand>
                                                        <input type="text" name="usuario" value="" class="form-control boxed" placeholder="Nombre de usuario" required=""/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Contraseña</label><spand>*</spand>
                                                        <input type="password" name="contra" value="" class="form-control boxed" placeholder="Mínimo 6 carácteres" required=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="ubicacion">
                                                <p class="title-description"> Datos de Ubicación </p>
                                                <div >
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Ciudad de Nacimiento
                                                        </label> 
                                                        <input type="text" name="ciudadNacimiento" value="Cúcuta" class="form-control boxed"> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Departamento de Nacimiento
                                                        </label> 
                                                        <input type="text" name="departamentoNacimiento" value="Norte de Santander" class="form-control boxed"> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Pais de Nacimiento
                                                        </label> 

                                                        <input type="text" name="paisNacimiento" value="Colombia" class="form-control boxed"> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Ciudad Actual
                                                        </label> 
                                                        <input type="text" name="ciudadActual" value="Cúcuta" class="form-control boxed"> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Departamento Actual
                                                        </label> 
                                                        <input type="text" name="departamentoActual" value="Norte de Santander" class="form-control boxed"> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <label class="control-label">
                                                            Pais Actual
                                                        </label> 
                                                        <input type="text" name="paisActual" value="Colombia" class="form-control boxed"> 
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="usuario">
                                                <p class="title-description"> Datos personales </p>
                                                <div class="form-group">
                                                    <label>Fecha de Nacimiento</label>
                                                    <input type="date" name="fechaNacimiento" value="" class="form-control boxed" />
                                                </div>
                                                <div class="form-group"> 
                                                    <label class="control-label">
                                                        Género
                                                    </label>
                                                    <select name="genero"  class="form-control">
                                                        <option value="">Seleccione el género del acudiente</option>
                                                        <option value="Femenino">Femenino</option>
                                                        <option value="Masculino">Masculino</option>
                                                        <option value="Otro">Otro</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Correo Electrónico</label>
                                                    <input type="email" name="correo" value="" placeholder="Correo Electrònico" class="form-control"/>
                                                </div>                                            
                                                <div class="form-group">
                                                    <label class="control-label">EPS o ARS</label>
                                                    <input type="text" name="eps" value="" class="form-control boxed" placeholder="EPS o ARS afiliado" />
                                                </div>
                                                <div class="form-group">
                                                    <label>Profesión</label><spand>*</spand>
                                                    <input type="text" name="profesion" value="" class="form-control" placeholder="Profesión del acudiente" required="" />
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Tipo de Sangre</label>
                                                    <select name="tipoSangre"  class="form-control">
                                                        <option value="">Seleccione el tipo de sangre</option>
                                                        <option value="A+">A+</option>
                                                        <option value="A-">A-</option>
                                                        <option value="B+">B+</option>
                                                        <option value="B-">B-</option>
                                                        <option value="O+">O+</option>
                                                        <option value="O-">O-</option>
                                                        <option value="AB+">AB+</option>
                                                        <option value="AB-">AB-</option>
                                                    </select>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clear-fix"></div>
                            <div class="row">
                                <div class="col-md-3 col-md-offset-5">
                                    <input type="submit" value="Registrar" class="btn btn-success btn-lg"/>
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
    </body>
</html>
