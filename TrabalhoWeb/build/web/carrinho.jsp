<%-- 
    Document   : carrinho
    Created on : 28/10/2016, 08:50:26
    Author     : Felipe Mendes
--%>

<%@page import="ecommerce.model.ItemDeCompra"%>
<%@page import="ecommerce.model.CarrinhoDeCompra"%>
<jsp:useBean id="menu" class="ecommerce.model.Menu"/>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <div class="w3-content" >
            <h1>Carrinho de Compras!</h1>
            <table class="bordered" border="1" cellpadding="2" >
                <tr>
                    <td class="center">Remover</td>
                   <td class="center">Item</td>
                    <td class="center">Quantidade</td>
                   <td class="center">Preço Unitário</td>
                    <td class="center">Total Item</td>
                    <td class="center">Adicionar</td>
                </tr>
                <%
                    //recupera os produtos do carrinho da sessao
                    CarrinhoDeCompra carrinho = (CarrinhoDeCompra) session.getAttribute("carrinho");
                    for (ItemDeCompra item : carrinho.getItens()) {
                %>
                <tr>
                    <td class="center"><a 
                            href="ControleCarrinho?acao=removeProduto&idProduto=<%=item.getProduto().getId()%>">
                            <i class="material-icons center">delete</i></td>
                    <td class="center"><%=item.getProduto().getNome()%></td>
                    <td class="center"><%=item.getQuantidade()%></td>
                    <td class="center"><%=item.getProduto().getPrecoUnitario()%></td>
                    <td class="center"><%=item.getTotal()%></td>
                    <td class="center"><a 
                            href="ControleCarrinho?acao=addProduto&idProduto=<%=item.getProduto().getId()%>">
                            <i class="material-icons center">library_add</i></a
                        ></td>
                </tr>
                <%
                    }
                %>
            </table>
            <strong>Valor Total: <%=carrinho.calculaTotal()%></strong><br/>
             <a class="btn waves-effect waves-light" href="ControleCarrinho?acao=finalizarCompra"><i class="material-icons right">done</i>Finalizar compra</a>
          
          <a class="btn waves-effect waves-light" href="produtos.jsp"><i class="material-icons right">shopping_cart</i>Continuar Compra</a>
           
            <a class="btn waves-effect waves-light" href="ControleCarrinho?acao=cancelaCompra"><i class="material-icons right">view_headline</i>Cancelar Compra</a>

      
        </div>
    </body>
</html>