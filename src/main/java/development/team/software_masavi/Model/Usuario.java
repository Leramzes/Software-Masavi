package development.team.software_masavi.Model;

public class Usuario {
    private int id;
    private String email;
    private String contrasena;
    private String telefono;
    private String direccion;
    private String tipo_usuario;

    public Usuario() {
    }

    public Usuario(int id, String email, String contrasena, String telefono, String direccion, String tipo_usuario) {
        this.id = id;
        this.email = email;
        this.contrasena = contrasena;
        this.telefono = telefono;
        this.direccion = direccion;
        this.tipo_usuario = tipo_usuario;
    }

    public int getId() { return id;}

    public void setId(int id) { this.id = id;}

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", contrasena='" + contrasena + '\'' +
                ", telefono='" + telefono + '\'' +
                ", direccion='" + direccion + '\'' +
                ", tipo_usuario='" + tipo_usuario + '\'' +
                '}';
    }
}
