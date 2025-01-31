package development.team.software_masavi.Model;

public class Client {
    private int id;
    private String nombre;
    private String apellido;
    private int usuarioId;

    public Client() {
    }

    public Client(int id, int usuarioId, String apellido, String nombre) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.apellido = apellido;
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }
}
