<%@include file="AdministrarHtml/ImportClases.jsp" %>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "fotosDePerfil.jsp");
    ArrayList<Curso> cursos = controlador.listarCursos();
%>
<html class="no-js" lang="en">

    <head>
        <title> Hearts Tics </title>
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
                            Fotos de perfil
                        </h3>
                        <p class="title-description"> 
                            Agregar fotos de perfil a un estudiante
                        </p>
                    </div>
                    <section class="section">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-block sameheight-item">
                                    <div class="title-block">
                                        <h3 class="title">
                                            Estudiantes
                                        </h3> 
                                    </div>
                                    <div class="table-responsive">
                                        <label>Seleccione el curso</label>
                                        <select id="grupos" class="form-control">
                                            <option>Seleccione una opción</option>
                                            <%for (Curso c : cursos) {%>
                                            <option value="<%=c.getIdCurso()%>"><%=c.getDescripcion()%></option>
                                            <%}%>
                                        </select>
                                        <div id="respuesta">
                                        </div>
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
        <script src="../../recursos/js/funciones.js" ></script>

</html>
