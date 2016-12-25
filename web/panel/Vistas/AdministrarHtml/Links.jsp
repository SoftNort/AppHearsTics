<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<!-- Place favicon.ico in the root directory -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/vendor.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/styleGenerals.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/estilosSlider.css">
<title>Heart TICS</title>
<!-- Theme initialization -->

<script>
    var themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
            {};
    var themeName = themeSettings.themeName || '';
    if (themeName)
    {
        document.write('<link rel="stylesheet" id="theme-style" href="<%=request.getContextPath()%>/recursos/css/app-' + themeName + '.css">');
    }
    else
    {
        document.write('<link rel="stylesheet" id="theme-style" href="<%=request.getContextPath()%>/recursos/css/app.css">');
    }
</script>


<script src="<%=request.getContextPath()%>/recursos/js/vendor.js"></script>
<script src="<%=request.getContextPath()%>/recursos/js/app.js"></script>
<script src="<%=request.getContextPath()%>/recursos/js/FunctionsGenerals.js"></script>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>