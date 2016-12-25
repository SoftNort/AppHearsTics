<%@include file="includes/recursosIndex.jsp" %>
<%@include file="panel/Vistas/AdministrarHtml/ImportClases.jsp" %>
<%
    int pg = 0; //pagina a mostrar
    if (request.getParameter("pg") == null) {
        pg = 1;
    } else {
        pg = Integer.parseInt(request.getParameter("pg"));
    }
    int numreg = controlador.contarFilas(); // numero de registros 
    int numpg = numreg / 10; //numero de paginas a mostrar

    //calcular el inicio del arreglo
    int inipg = 0;//variable del inicio del arreglo
    int r = (pg - 1) % 10;
    if (r == 0) {
        inipg = pg - 1; //enpieza desde 0 y va de 10 en 10
    } else {
        inipg = ((pg - 1) / 10) * 10;
    }
    ArrayList<NoticiasHtml> listNoti = controlador.getNoticiasPaginas(pg, 10);
%>
<!DOCTYPE html>
<html dir="ltr" lang="ES">
    <head>
        <%@include file="panel/AdministrarSitioWeb/htmlHead.jsp" %>
        <title>Inicio</title>
        <style>
            .paginacion #paginacion__a-active<%=pg%> {
                background: rgba(84, 70, 91,.6);
            }
        </style>
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
                                    <ul class="session-noticias">
                                        <% for (NoticiasHtml lista : listNoti) {%>
                                        <div class="art-block clearfix">
                                            <div class="art-blockheader">
                                                <h3 class="t"><%=lista.getTitulo()%></h3>
                                            </div>
                                            <li class="session-noticias__li">
                                                <% if (!lista.getUrlImg().equals("")) {%>
                                                <img class="session-noticias__img" src="<%=request.getContextPath()%>/recursos/img/img-noticias/<%=lista.getUrlImg()%>">
                                                <%} else {%>
                                                <img class="session-noticias__img" src="recursos/img/logo-lg-1024.png">
                                                <%}%>
                                                <p class="session-noticias__p"><%=lista.getParrafo()%> <a class="leer-mas art-button" href="noticias.jsp?idNoticia=<%=lista.getIdNot()%>" target="_black">Leer mas..</a></p>
                                            </li>
                                        </div>
                                        <%}%>
                                    </ul>
                                    <% if (numreg > 9) {%>
                                    <div class="paginacion">
                                        <% if (pg > 1) {%>
                                        <a class="paginacion__a previous" href="?pg=<%=pg - 1%>">Anterior</a>
                                        <%}%>

                                        <%for (int j = inipg; j < 10 + inipg; j++) {
                                                if (j <= numpg) {%>

                                        <a class="paginacion__a" id="paginacion__a-active<%=j + 1%>" href="?pg=<%=j + 1%>"><%=j + 1%></a> 

                                        <%}
                                            }
                                            if (pg <= numpg) {%>

                                        <a class="paginacion__a after" href="?pg=<%=pg + 1%>">Siguiente</a>

                                        <%}%>
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


