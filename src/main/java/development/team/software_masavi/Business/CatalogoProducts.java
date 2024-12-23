package development.team.software_masavi.Business;

import development.team.software_masavi.Model.Product;
import development.team.software_masavi.Services.DataBaseUtil;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CatalogoProducts {
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<Product>();

        //por el momento se trabajaran Strings de consulta
        DataSource dataSource = DataBaseUtil.getDataSource();
        Connection cnn = null;
        String sql = "SELECT * FROM productos";

        try {
            cnn = dataSource.getConnection();
            ResultSet rst = cnn.createStatement().executeQuery(sql);
            while (rst.next()) {
                String name = rst.getString("nombre_producto");
                String description = rst.getString("descripcion");
                Double price = rst.getDouble("precio");

                Product product = new Product(name,description,price);
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }
}
