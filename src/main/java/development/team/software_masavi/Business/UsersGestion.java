package development.team.software_masavi.Business;

import development.team.software_masavi.Model.Business;
import development.team.software_masavi.Model.Customer;
import development.team.software_masavi.Model.Usuario;
import development.team.software_masavi.Services.DataBaseUtil;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

public class UsersGestion {

    private static final DataSource dataSource = DataBaseUtil.getDataSource();

    //Variables para usar en los DAO, referenciadas con los nombres en la BD
    String COLUMN_ID = "usuario_id";
    String COLUMN_EMAIL = "email";
    String COLUMN_CONTRASENA = "contraseña";
    String COLUMN_TELEFONO = "telefono";
    String COLUMN_DIRECCION = "direccion";
    String COLUMN_TIPO_USUARIO = "tipo_usuario";

    public Usuario obtenerUsuarioSesion(String userEmail) {
        Usuario user = null;
        String sql = "SELECT * FROM Usuarios WHERE " + COLUMN_EMAIL + " = ?";

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, userEmail);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new Usuario(
                            rs.getInt(COLUMN_ID),
                            rs.getString(COLUMN_EMAIL),
                            null, // Contraseña no es necesario en esta sección
                            rs.getString(COLUMN_TELEFONO),
                            rs.getString(COLUMN_DIRECCION),
                            rs.getString(COLUMN_TIPO_USUARIO)
                    );
                    System.out.println("se valido el usuario: "+user.getEmail());
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener el usuario: " + e.getMessage());
        }
        return user;
    }

    public int obtenerRolTipo(String userEmail) {
        String sql = "SELECT " + COLUMN_TIPO_USUARIO + " FROM Usuarios WHERE " + COLUMN_EMAIL + " = ?";
        int tipoUsuario = 0;

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, userEmail);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    tipoUsuario = rs.getInt(COLUMN_TIPO_USUARIO);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener el tipo de usuario para el usuario: " + userEmail + e.getMessage());
        }

        return tipoUsuario;
    }

    public boolean validarCredenciales(String userEmail, String contrasena) {
        String sql = "SELECT " + COLUMN_CONTRASENA + " FROM Usuarios WHERE " + COLUMN_EMAIL + " = ?";

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, userEmail);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return BCrypt.checkpw(contrasena, rs.getString(COLUMN_CONTRASENA));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al validar las credenciales para el usuario: " + userEmail + e.getMessage());
        }

        return false;
    }

    public List<Usuario> getAllUsers() {
        String sql = "SELECT * FROM Usuarios";
        List<Usuario> lista = new ArrayList<>();

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(new Usuario(
                        rs.getInt(COLUMN_ID),
                        rs.getString(COLUMN_EMAIL),
                        rs.getString(COLUMN_CONTRASENA),
                        rs.getString(COLUMN_TELEFONO),
                        rs.getString(COLUMN_DIRECCION),
                        rs.getString(COLUMN_TIPO_USUARIO)
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error al listar usuarios: " + e.getMessage());
        }

        return lista;
    }

    public boolean existeUsuario(String userEmail) {
        String sql = "SELECT COUNT(*) FROM Usuarios WHERE " + COLUMN_EMAIL + " = ?";
        boolean existe = false;

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, userEmail);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    existe = rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar si existe el usuario con email: " + userEmail + " - " + e.getMessage());
        }

        return existe;
    }


    public int agregar(Usuario user) {
        String sql = "INSERT INTO Usuarios (" + COLUMN_EMAIL + ", " + COLUMN_CONTRASENA + ", " + COLUMN_TELEFONO +
                ", " + COLUMN_DIRECCION + ", " + COLUMN_TIPO_USUARIO + ") VALUES (?, ?, ?, ?, ?)";
        int usuarioId = -1;

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, user.getEmail());
            ps.setString(2, BCrypt.hashpw(user.getContrasena(), BCrypt.gensalt()));
            ps.setString(3, user.getTelefono());
            ps.setString(4, user.getDireccion());
            ps.setString(5, user.getTipo_usuario());

            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        usuarioId = rs.getInt(1); // Obtener el ID generado
                    }
                }
            }

            System.out.println("Se registró el usuario: " + user.getEmail() + " con ID: " + usuarioId);
        } catch (SQLException e) {
            System.err.println("Error al agregar el usuario: " + e.getMessage());
        }

        return usuarioId;
    }


    public Customer getCustomer(int usuarioId){

        String sql = "SELECT * FROM Clientes WHERE usuario_id = ?";
        Customer customer = null;
        try (Connection cnn = dataSource.getConnection();
             PreparedStatement pst = cnn.prepareStatement(sql)) {

            pst.setInt(1, usuarioId);

            try (ResultSet rst = pst.executeQuery()) {
                if (rst.next()) {
                    int id = rst.getInt(1);
                    String name = rst.getString(2);
                    String lastname = rst.getString(3);

                    // Crear y devolver un objeto Customer
                    customer = new Customer(id, name, lastname);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customer;
    }
}
