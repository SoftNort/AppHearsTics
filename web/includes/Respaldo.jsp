<%@include file="../includes/recursosIndex.jsp" %>
<%@include file="../panel/Vistas/AdministrarHtml/ImportClases.jsp" %>

<%
    String ruta = (String) request.getRequestURI();
    String rutaPagina = ruta.substring(15);
    ArrayList<PaginasHtml> listPag = controlador.getPaginaXurl(rutaPagina);
%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">    
    <head>
        <title>HeartsTics</title>
        <%@include file="../panel/AdministrarSitioWeb/htmlHead.jsp" %>
    </head>
    <body onload="urlVentana()">
        <div id="art-main">
            <div class="art-sheet clearfix">
                <div id="art-header-bg">
                </div>
                <%@include file="../panel/AdministrarSitioWeb/header.jsp" %>
                <%@include file="../panel/AdministrarSitioWeb/slider.jsp" %>
                <div class="art-layout-wrapper">
                    <div class="art-content-layout">
                        <div class="art-content-layout-row">
                            <%@include file="../panel/AdministrarSitioWeb/boxLeft.jsp" %>
                            <div class="art-layout-cell art-content">
                                <div class="art-postmetadataheader">
                                    <% for (PaginasHtml paginas : listPag) {%> 
                                    <ul class="session-noticias">
                                        <div class="art-block clearfix">
                                            <div class="art-blockheader">
                                                <h3 class="t"><%=paginas.getTitulo()%></h3>
                                            </div>
                                            <% if (!paginas.getImagen().equals("")) {%>
                                            <div style="text-align: center; height: 350px">
                                                <img style="max-width: 100%; max-height: 100%;" src="<%=request.getContextPath()%>/recursos/img/img-paginas/<%=paginas.getImagen()%>">                                                
                                            </div>
                                            <%}%>
                                            <p  style="padding: 0;">
                                                <%=paginas.getContenido()%>
                                            </p>
                                        </div>
                                    </ul>         
                                    <%}%>
                                </div>
                            </div>
                            <%@include file="../panel/AdministrarSitioWeb/boxRight.jsp" %>
                        </div>
                    </div>
                </div> 
                <%@include file="../panel/AdministrarSitioWeb/Footer.jsp" %>
            </div>
        </div>
    </body>
</html>

