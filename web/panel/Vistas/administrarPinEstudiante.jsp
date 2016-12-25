<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "administrarPinEstudiante.jsp");
    int idEstu = Integer.parseInt(request.getParameter("idEst"));
    Pin pinEst = controlador.pinEstudiante(idEstu);
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
                            Administrar Pin Estudiante
                        </h3>
                        <p class="title-description">  </p>
                    </div>

                    <section class="section">
                        <div class="card">
                            <div class="card-block">
                                <div class="title-block">
                                    <h3 class="title">
                                        Editar Pin Estudiante
                                    </h3> 
                                </div>
                                <form action="../UtilVistas/editarPinEstudiante.jsp" method="post" id="frmRegistrarTipoDoc" >
                                    <input type="hidden" name="idUsuario" value="<%=pinEst.getIdUsuario()%>">
                                    <div class="form-group">
                                        <label for="exampleInputName1">Nombres Estudiantes</label>
                                        <input id="exampleInputName1" type="text"  value="<%=pinEst.getNombres() + " " + pinEst.getApellidos() %>" class="form-control" readonly/>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputName2">Fecha de Creación</label>
                                        <input id="exampleInputName2" type="text" name="fCreaci" value="<%=pinEst.getInicio() %>" class="form-control" readonly/>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputName3">Fecha de Vencimiento</label>
                                        <input id="exampleInputName3" type="text" name="fVencim" value="<%=pinEst.getFin() %>" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputName4">Pin</label>
                                        <input id="exampleInputName4" type="text" name="idPin" value="<%=pinEst.getIdPin() %>" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputName5">Estado</label>
                                        <select class="form-control" name="estado">
                                            <% if(pinEst.getEstado().equals("Inactivo")) {%>
                                            <option value="Inactivo">Inactivo</option>
                                            <option value="activo">Activo</option>
                                            <%}else {%>
                                            <option value="activo">Activo</option>
                                            <option value="Inactivo">Inactivo</option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-success">Editar</button>
                                </form>
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
