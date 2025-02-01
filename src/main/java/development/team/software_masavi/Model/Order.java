package development.team.software_masavi.Model;

import java.sql.Date;

public class Order {
    private int orderId;
    private Customer customerId;
    private Date dateOrder;
    private String state;
    private double totalAmount;
    private String address;

    public Order(Customer customerId, Date dateOrder, String state,
                 double totalAmount, String address) {
        this.customerId = customerId;
        this.dateOrder = dateOrder;
        this.state = state;
        this.totalAmount = totalAmount;
        this.address = address;
    }

    public Order() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", customerId=" + customerId +
                ", dateOrder=" + dateOrder +
                ", state='" + state + '\'' +
                ", totalAmount=" + totalAmount +
                ", address='" + address + '\'' +
                '}';
    }
}
