package ecommerce.servlets;

import ecommerce.control.LoginController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Felipe Mendes
 */
public class LoginServlet extends HttpServlet {
 public static boolean test = false;
    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        LoginController LoginContr = new LoginController();
        
        String user = request.getParameter("usuario");
        String password = request.getParameter("senha");

        if (LoginContr.login(user, password)) {
            response.addCookie(LoginContr.getCookie("user", user));
            response.addCookie(LoginContr.getCookie("password", password));
            response.addCookie(LoginContr.getCookie("type", LoginContr.getType()));

            if(LoginContr.getType().equals("a")){
                response.sendRedirect("index-admin.jsp");
            }else{
                response.sendRedirect("produtos.jsp");
            }
        } else {
            test = true;
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short Description";
    }

    public static boolean returnTest() {
        return test;
    }
}
