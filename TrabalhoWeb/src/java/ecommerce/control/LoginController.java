package ecommerce.control;

import ecommerce.connection.Mysql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Felipe Mendes
 */
public class LoginController extends Mysql {
      private static String type;

    public String getType() {
        return type;
    }

    public static void setType(String typ) {
        type = typ;
    } 

    public static Boolean login(String usuario, String senha) {
        return (usuario != null && senha != null && LoginController.existe(usuario, senha));
    }

    public static Cookie getCookie(String nome, String valor) {
        Cookie cookie = new Cookie(nome, valor);
        return cookie;
    }

    public static Boolean estaLogado(HttpServletRequest request,  String type) {
         Cookie[] cookies = request.getCookies();
         String name = cookies[1].getName();
         String senha = cookies[2].getName();
         String tipo = cookies[3].getValue();
         
        return (name.equals("user") && senha.equals("password") && tipo.equalsIgnoreCase(type));
      
    }

    public static Boolean existe(String usuario, String senha) {
        try {
            String usuarioBd = null;
            String senhaBd = null;

            Connection con = Mysql.getConexaoMySQL();

            PreparedStatement stmt = con.prepareStatement("SELECT * FROM user WHERE nome_usuario = ? AND senha = ? ");
            stmt.setString(1, usuario);
            stmt.setString(2, senha);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                usuarioBd = rs.getString("nome_usuario");
                senhaBd = rs.getString("senha");
                setType(rs.getString("tipo"));
            }
            Mysql.FecharConexao();
            return (usuario.equals(usuarioBd) && senha.equals(senhaBd));
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }
}
