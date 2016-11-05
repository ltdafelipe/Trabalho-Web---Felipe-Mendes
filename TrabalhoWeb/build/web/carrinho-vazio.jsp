<%-- 
    Document   : carrinho-vazio
    Created on : 28/10/2016, 09:18:30
    Author     : Felipe Mendes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="menu" class="ecommerce.model.Menu"/>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho de Compras</title>
        <link rel="stylesheet" href="css/w3.css">
        <link rel="stylesheet" href="css/meu-estilo.css">
        
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
        
        <div class="w3-content" style="margin-left: 25%; margin-top:46px">
            <h1>Carrinho de Compras!</h1>
            <table class="bordered" >
                <tr>
                    <td class="center">Remover</td>
                    <td class="center">Item</td>
                    <td class="center">Quantidade</td>
                    <td class="center">Preço Unitário</td>
                    <td class="center">Total Item</td>
                    <td class="center">Adicionar</td>
                </tr>
                
            </table>
            <strong>Valor Total: 0.00</strong><br/>
       
     
        <a class="btn waves-effect waves-light" href="ControleCarrinho?acao=finalizarCompra"><i class="material-icons right">done</i>Finalizar compra</a>

     
        <a class="btn waves-effect waves-light" href="produtos.jsp"><i class="material-icons right">shopping_cart</i>Continuar Comprando</a>
        
        <a class="btn waves-effect waves-light" href="ControleCarrinho?acao=cancelaCompra"><i class="material-icons right">view_headline</i>Cancelar Compra</a>
      
         
        </div>
    </body>
</html>
