<%-- 
    Document   : index
    Created on : 27/10/2016, 20:46:34
    Author     : Felipe Mendes
--%>
<jsp:useBean id="menu" class="ecommerce.model.Menu"/> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Mobile Online - Bem Vindo!</title>
        <link rel="stylesheet" href="css/estilo.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/w3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
          <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"
    </head>
    <body>
        <!-- Navbar -->
        <%
            out.print(menu.MostrarMenu());
        %>

        <!-- Page content -->
        <div class="w3-content" style="max-width:1700px;margin-top:46px">

            <!-- Automatic Slideshow Images -->
            <div class="mySlides w3-display-container w3-center">
                <img src="img/Marcas-Celulares.jpg" style="width:70%">
                <div class="texto-banner">
                    <h1 class="nome-celular">MELHORES CELULARES!</h1>
                    <h1 class="descricao-celular">
                        SHOP MOBILE ONLINE<br>
                        O MELHOR DE TODOS<br>
                        
                    </h1>
                </div>
            </div>
            <div class="mySlides w3-display-container w3-center">
                <img src="img/moto-g4.jpg" style="width:40%">
                <div class="texto-banner">
                    <h1 class="nome-celular">Motorola Moto G4</h1>
                    <h1 class="descricao-celular">
                        CELULARES NOVOS E LANÇAMENTOS É SÓ AQUI!<br>
                        SHOP MOBILE ONLINE!<BR>
                        
                    </h1>
                </div>
            </div>
            <div class="mySlides w3-display-container w3-center">
                <img src="img/galaxy-j7.jpg" style="width:40%">
                <div class="texto-banner">
                    <h1 class="nome-celular">Samsung Galaxy J7</h1>
                    <h1 class="descricao-celular">
                        LANÇAMENTO E CELULARES NOVOS!<br>
                        SHOP MOBILE ONLINE!<br>
                        
                    </h1>
                </div>
            </div>

            <!-- The Band Section -->
            <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
                <h2 class="titulo-texto">Shop Mobile Online</h2>
                
            </div>

            <!-- Footer -->
            <footer class="w3-container w3-center w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
                <p class="w3-medium">Criador:<a href="/TrabalhoWeb/index.jsp" target="_blank">Shop Mobile Online</a></p>
            </footer>

            <script>
                // Automatic Slideshow - change image every 4 seconds
                var meuIndex = 0;
                carousel();

                function carousel() {
                    var i;
                    var x = document.getElementsByClassName("mySlides");
                    for (i = 0; i < x.length; i++) {
                        x[i].style.display = "none";
                    }
                    meuIndex++;
                    if (meuIndex > x.length) {
                        meuIndex = 1
                    }
                    x[meuIndex - 1].style.display = "block";
                    setTimeout(carousel, 8000);
                }

                // Used to toggle the menu on small screens when clicking on the menu button
                function myFunction() {
                    var x = document.getElementById("navDemo");
                    if (x.className.indexOf("w3-show") == -1) {
                        x.className += " w3-show";
                    } else {
                        x.className = x.className.replace(" w3-show", "");
                    }
                }

                // When the user clicks anywhere outside of the modal, close it
                var modal = document.getElementById('ticketModal');
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            </script>
    </body>
</html>
