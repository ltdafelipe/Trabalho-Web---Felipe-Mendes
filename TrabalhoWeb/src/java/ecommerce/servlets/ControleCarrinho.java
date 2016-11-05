package ecommerce.servlets;

import ecommerce.model.CarrinhoDeCompra;
import ecommerce.model.ItemDeCompra;
import ecommerce.model.Produto;
import ecommerce.control.ProdutoDAO;
import ecommerce.control.VendaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Felipe Mendes
 */

public class ControleCarrinho extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String acao = request.getParameter("acao");
            if (acao.equals("addProduto")) {
                int idProduto = Integer.parseInt(request.getParameter("idProduto"));
                boolean existe = false;
                HttpSession sessao = request.getSession();
                CarrinhoDeCompra carrinho = (CarrinhoDeCompra) sessao.getAttribute("carrinho");
                if (carrinho == null) {
                    carrinho = new CarrinhoDeCompra();
                    sessao.setAttribute("carrinho", carrinho);
                }
                if (carrinho.getItens() != null) {
                    for (ItemDeCompra item : carrinho.getItens()) {
                        if (item.getProduto().getId() == idProduto) {
                            item.setQuantidade(item.getQuantidade() + 1);
                            existe = true;
                        }
                    }
                }
                if (existe == false) {
                    Produto produto = new ProdutoDAO().consultarPorId(idProduto);
                    ItemDeCompra novoItem = new ItemDeCompra();
                    novoItem.setProduto(produto);
                    novoItem.setQuantidade(1);
                    carrinho.addNovoItem(novoItem);
                }
                request.getRequestDispatcher("carrinho.jsp").forward(request, response);
            }
            else if (acao.equals("removeProduto")) {
                HttpSession sessao = request.getSession();
                CarrinhoDeCompra carrinho = (CarrinhoDeCompra) sessao.getAttribute("carrinho");
                int idProduto = Integer.parseInt(request.getParameter("idProduto"));
                ItemDeCompra itemRemove = new ItemDeCompra();
                Produto prodRemove = new Produto();
                prodRemove.setId(idProduto);
                itemRemove.setProduto(prodRemove);
                carrinho.removerItem(itemRemove);
                request.getRequestDispatcher("carrinho.jsp").forward(request, response);
            } else if (acao.equals("cancelaCompra")) {
                HttpSession sessao = request.getSession();
                sessao.removeAttribute("carrinho");
                response.sendRedirect("produtos.jsp");
            } else if (acao.equals("finalizarCompra")) {
                HttpSession sessao = request.getSession();
                CarrinhoDeCompra carrinho = (CarrinhoDeCompra) sessao.getAttribute("carrinho");
                String cdVenda = VendaDAO.UltimaSequencia("venda", "idVenda");
                for (ItemDeCompra item : carrinho.getItens()) {
                    VendaDAO.Cadastrar(cdVenda, item.getProduto().getId(), item.getQuantidade(), item.getTotal());
                }
                response.sendRedirect("ControleCarrinho?acao=cancelaCompra");
            } else if (acao.equals("visualizar")) {
                HttpSession sessao = request.getSession();
                CarrinhoDeCompra carrinho = (CarrinhoDeCompra) sessao.getAttribute("carrinho");
                if (carrinho == null) {
                    request.getRequestDispatcher("carrinho-vazio.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("carrinho.jsp").forward(request, response);
                }
                
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
