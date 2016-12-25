
<%  ArrayList<PublicidadHtml> listPubliDer = controlador.getDatosPublicidades("der");
    ArrayList<ClasificadosHtml> listClasDer = controlador.getClasificadosLateral("der");

%>
<div class="art-layout-cell art-sidebar2">
    <div class="art-block clearfix">
        <div class="art-blockheader">
            <h3 class="t">Ingreso Gnosoft</h3>
        </div>
        <!--div class="art-blockcontent"-->
        <div>
            <iframe style="width: 100%; height: 183px;" scrolling="no" title="Gnosoft Academico" 
                    src="http://www.colsacor.edu.co/home/inicio/apps/gnosoft_academico/login.html" frameborder="0"/>
            </iframe>
            <!--/div-->
        </div>
    </div>
    <% if (listPubliDer.isEmpty() == false) {%>
    <div class="art-block clearfix ">
        <div style="position: relative; list-style: none;">
            <section class="slider-container-small">
                <ul id="slider-small-2" class="slider-wrapper">
                    <% for (PublicidadHtml der : listPubliDer) {%>
                    <li class="slide-current">
                        <a href="<%=der.getLink()%>" target="_black" >
                            <img src="<%=request.getContextPath()%>/recursos/img/img-slider/<%=der.getImg()%>" title="<%=der.getTitulo()%>" alt="">
                        </a>
                    </li>
                    <%}%>
                </ul>
                <!-- Controles de Navegacion -->
                <ul id="slider-controls-small-2" class="slider-controls-small">
                    <li class="previous"></li>
                    <li class="next"></li>
                </ul>
            </section>
        </div>
    </div>
    <%}%>
    <!--Clasificaciones der-->
    <% if (listClasDer.isEmpty() == false) {%>
    <% for (ClasificadosHtml datos : listClasDer) {%>
    <div class="art-block clearfix">
        <div class="art-blockheader">
            <h3 class="t"><%=datos.getTitulo()%></h3>
        </div>
        <div class="art-blockcontent">
            <div>
                <p><%=datos.getParrafo()%></p>
                <ul>
                    <%
                        ArrayList<ClasificadosLinksHtml> listLinksClasiDer = controlador.getClasificadosLinksLateral(datos.getIdClasificado());
                        for (ClasificadosLinksHtml links : listLinksClasiDer) {%>
                    <li>
                        <a  href="<%=links.getHttpLink()%>" title="<%=links.getTituloLink()%>"><%=links.getNombreLink()%></a>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>
    <%}%>
    <%}%>
</div>