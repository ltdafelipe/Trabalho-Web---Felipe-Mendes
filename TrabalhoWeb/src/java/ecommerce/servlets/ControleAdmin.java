package ecommerce.servlets;

import ecommerce.model.Produto;
import ecommerce.control.AdminDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Felipe Mendes
 */
public class ControleAdmin extends HttpServlet {

    private Produto produto = new Produto();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String acao = request.getParameter("acao");
            if (acao.equals("excluir")) {
                int idProduto = Integer.parseInt(request.getParameter("idProduto"));
                AdminDAO.ExcluirProduto(idProduto);
                response.sendRedirect("/TrabalhoWeb/index-admin.jsp");
            } else if (acao.equals("alterar")) {
                int id = Integer.parseInt(request.getParameter("idProduto"));
                produto.setId(id);
                response.sendRedirect("/TrabalhoWeb/alterar-produto.jsp");
            }
        } catch (Exception erro) {
            request.setAttribute("erro", erro);
            request.getRequestDispatcher("erro.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        produto.setNome(request.getParameter("nome"));
        produto.setDescricao(request.getParameter("descricao"));
        produto.setPrecoUnitario(Double.parseDouble(request.getParameter("precoUnitario")));

        String cdProduto = AdminDAO.UltimaSequencia("produto", "id_prod");
        AdminDAO.CadastrarProduto(cdProduto, produto.getNome(), produto.getDescricao(), produto.getPrecoUnitario());
        response.sendRedirect("/TrabalhoWeb/novo-produto.jsp");
    }
}