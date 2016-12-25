
<%  ArrayList<SliderMainHtml> listaSlid = controlador.getSlider();
%>
<% if (controlador.getSlider().isEmpty() == false) {%>
<section class="slider-container">
    <ul id="slider" class="slider-wrapper">
        <% for (SliderMainHtml sliders : listaSlid) {%>
        <li class="slide-current">
            <img src="<%=request.getContextPath()%>/recursos/img/img-slider/<%=sliders.getUrlImg()%>" title="" alt="">

            <div class="caption">
                <h2 class="caption-title"><%=sliders.getParraf1()%></h2>
                <p><%=sliders.getParraf2()%></p>
                <a href="<%=sliders.getUrlLink()%>" target="_black"><%=sliders.getParraf3()%></a>
            </div>
        </li>
        <%}%>
    </ul>
    <!-- Controles de Navegacion -->
    <ul id="slider-controls" class="slider-controls"></ul>
</section>
<%}%>