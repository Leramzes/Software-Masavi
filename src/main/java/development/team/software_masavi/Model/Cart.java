package development.team.software_masavi.Model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> cartItems;

    public Cart() {
        this.cartItems = new ArrayList<>();
    }

    //AGREGAR
    public void addItem(Product product, int quantity) {
        // Verificar si el producto ya existe en el carrito
        for (CartItem item : cartItems) {
            if (item.getProduct().equals(product)) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        // Si no existe, agregar un nuevo CartItem
        cartItems.add(new CartItem(product, quantity));
    }

    public void removeItem(Product product) {
        cartItems.removeIf(item -> item.getProduct().equals(product));
    }

    public void updateItemQuantity(Product product, int quantity) {
        for (CartItem item : cartItems) {
            if (item.getProduct().equals(product)) {
                item.setQuantity(quantity);
                break;
            }
        }
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public double getTotal() {
        double total = 0.0;
        for (CartItem item : cartItems) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }
        return total;
    }
}

