<%-- 
    Document   : erro
    Created on : 26/10/2016, 20:05:17
    Author     : Felipe Mendes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro!</title>
    </head>
    <%
        Exception erro = (Exception) request.getAttribute("erro");
    %>
    <body>
        <h1>erro! <%=erro%></h1>
    </body>
</html>