
<%  ArrayList<PublicidadHtml> listPubliIzq = controlador.getDatosPublicidades("izq");
    ArrayList<ClasificadosHtml> listClasIzq = controlador.getClasificadosLateral("izq");

%>
<div class="art-layout-cell art-sidebar1">
    <div class="art-block clearfix">
        <div class="art-blockheader">
            <h3 class="t">Sabios</h3>
        </div>
        <!--div class="art-blockcontent"><p>Vestibulum dolor tristique semper justo sed ut ligula. Hendrerit iaculis at a nunc nisl luctus quis erat ligula pretium lobortis ac posuere duis proin enim aliquam.</p></div-->
        <iframe style="width: 100%; height: 183px;" scrolling="no" title="HeartsTics" 
                src="<%=request.getContextPath()%>/panel/AdministrarSitioWeb/login-sm.jsp" frameborder="0"/>
        </iframe>
    </div>
    <% if (listPubliIzq.isEmpty() == false) {%>
    <div class="art-block clearfix ">
        <div style="position: relative; list-style: none;">
            <section class="slider-container-small">
                <ul id="slider-small-1" class="slider-wrapper">
                    <% for (PublicidadHtml izq : listPubliIzq) {%>
                    <li class="slide-current">
                        <a href="<%=izq.getLink()%>" target="_black" >
                            <img src="<%=request.getContextPath()%>/recursos/img/img-slider/<%=izq.getImg()%>" title="<%=izq.getTitulo()%>" alt="">
                        </a>
                    </li>
                    <%}%>
                </ul>

                <!-- Controles de Navegacion -->
                <ul id="slider-controls-small-1" class="slider-controls-small">
                    <li class="previous"></li>
                    <li class="next"></li>
                </ul>
            </section>
        </div>
    </div>
    <%}%>      
    <!--Clasificaciones izq-->
    <% if (listClasIzq.isEmpty() == false) {%>
    <% for (ClasificadosHtml datos : listClasIzq) {%>
    <div class="art-block clearfix">
        <div class="art-blockheader">
            <h3 class="t"><%=datos.getTitulo()%></h3>
        </div>
        <div class="art-blockcontent">
            <div>
                <p><%=datos.getParrafo()%></p>
                <ul>
                    <% 
                    ArrayList<ClasificadosLinksHtml> listLinksClasi = controlador.getClasificadosLinksLateral(datos.getIdClasificado());
                    for (ClasificadosLinksHtml links : listLinksClasi) {%>
                    <li>
                        <a href="<%=links.getHttpLink()%>" title="<%=links.getTituloLink()%>"><%=links.getNombreLink()%></a>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>
    <%}%>
    <%}%>
</div>