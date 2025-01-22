package development.team.software_masavi.Model;

public class CartItem {
    private Product product;
    private int quantity;

    public CartItem(Product product, int quantity) {
        if (quantity < 1) {
            throw new IllegalArgumentException("La cantidad debe ser al menos 1.");
        }
        this.product = product;
        this.quantity = quantity;
    }

    // Getters y Setters
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        if (product == null) {
            throw new IllegalArgumentException("El producto no puede ser nulo.");
        }
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        if (quantity < 1) {
            throw new IllegalArgumentException("La cantidad debe ser al menos 1.");
        }
        this.quantity = quantity;
    }

    // Calcular subtotal
    public double getSubtotal() {
        return product.getPrice() * quantity;
    }

    // Representación del objeto como texto
    @Override
    public String toString() {
        return quantity + "x " + product.getName() + " (S/ " + product.getPrice() + " c/u) --> S/ " + getSubtotal();
    }
}
