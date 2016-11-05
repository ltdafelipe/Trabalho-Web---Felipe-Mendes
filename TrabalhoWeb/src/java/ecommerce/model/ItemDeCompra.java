package ecommerce.model;

/**
 *
 * @author Felipe Mendes
 */
public class ItemDeCompra {
    private Integer id;
    private Produto produto;
    private int quantidade;
    private double total;
    
    public Integer getId(){
        return id;
    }
    
    public Produto getProduto(){
        return produto;
    }
    
    public void setProduto(Produto produto){
        this.produto = produto;
    }
    
    public int getQuantidade(){
        return quantidade;
    }
    
    public void setQuantidade(int quantidade){
        this.quantidade = quantidade;
    }
    
    public double getTotal(){
        this.total = this.quantidade * this.produto.getPrecoUnitario();
        return total;
    }
}
