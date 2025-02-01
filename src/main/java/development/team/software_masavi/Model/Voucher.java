package development.team.software_masavi.Model;

import java.sql.Date;

public class Voucher {
    private int id;
    private int payId;
    private String Type;
    private String numberVoucher;
    private Date dateVouched;
    private double amountVouched;

    public Voucher(int payId, String type, String numberVoucher, Date dateVouched, double amountVouched) {
        this.payId = payId;
        Type = type;
        this.numberVoucher = numberVoucher;
        this.dateVouched = dateVouched;
        this.amountVouched = amountVouched;
    }

    public Voucher() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPayId() {
        return payId;
    }

    public void setPayId(int payId) {
        this.payId = payId;
    }

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public String getNumberVoucher() {
        return numberVoucher;
    }

    public void setNumberVoucher(String numberVoucher) {
        this.numberVoucher = numberVoucher;
    }

    public Date getDateVouched() {
        return dateVouched;
    }

    public void setDateVouched(Date dateVouched) {
        this.dateVouched = dateVouched;
    }

    public double getAmountVouched() {
        return amountVouched;
    }

    public void setAmountVouched(double amountVouched) {
        this.amountVouched = amountVouched;
    }
}
