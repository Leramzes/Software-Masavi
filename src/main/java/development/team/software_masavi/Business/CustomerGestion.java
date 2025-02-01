package development.team.software_masavi.Business;

import development.team.software_masavi.Model.Client;
import development.team.software_masavi.Model.Customer;
import development.team.software_masavi.Model.Usuario;
import development.team.software_masavi.Services.DataBaseUtil;

import javax.sql.DataSource;
import java.sql.*;

public class CustomerGestion {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();

    public static void registerClient(Client client) {
        String sql = "INSERT INTO Clientes (nombre, apellido, usuario_id) VALUES (?, ?, ?)";

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, client.getNombre());
            ps.setString(2, client.getApellido());
            ps.setInt(3, client.getUsuarioId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cliente registrado");
            }
        } catch (SQLException e) {
            System.err.println("Error al registrar el cliente: " + e.getMessage());
        }
    }
    public static Customer getClient(Usuario usuario) {
        String sql = "SELECT * FROM Clientes WHERE usuario_id = ?";
        Customer customer = null;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setInt(1, usuario.getId());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("cliente_id"));
                customer.setName(rs.getString("nombre"));
                customer.setLastname(rs.getString("apellido"));
            }

        } catch (SQLException e) {
            System.err.println("Error al obtener el cliente: " + e.getMessage());
        }
        return customer;
    }
}

