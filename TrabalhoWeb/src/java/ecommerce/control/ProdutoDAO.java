package ecommerce.control;


import ecommerce.connection.Mysql;
import ecommerce.model.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Felipe Mendes
 */
public class ProdutoDAO {

    private static final String SELECTALL = "select * from produto order by id_prod asc";
    private static final String SELECTID = "select * from produto where id_prod = ? order by id_prod asc";
    
    public static List<Produto> MostrarProdutos() {

        List<Produto> produtos = new ArrayList<Produto>();
        try {
            Connection conexao = Mysql.getConexaoMySQL();
            PreparedStatement pstmt = conexao.prepareStatement(SELECTALL);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Produto prod = new Produto();
                prod.setId(rs.getInt("id_prod"));
                prod.setNome(rs.getString("nome"));
                prod.setDescricao(rs.getString("descricao"));
                prod.setPrecoUnitario(rs.getDouble("precoUnitario"));
                produtos.add(prod);;
            }
            Mysql.FecharConexao();
            return produtos;

        } catch (SQLException ex) {
        }
        return null;

    }

    public static ArrayList<Produto> listar() {
        Connection conexao = null;
        ArrayList<Produto> listaProduto = new ArrayList<Produto>();
        try {
            conexao = Mysql.getConexaoMySQL();
            PreparedStatement pstmt = conexao.prepareStatement(SELECTALL);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Produto prod = new Produto();
                prod.setId(rs.getInt("id_prod"));
                prod.setNome(rs.getString("nome"));
                prod.setDescricao(rs.getString("descricao"));
                prod.setPrecoUnitario(rs.getDouble("precoUnitario"));
                listaProduto.add(prod);
            }
        } catch (SQLException ex1) {
            throw new RuntimeException(ex1);
        } finally {
            try {
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException ex1) {
                throw new RuntimeException(ex1);
            }
        }
        return listaProduto;
    }

    public Produto consultarPorId(int id) {
        Connection conexao = null;
        Produto produto = new Produto();
        try {
            conexao = Mysql.getConexaoMySQL();
            PreparedStatement pstmt = conexao.prepareStatement(SELECTID);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                produto.setId(rs.getInt("id_prod"));
                produto.setNome(rs.getString("nome"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPrecoUnitario(rs.getDouble("precoUnitario"));
            }
        } catch (SQLException ex1) {
            throw new RuntimeException(ex1);
        } finally {
            try {
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException ex2) {
                throw new RuntimeException(ex2);
            }
        }
        return produto;
    }
    
    public void cadastrar(Produto produto) { 

        String sql = "insert into produto (nome, valor, descricao) values (?,?,?)";

        try {
            PreparedStatement preparadorSQL = Mysql.getConexaoMySQL().prepareStatement(sql);
            preparadorSQL.setString(1, produto.getNome());
            preparadorSQL.setDouble(2, produto.getPrecoUnitario());
            preparadorSQL.setString(3, produto.getDescricao());
            preparadorSQL.execute();
            preparadorSQL.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
