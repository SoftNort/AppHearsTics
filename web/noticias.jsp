<%@include file="panel/Vistas/AdministrarHtml/ImportClases.jsp" %>
<%
    String idNoticia;
    if (request.getParameter("idNoticia").equals("") || request.getParameter("idNoticia").equals("null")) {
        idNoticia = "0";
    } else {
        idNoticia = (String) request.getParameter("idNoticia");
    }
    ArrayList<NoticiasHtml> listNot = controlador.getNoticiasId(idNoticia);
%>
<!DOCTYPE html>
<html dir="ltr" lang="ES">
    <head>
        <%@include file="panel/AdministrarSitioWeb/htmlHead.jsp" %>
        <title>Inicio</title>
    </head>
    <body>
        <div id="art-main">
            <div class="art-sheet clearfix">                
                <%@include file="panel/AdministrarSitioWeb/header.jsp" %>
                <%@include file="panel/AdministrarSitioWeb/slider.jsp" %>
                <div class="art-layout-wrapper">
                    <div class="art-content-layout">
                        <div class="art-content-layout-row">
                            <%@include file="panel/AdministrarSitioWeb/boxLeft.jsp" %>
                            <div class="art-layout-cell art-content">
                                <div class="art-postmetadataheader">
                                    <% for (NoticiasHtml noticias : listNot) {%>

                                    <div class="art-block clearfix">
                                        <div class="art-blockheader">
                                            <h3 class="t"><%=noticias.getTitulo()%></h3>
                                        </div>
                                        <% if (!noticias.getUrlImg().equals("")) {%>
                                        <div style=" text-align: center; height: 350px" >
                                            <img style="max-width: 100%; max-height: 100%;" src="<%=request.getContextPath()%>/recursos/img/img-noticias/<%=noticias.getUrlImg()%>">                                                
                                        </div>
                                        <%}%>
                                        <div>
                                            <p style="margin-top: 5px;">
                                                <%=noticias.getDescri()%>
                                            </p>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                            <%@include file="panel/AdministrarSitioWeb/boxRight.jsp" %>
                        </div>
                    </div>
                </div> 
                <%@include file="panel/AdministrarSitioWeb/Footer.jsp" %>
            </div>
        </div>
    </body>
</html>


