package development.team.software_masavi.Model;

import java.sql.Date;

public class Product {
    private int id;
    private String name;
    private String description;
    private Double price;
    private int quantityInStock;
    private String category;
    private Date dateEntry;
    private String state;
    private String image;

    public Product() {
    }

    //constructor para tarejtas de productos
    public Product(int id, String name, String description, Double price, int quantityInStock, String image) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantityInStock = quantityInStock;
        this.image = image;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Date getDateEntry() {
        return dateEntry;
    }

    public void setDateEntry(Date dateEntry) {
        this.dateEntry = dateEntry;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Producto{" +
                "ID=" + id +
                ", Nombre='" + name + '\'' +
                ", Descripción='" + description + '\'' +
                ", Precio=S/ " + price +
                ", Stock=" + quantityInStock +
                ", Categoría='" + category + '\'' +
                ", Estado='" + state + '\'' +
                '}';
    }
}
