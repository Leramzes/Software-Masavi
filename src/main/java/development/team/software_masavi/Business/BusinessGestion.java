package development.team.software_masavi.Business;

import development.team.software_masavi.Model.Business;
import development.team.software_masavi.Model.Product;
import development.team.software_masavi.Services.DataBaseUtil;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BusinessGestion {
    private static DataSource dataSource = DataBaseUtil.getDataSource();


    public static Business getBusinessInfo() {
        String sql = "SELECT * FROM Empresa LIMIT 1";
        Business business = null;
        try (Connection cnn = dataSource.getConnection();
            Statement stmt = cnn.createStatement();
            ResultSet rst = stmt.executeQuery(sql)) {

                if (rst.next()) {
                    int id = rst.getInt(1);
                    String name = rst.getString(2);
                    String ruc = rst.getString(3);
                    String direccion = rst.getString(4);
                    String phone = rst.getString(5);
                    String email = rst.getString(6);
                    String logo = rst.getString(7);

                    business = new Business(id, name, ruc, direccion, phone, email, logo);

                }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return business;
    }
}
