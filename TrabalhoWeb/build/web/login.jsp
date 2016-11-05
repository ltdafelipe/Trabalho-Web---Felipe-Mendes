<%-- 
    Document   : login
    Created on : 27/10/2016, 14:30:59
    Author     : Felipe Mendes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela Login</title>
        <script type="text/javascript" src="js/lib/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/meu-estilo.css">
        <link rel="stylesheet" href="css/cor-fundo.css">
    </head>
   
    <body>
        
        <div class="container">
            <div class="fundo-login">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Login Obrigatório</h1>
                    <div class="account-wall">
                        <img class="profile-img" src="img/img-login.png"
                             alt="">
                        <form class="form-signin" action="LoginServlet" method="POST">
                            <input type="text" class="form-control" placeholder="Usuário" name="usuario" required autofocus>
                            <input type="password" class="form-control" placeholder="Senha" name="senha" required>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">
                                Acessar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </body>
</html>
