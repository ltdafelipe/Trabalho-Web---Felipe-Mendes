<%-- 
    Document   : produtos
    Created on : 28/10/2016, 16:00:45
    Author     : Felipe Mendes
--%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.model.Produto"%>
<%@page import="ecommerce.control.ProdutoDAO"%>
<jsp:useBean id="menu" class="ecommerce.model.Menu"/> 
<%@ page import="ecommerce.control.LoginController" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos</title>
        <link rel="stylesheet" href="css/meu-estilo.css">
        <link rel="stylesheet" href="css/w3.css">
    
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

        <div class="w3-content " style="max-width:2000px;margin-top:46px">
            <h1 class="w3-center texto-banner">Produtos!</h1>
            <div class="container">
                <table class="bordered">
                    <tr>
                        <th class="center">Codigo</th>
                        <th class="center">Produto</th>
                        <th class="center">Descrição</th>
                        <th class="center">Valor Unitario</th>
                        <th class="center">Comprar</th>
                    </tr>
                    <%
                        List<Produto> produtos = ProdutoDAO.MostrarProdutos();
                        for (int i = 0; i < produtos.size(); i++) {
                    %>
                    <tr>
                        <td class="center"><%out.print(produtos.get(i).getId());%></td>
                         <td class="center"><% out.print(produtos.get(i).getNome());%></td>
                        <td class="center"><% out.print(produtos.get(i).getDescricao());%></td>
                        <td class="center"><% out.print(produtos.get(i).getPrecoUnitario());%></td>
                        <td class="center"><a class="center" href="ControleCarrinho?acao=addProduto&idProduto=<%=produtos.get(i).getId()%>"><i class="material-icons center">shopping_cart</i>
                                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></a></td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>
    </body>
</html>
