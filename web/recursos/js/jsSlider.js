$(function() {
    var SliderModule = (function() {
        var pb = {};
        pb.el = $('#slider');
        pb.items = {
            panel: pb.el.find('li')
        }

        // Variables necesarias 
        var SliderInterval,
                currentSlider = 0,
                nextSlider = 1,
                lengthSlider = pb.items.panel.length;

        //Initialize
        pb.init = function(settings) {
            this.settings = settings || {duration: 8000}
            var output = '';
            //console.log('inicializado');
            // Activamos nuestro Slider
            SliderInit();

            for (var i = 0; i < lengthSlider; i++) {
                if (i == 0) {
                    output += '<li class="active"></li>';
                } else {
                    output += '<li></li>';
                }
            }

            // Controles del Slider

            $('#slider-controls').html(output).on('click', 'li', function(e) {
                var $this = $(this);
                //console.log($this.index())
                if (currentSlider !== $this.index()) {
                    changePanel($this.index());
                }
                ;
            });

        }

        var SliderInit = function() {
            SliderInterval = setInterval(pb.startSlider, pb.settings.duration);
        }
        pb.startSlider = function() {
            var panels = pb.items.panel,
                    controls = $('#slider-controls li');
            //console.log('mensaje');
           
            if (nextSlider >= lengthSlider) {
                nextSlider = 0;
                currentSlider = lengthSlider - 1;
            }

            console.log("next:  " + nextSlider);
            console.log("Actual:  " + currentSlider);



            //Efectos
            controls.removeClass('active').eq(currentSlider).addClass('active');
            for (i = 0; i < lengthSlider; i++) {
                if (currentSlider === i) {
                    panels.eq(i).fadeIn('slow');
                } else {
                    panels.eq(i).fadeOut('slow');
                }
            }
//            panels.eq(currentSlider).fadeOut('slow');
//            panels.eq(nextSlider).fadeIn('slow');

            //Actualizaremos nuestros datos
            currentSlider = nextSlider;
            nextSlider += 1;
        }

        // Funtion para controles del Slider
        var changePanel = function(id) {
            clearInterval(SliderInterval);
            var panels = pb.items.panel,
                    controls = $('#slider-controls li');
            //Comprovar el ID
            if (id >= lengthSlider) {
                id = 0;
            } else if (id < 0) {
                id = lengthSlider - 1;
            }

            //Efectos 
            controls.removeClass('active').eq(id).addClass('active');

            panels.eq(currentSlider).fadeOut('slow');
            panels.eq(id).fadeIn('slow');

            // Actualizamos nuestros datos
            currentSlider = id;
            nextSlider = id + 1;

            // Reactivamos Slider
            SliderInit();
        }

        return pb;
    }());
    var SliderModuleSmall1 = (function() {
        var pb = {};
        pb.el = $('#slider-small-1');
        pb.items = {
            panel: pb.el.find('li')
        }

        // Variables necesarias 
        var SliderInterval,
                currentSlider = 0,
                nextSlider = 1,
                lengthSlider = pb.items.panel.length;

        //Initialize
        pb.init = function(settings) {
            this.settings = settings || {duration: 8000};
            //console.log('inicializado');
            // Activamos nuestro Slider
            SliderInit();

//            for (var i = 0; i < lengthSlider; i++) {
//                if (i == 0) {
//                    output += '<li class="active"></li>';
//                } else {
//                    output += '<li></li>';
//                }
//            }

            // Controles del Slider

            $('#slider-controls-small-1').on('click', 'li.previous', function(e) {
                var $this = $(this);
                //console.log($this.index())

                changePanel($this.index());
                ;
            });
            $('#slider-controls-small-1').on('click', 'li.next', function(e) {
                var $this = $(this);
                //console.log($this.index())
                changePanel($this.index());
                ;
            });

        }

        var SliderInit = function() {
            SliderInterval = setInterval(pb.startSlider, pb.settings.duration);
        }
        pb.startSlider = function() {
            var panels = pb.items.panel;
            //console.log('mensaje');
            if (nextSlider >= lengthSlider) {
                nextSlider = 0;
            }

            //Efectos
            //controls.removeClass('active').eq(currentSlider).addClass('active');
            for (i = 0; i < lengthSlider; i++) {
                if (currentSlider === i) {
                    panels.eq(i).fadeIn('slow');
                } else {
                    panels.eq(i).fadeOut('slow');
                }
            }
//            panels.eq(currentSlider).fadeOut('slow');
//            panels.eq(nextSlider).fadeIn('slow');

            //Actualizaremos nuestros datos
            currentSlider = nextSlider;
            nextSlider += 1;

//            console.log('ciclo ...' + currentSlider + ' actual');
//            console.log('ciclo ...' + nextSlider + ' next');
        }

        // Funtion para controles del Slider
        var changePanel = function(id) {
            clearInterval(SliderInterval);
            var panels = pb.items.panel, siguiente;
            //console.log(id);

            //Comprovar el ID
            if (id == 1) {// si es 1 significa siguiente
                siguiente = nextSlider;
                if (siguiente >= lengthSlider) {
                    siguiente = 0;
                }
                console.log('siguente= ' + siguiente + ' where id = 1');
            } else if (id == 0) {// si es 1 significa anterior
                siguiente = currentSlider - 1;
                if (siguiente < 0) {
                    siguiente = lengthSlider - 1;
                }
//                console.log('siguente= ' + siguiente + ' where id = 0');
            }
//            console.log(currentSlider + ' actual');



            //console.log(currentSlider);
            //Efectos 
            //controls.removeClass('active').eq(id).addClass('active');

            panels.eq(currentSlider).fadeOut('slow');
            panels.eq(siguiente).fadeIn('slow');

            // Actualizamos nuestros datos
            currentSlider = siguiente;
            nextSlider = siguiente + 1;

            //console.log(id);

            // Reactivamos Slider
            SliderInit();
        }

        return pb;
    }());
    var SliderModuleSmall2 = (function() {
        var pb = {};
        pb.el = $('#slider-small-2');
        pb.items = {
            panel: pb.el.find('li')
        }

        // Variables necesarias 
        var SliderInterval,
                currentSlider = 0,
                nextSlider = 1,
                lengthSlider = pb.items.panel.length;

        //Initialize
        pb.init = function(settings) {
            this.settings = settings || {duration: 8000};
            //console.log('inicializado');
            // Activamos nuestro Slider
            SliderInit();

//            for (var i = 0; i < lengthSlider; i++) {
//                if (i == 0) {
//                    output += '<li class="active"></li>';
//                } else {
//                    output += '<li></li>';
//                }
//            }

            // Controles del Slider

            $('#slider-controls-small-2').on('click', 'li.previous', function(e) {
                var $this = $(this);
                //console.log($this.index())

                changePanel($this.index());
                ;
            });
            $('#slider-controls-small-2').on('click', 'li.next', function(e) {
                var $this = $(this);
                //console.log($this.index())
                changePanel($this.index());
                ;
            });

        }

        var SliderInit = function() {
            SliderInterval = setInterval(pb.startSlider, pb.settings.duration);
        }
        pb.startSlider = function() {
            var panels = pb.items.panel;
            //console.log('mensaje');
            if (nextSlider >= lengthSlider) {
                nextSlider = 0;
            }

            //Efectos
            //controls.removeClass('active').eq(currentSlider).addClass('active');
            for (i = 0; i < lengthSlider; i++) {
                if (currentSlider === i) {
                    panels.eq(i).fadeIn('slow');
                } else {
                    panels.eq(i).fadeOut('slow');
                }
            }
//            panels.eq(currentSlider).fadeOut('slow');
//            panels.eq(nextSlider).fadeIn('slow');

            //Actualizaremos nuestros datos
            currentSlider = nextSlider;
            nextSlider += 1;

//            console.log('ciclo ...' + currentSlider + ' actual');
//            console.log('ciclo ...' + nextSlider + ' next');
        }

        // Funtion para controles del Slider
        var changePanel = function(id) {
            clearInterval(SliderInterval);
            var panels = pb.items.panel, siguiente;
            //console.log(id);

            //Comprovar el ID
            if (id == 1) {// si es 1 significa siguiente
                siguiente = nextSlider;
                if (siguiente >= lengthSlider) {
                    siguiente = 0;
                }
                console.log('siguente= ' + siguiente + ' where id = 1');
            } else if (id == 0) {// si es 1 significa anterior
                siguiente = currentSlider - 1;
                if (siguiente < 0) {
                    siguiente = lengthSlider - 1;
                }
                console.log('siguente= ' + siguiente + ' where id = 0');
            }
            console.log(currentSlider + ' actual');



            //console.log(currentSlider);
            //Efectos 
            //controls.removeClass('active').eq(id).addClass('active');

            panels.eq(currentSlider).fadeOut('slow');
            panels.eq(siguiente).fadeIn('slow');

            // Actualizamos nuestros datos
            currentSlider = siguiente;
            nextSlider = siguiente + 1;

            //console.log(id);

            // Reactivamos Slider
            SliderInit();
        }

        return pb;
    }());
    SliderModuleSmall1.init({duration: 8000});
    SliderModuleSmall2.init({duration: 8000});
    SliderModule.init({duration: 10000});
});