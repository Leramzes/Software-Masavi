package development.team.software_masavi.Model;

public class Contact {
    private String fullName;
    private String email;
    private String phone;
    private String message;

    public Contact(String fullName, String email, String phone, String message) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.message = message;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
