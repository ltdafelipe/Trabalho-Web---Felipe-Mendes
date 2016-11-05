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
        <div class="container" style="max-width:1700px;margin-top:46px">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h4 class="center-align ">Insira os campos com as alterações</h4>
                    <div class="span6">
                        <form class="form-signin" action="AlterarProduto" method="POST">
                            <input type="text" class="form-control" placeholder="Nome Produto" name="nome" required autofocus>
                            <input type="text" class="form-control" placeholder="Descrição" name="descricao" required>
                            <input type="number" class="form-control" placeholder="Preço Unitario" name="precoUnitario" required>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Alterar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>