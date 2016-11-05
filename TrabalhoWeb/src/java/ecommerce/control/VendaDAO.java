package ecommerce.control;

import ecommerce.connection.Mysql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Felipe Mendes
 */
public class VendaDAO {
    
    public static void Cadastrar(String venda, Integer idProduto, int quantidade, double total) {

        String sql = "insert into venda (idVenda, id_prod, qtde, valorTotal) values (?, ?, ?, ?)";

        try {
            PreparedStatement preparadorSQL = Mysql.getConexaoMySQL().prepareStatement(sql);
            preparadorSQL.setString(1, venda);
            preparadorSQL.setInt(2, idProduto);
            preparadorSQL.setInt(3, quantidade);
            preparadorSQL.setDouble(4, total);
            preparadorSQL.execute();
            preparadorSQL.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static String UltimaSequencia(String tabela, String atributo) {
        
        String sql = "SELECT COALESCE(MAX( " + atributo+" + 1),0) AS ULTIMO FROM " +tabela;
        String ultimo = "";
        
        Connection conexao = null;
        try {
            conexao = Mysql.getConexaoMySQL();
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ultimo = rs.getString("ULTIMO");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ultimo;
    }
}
