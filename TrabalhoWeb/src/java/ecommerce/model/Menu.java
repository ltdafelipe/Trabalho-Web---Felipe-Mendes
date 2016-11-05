package ecommerce.model;

/**
 *
 * @author Felipe Mendes
 */
public class Menu {

    public String MostrarMenu() {
        String menu = "<ul id=\"dropdown1\" class=\"dropdown-content\">\n" +
"  <li><a href=\"/TrabalhoWeb/novo-produto.jsp\">Novo</a></li>\n" +
                "  <li class=\"divider\"></li>\n" +
"  <li><a href=\"/TrabalhoWeb/index-admin.jsp\">Alterar / Excluir</a></li>\n" +

"</ul>\n" +
"<nav class=\"blue\">\n" +
"  <div class=\"nav-wrapper\">\n" +
"    <a href=\"/TrabalhoWeb/index.jsp\" class=\"brand-logo\">Shop Mobile</a>\n" +
"    <ul class=\"right hide-on-med-and-down\">\n" +
"      <li><a href=\"/TrabalhoWeb/produtos.jsp\">Produtos</a></li>\n" +
"      <li><a href=\"ControleCarrinho?acao=visualizar\">Carrinho</a></li>\n" +
"      <!-- Dropdown Trigger -->\n" +
"      <li><a class=\"dropdown-button\" href=\"#!\" data-activates=\"dropdown1\">Administrador<i class=\"material-icons right\">arrow_drop_down</i></a></li>\n" +
"    </ul>\n" +
"  </div>\n"+
                "</nav>\n";

        return menu;
    }
}
