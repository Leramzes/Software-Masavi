package development.team.software_masavi.Model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> cartItems;

    public Cart() {
        this.cartItems = new ArrayList<>();
    }

    // Agregar producto al carrito
    public void addToCart(Product product, int quantity) {
        if (product == null || quantity <= 0) {
            throw new IllegalArgumentException("El producto no puede ser nulo y la cantidad debe ser mayor a cero.");
        }

        for (CartItem cartItem : cartItems) {
            if (cartItem.getProduct().getId() == product.getId()) {
                cartItem.setQuantity(cartItem.getQuantity() + quantity);
                System.out.println("Producto existente, cantidad actualizada.");
                return;
            }
        }

        cartItems.add(new CartItem(product, quantity));
        System.out.println("Producto añadido al carrito.");
    }

    // Eliminar producto del carrito
    public void removeItem(Product product) {
        if (product == null) {
            throw new IllegalArgumentException("El producto no puede ser nulo.");
        }

        boolean removed = cartItems.removeIf(item -> item.getProduct().getId() == product.getId());

        if (removed) {
            System.out.println("Producto eliminado del carrito.");
        } else {
            System.out.println("El producto no se encuentra en el carrito.");
        }
    }

    // Actualizar cantidad de un producto en el carrito
    public void updateItemQuantity(Product product, int quantity) {
        if (product == null || quantity < 1) {
            throw new IllegalArgumentException("El producto no puede ser nulo y la cantidad debe ser mayor o igual a 1.");
        }

        for (CartItem item : cartItems) {
            if (item.getProduct().getId() == product.getId()) {
                item.setQuantity(quantity);
                System.out.println("Cantidad actualizada.");
                return;
            }
        }

        System.out.println("El producto no está en el carrito.");
    }

    // Obtener lista de ítems en el carrito
    public List<CartItem> getCartItems() {
        return cartItems;
    }

    // Obtener el total del carrito
    public double getTotal() {
        return cartItems.stream()
                .mapToDouble(CartItem::getSubtotal)
                .sum();
    }

    // Imprimir detalles del carrito
    public void printCartDetails() {
        if (cartItems.isEmpty()) {
            System.out.println("El carrito está vacío.");
            return;
        }

        System.out.println("Detalles del carrito:");
        for (CartItem item : cartItems) {
            System.out.println(item);
        }
        System.out.println("Total: S/ " + getTotal());
    }
}
