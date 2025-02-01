package development.team.software_masavi.Model;

import java.sql.Date;

public class Pay {
    private int payId;
    private int orderId;
    private Date payDate;
    private double totalAmount;
    private String payMethod;
    private String payStatus;

    public Pay(int orderId, Date payDate, double totalAmount, String payMethod, String payStatus) {
        this.orderId = orderId;
        this.payDate = payDate;
        this.totalAmount = totalAmount;
        this.payMethod = payMethod;
        this.payStatus = payStatus;
    }

    public Pay() {
    }

    public int getPayId() {
        return payId;
    }

    public void setPayId(int payId) {
        this.payId = payId;
    }

    public int getOrder() {
        return orderId;
    }

    public void setOrder(int orderId) {
        this.orderId = orderId;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }
}
