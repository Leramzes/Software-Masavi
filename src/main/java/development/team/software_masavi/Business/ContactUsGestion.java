package development.team.software_masavi.Business;

import development.team.software_masavi.Model.Product;
import development.team.software_masavi.Services.DataBaseUtil;

import javax.sql.DataSource;
import java.sql.*;

public class ContactUsGestion {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();

    public static void registerContact(String fullName, String email, String phone, String message) throws SQLException {
        String sql = "INSERT INTO Contactos (nombre_completo, email, telefono, mensaje) VALUES (?, ?, ?, ?)";
        try (Connection cnn = dataSource.getConnection()) {
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, message);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Contacto registrado");
            }
        } catch (SQLException e) {
            throw new SQLException("Error al registrar el contacto: " + e.getMessage(), e);
        }
    }
}
