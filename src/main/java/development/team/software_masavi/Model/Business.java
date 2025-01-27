package development.team.software_masavi.Model;

public class Business {
    private int id;
    private String name;
    private String ruc;
    private String address;
    private String phone;
    private String email;
    private String logo;

    public Business(int id, String name, String ruc, String address, String phone, String email, String logo) {
        this.id = id;
        this.name = name;
        this.ruc = ruc;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.logo = logo;
    }

    public Business() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
}
