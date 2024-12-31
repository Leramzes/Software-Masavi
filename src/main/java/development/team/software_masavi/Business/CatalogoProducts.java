package development.team.software_masavi.Business;

import development.team.software_masavi.Model.Product;
import development.team.software_masavi.Services.DataBaseUtil;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class CatalogoProducts {
    public static List<Product> getAllProducts() {
        List<Product> products = new ArrayList<Product>();

        //por el momento se trabajaran Strings de consulta
        DataSource dataSource = DataBaseUtil.getDataSource();
        Connection cnn = null;
        String sql = "SELECT * FROM Productos";

        try {
            cnn = dataSource.getConnection();
            ResultSet rst = cnn.createStatement().executeQuery(sql);
            while (rst.next()) {
                String name = rst.getString("nombre_producto");
                String description = rst.getString("descripcion");
                Double price = rst.getDouble("precio");
                int quantity = rst.getInt("cantidad_disponible");
                String image = rst.getString("ruta_imagen");

                Product product = new Product(name,description,price,quantity,image);
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public List<String> getCategoryProducts() {
        List<String> categoryProducts = new ArrayList<String>();

        //por el momento se trabajaran Strings de consulta
        DataSource dataSource = DataBaseUtil.getDataSource();
        Connection cnn = null;
        String sql = "SELECT DISTINCT categoria FROM Productos";

        try {
            cnn = dataSource.getConnection();
            ResultSet rst = cnn.createStatement().executeQuery(sql);
            while (rst.next()) {
                String categoria = rst.getString("categoria");

                categoryProducts.add(categoria);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
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
