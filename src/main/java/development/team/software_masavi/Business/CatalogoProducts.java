package development.team.software_masavi.Business;

import development.team.software_masavi.Model.Product;
import development.team.software_masavi.Services.DataBaseUtil;

import javax.sql.DataSource;
import java.sql.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

public class CatalogoProducts {

    private static DataSource dataSource = DataBaseUtil.getDataSource();

    // Caché para productos
    private static final Map<String, Product> productCache = new ConcurrentHashMap<>();
    private static List<Product> allProductsCache = null;
    private static long allProductsCacheTimestamp = 0;
    private static final long CACHE_DURATION = 300000; // 5 minutos

    public static List<Product> getAllProducts() {
        long currentTime = System.currentTimeMillis();
        if (allProductsCache != null && (currentTime - allProductsCacheTimestamp) < CACHE_DURATION) {
            System.out.println("Productos obtenidos desde caché.");
            return new ArrayList<>(allProductsCache);
        }

        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Productos";

        try (Connection cnn = dataSource.getConnection();
             Statement stmt = cnn.createStatement();
             ResultSet rst = stmt.executeQuery(sql)) {

            while (rst.next()) {
                int id = rst.getInt("producto_id");
                String name = rst.getString("nombre_producto");
                String description = rst.getString("descripcion");
                Double price = rst.getDouble("precio");
                int quantity = rst.getInt("cantidad_disponible");
                String image = rst.getString("ruta_imagen");

                Product product = new Product(id, name, description, price, quantity, image);
                products.add(product);

                // Agregar producto al caché
                productCache.put(String.valueOf(id), product);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener productos: " + e.getMessage(), e);
        }

        // Actualizar caché
        allProductsCache = products;
        allProductsCacheTimestamp = currentTime;

        return products;
    }

    public Product getProductById(String productId) {
        if (productId == null || productId.isEmpty()) {
            System.err.println("El ID del producto es nulo o vacío.");
            return null;
        }

        // Buscar en caché
        if (productCache.containsKey(productId)) {
            System.out.println("Producto obtenido desde caché.");
            return productCache.get(productId);
        }

        String sql = "SELECT * FROM Productos WHERE producto_id = ?";
        Product product = null;

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, productId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new Product(
                            rs.getInt("producto_id"),
                            rs.getString("nombre_producto"),
                            rs.getString("descripcion"),
                            rs.getDouble("precio"),
                            rs.getInt("cantidad_disponible"),
                            rs.getString("ruta_imagen")
                    );

                    // Agregar producto al caché
                    productCache.put(productId, product);
                    System.out.println("Producto encontrado y agregado al caché.");
                } else {
                    System.err.println("No se encontró el producto con ID: " + productId);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener el producto: " + e.getMessage());
        }

        return product;
    }

    public List<String> getCategoryProducts() {
        List<String> categoryProducts = new ArrayList<>();
        String sql = "SELECT DISTINCT categoria FROM Productos";

        try (Connection cnn = dataSource.getConnection();
             Statement stmt = cnn.createStatement();
             ResultSet rst = stmt.executeQuery(sql)) {

            while (rst.next()) {
                String categoria = rst.getString("categoria");
                categoryProducts.add(categoria);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener categorías: " + e.getMessage(), e);
        }

        return categoryProducts;
    }

    public static List<Product> filterProducts(String nombre) {
        if (nombre == null || nombre.isEmpty()) {
            return getAllProducts(); // Devuelve todos los productos si no hay búsqueda.
        }

        return getAllProducts().stream()
                .filter(product -> product.getName().toLowerCase().contains(nombre.toLowerCase()))
                .collect(Collectors.toList());
    }
}
