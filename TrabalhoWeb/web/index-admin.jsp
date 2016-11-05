<%-- 
    Document   : index-admin
    Created on : 27/10/2016, 22:39:49
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
        <title>Bem vindo - Admin!</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/w3.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"
       
       
    </head>
    <body>
        <!-- Navbar -->
        <%
            out.print(menu.MostrarMenu());
            
        %>
        
        <div class="w3-content " style="max-width:2000px;margin-top:46px">
            <h1 class="w3-center texto-banner">Produtos cadastrados!</h1>
            <div class="container">
                <table class="bordered">
                    <tr>
        <th><center>Codigo</center></th>
        <th><center>Produto</center></th>
        <th><center>Descrição</center></th>
        <th><center>Valor Unitario</center></th>
        <th><center>Editar</center></th>
        <th><center>Excluir</center></th>
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
                        <td class="center"><a style="text-decoration:none" href="AlterarProduto?acao=alterar&idProduto=<%=produtos.get(i).getId()%>">
                                <i class="material-icons center-align" >mode_edit</i></a></td>
                                <td class="center"><a style="text-decoration:none" href="ControleAdmin?acao=excluir&idProduto=<%=produtos.get(i).getId()%>">
                                <i class="material-icons" >delete</i></a></td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>
    </body>
</html>
