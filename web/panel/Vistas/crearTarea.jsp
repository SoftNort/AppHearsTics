<%@include file="AdministrarHtml/ImportClases.jsp" %>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html>
<%  session.setAttribute("paginaActual", "crearTarea.jsp");
    Usuario user = null;
    ArrayList<Materia> lista = null;
    if (session.getAttribute("usuario") != null) {
        user = (Usuario) session.getAttribute("usuario");
        lista = controlador.listarMateriaDocenteGrupos(user.getIdUsuario());
    }
    Calendar fecha = new GregorianCalendar();
%>
<html class="no-js" lang="en">

    <head>
        <title> ModularAdmin - Free Dashboard Theme | HTML Version </title>
        <%@include file="AdministrarHtml/Links.jsp" %>
        <script type="text/javascript" src="../../ckeditor/ckeditor.js" ></script>
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
                <form id="formulario" name="formulario" method="post">
                    <article class="content forms-page">
                        <div class="title-block">
                            <h3 class="title">
                                Crear Tareas 

                            </h3>
                            <p class="title-description"></p>
                        </div>                    
                        <section class="section">
                            <div class="row sameheight-container">
                                <div class="col-md-6">
                                    <div class="card card-block ">
                                        <div class="title-block">
                                            <h3 class="title">
                                                Datos de la tarea
                                            </h3> 
                                        </div>
                                        <div>                                        
                                            <div class="form-group">
                                                <label >Asunto<span>*</span></label>
                                                <input type="text" class="form-control" id="asunto" required="required" maxlength="250" name="asunto" placeholder="Asunto" />
                                            </div>

                                            <div class="form-group">
                                                <label >Descripción de la tarea</label>
                                                <textarea placeholder="Descripción" id="descripcion" class="form-control" style="resize:none" id="descripcion" maxlength="250" rows="3" name="descripcion" ></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label >Fecha de entrega</label>
                                                <input type="date" class="form-control" id="fechaEntrega" name="fechaEntrega" value="<%=fecha.get(Calendar.YEAR) + "-" + (fecha.get(Calendar.MONTH) + 1) + "-" + fecha.get(Calendar.DAY_OF_MONTH)%>" min="<%=fecha.get(Calendar.YEAR) + "-" + (fecha.get(Calendar.MONTH) + 1) + "-" + fecha.get(Calendar.DAY_OF_MONTH)%>"/>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <label >Subir Archivos</label><br>
                                                <input type="file" multiple="multiple" id="file" name="files[]" class="btn btn-primary"/>
                                                <p class="help-block">Seleccione los archivos que desea agregar a la tarea</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>    
                                <div class="col-md-6">
                                    <div class="card card-block ">
                                        <div class="title-block">
                                            <h3 class="title">
                                                Destinatarios
                                            </h3> 
                                        </div> 
                                        <div class="form-group">
                                            <label>Selección por grupos</label>
                                            <select id="materiasDisponibles" name="materiasDisponibles" class="form-control"> 
                                                <option>Seleccione una materia</option>
                                                <%for (Materia m : lista) {%>
                                                <option value="<%=m.getId()%>"><%=m.getNombre()%></option> 
                                                <%}%>
                                            </select>
                                        </div>
                                        <div id="mostrarGrupos"></div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <input type="button" id="btnEnviarTarea" name="enviar" style="float: right;" id="btn" value="Enviar Tarea" class="btn btn-lg btn-success"/>
                            </div>
                            <div id="respuesta2"></div>
                        </section>
                    </article>
                </form>
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
        <script>
            $("#materiasDisponibles").on("change", function() {
                document.getElementById("mostrarGrupos").innerHTML="";
                var valor = document.getElementById('materiasDisponibles').value;
                var imagen1 = document.createElement("img");
                imagen1.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen1.setAttribute("class", "img-gif");
                var bloq1 = document.getElementById("mostrarGrupos");
                bloq1.appendChild(imagen1);
                var ruta = "../UtilVistas/cargarGruposMateria.jsp";
                $.post(ruta,
                        {
                            valor: valor
                        },
                function(data) {
                    $("#mostrarGrupos").html(data);
                });
            });
        </script>
        
        

        <script type="text/javascript">
            $("#btnEnviarTarea").on("click", function() {
                document.getElementById("respuesta2").innerHTML = "";
                var imagen = document.createElement("img");
                imagen.setAttribute("src", "../../recursos/img/cargando.gif");
                imagen.setAttribute("class", "img-gif");
                var bloq = document.getElementById("respuesta2");
                bloq.appendChild(imagen);
                var formData = new FormData($("#formulario")[0]);
                var ruta = "../UtilVistas/crearTarea.jsp";
                console.log(formData);
                $.ajax({
                    url: ruta,
                    type: "POST",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(datos)
                    {
                        $("#respuesta2").html(datos);
                    }
                });
                document.getElementById("asunto").value = "";
                document.getElementById("descripcion").value = "";
                document.getElementById("fechaEntrega").value = "";
                document.getElementById("file").value = "";
                document.getElementById("mostrarGrupos").innerHTML="";
            });
            CKEDITOR.replace("descTareaAgg");
        </script>
    </body>
</html>
