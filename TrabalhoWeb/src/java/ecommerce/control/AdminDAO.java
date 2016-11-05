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
public class AdminDAO {
    
    public static void ExcluirProduto(int id) {

        String sql = "DELETE FROM produto WHERE id_prod = ?";

        try {
            PreparedStatement preparadorSQL = Mysql.getConexaoMySQL().prepareStatement(sql);
            preparadorSQL.setInt(1, id);
            preparadorSQL.execute();
            preparadorSQL.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void AlterarProduto(String nome, String descricao, double precoUnitario, int id) {

        String sql = "UPDATE produto SET nome = ?, descricao = ?, precoUnitario = ? WHERE id_prod = ?";

        try {
            PreparedStatement preparadorSQL = Mysql.getConexaoMySQL().prepareStatement(sql);
            preparadorSQL.setString(1, nome);
            preparadorSQL.setString(2, descricao);
            preparadorSQL.setDouble(3, precoUnitario);
            preparadorSQL.setInt(4, id);
            preparadorSQL.execute();
            preparadorSQL.close();
        } catch (SQLException e) {
            System.out.println(e);
            e.printStackTrace();
        }
    }
    
    public static void CadastrarProduto(String idProduto, String nome, String descricao, double precoUnitario) {

        String sql = "insert into produto (id_prod, nome, descricao, precoUnitario) values (?, ?, ?, ?)";

        try {
            PreparedStatement preparadorSQL = Mysql.getConexaoMySQL().prepareStatement(sql);
            preparadorSQL.setString(1, idProduto);
            preparadorSQL.setString(2, nome);
            preparadorSQL.setString(3, descricao);
            preparadorSQL.setDouble(4, precoUnitario);
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
