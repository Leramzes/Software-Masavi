package development.team.software_masavi.Business;

import development.team.software_masavi.Model.Contact;
import development.team.software_masavi.Model.Product;
import development.team.software_masavi.Services.DataBaseUtil;

import javax.sql.DataSource;
import java.sql.*;

public class ContactUsGestion {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();

    public static void registerContact(Contact contact) throws SQLException {
        String sql = "INSERT INTO Contactos (nombre_completo, email, telefono, mensaje) VALUES (?, ?, ?, ?)";
        try (Connection cnn = dataSource.getConnection()) {
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, contact.getFullName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getPhone());
            ps.setString(4, contact.getMessage());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Contacto registrado");
            }
        } catch (SQLException e) {
            throw new SQLException("Error al registrar el contacto: " + e.getMessage(), e);
        }
    }
}
