<%-- 
    Document   : novo-produto
    Created on : 30/10/2016, 12:48:22
    Author     : Felipe Mendes
--%>
<jsp:useBean id="menu" class="ecommerce.model.Menu"/> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="ecommerce.control.LoginController" %>

<% if (LoginController.estaLogado(request)) { %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Produto</title>
   
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
      
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <script type="text/javascript" src="js/materialize.min.js"></script>
         <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar -->
        <%
            out.print(menu.MostrarMenu());
        %>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Cadastrar Produto!</h1>
                    <div class="span6">
                        <form class="form-signin" action="ControleAdmin" method="POST">
                            <input type="text" class="form-control" placeholder="Nome Produto" name="nome" required autofocus>
                            <input type="text" class="form-control" placeholder="Descrição" name="descricao" required>
                            <input type="number" class="form-control" placeholder="Preço Unitario" name="precoUnitario" required>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<% } else {
        response.sendRedirect("/TrabalhoWeb/login.jsp");
    }
%>
