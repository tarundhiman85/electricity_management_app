package project.Model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Bill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int billID;
    private int dues;
    private int units;
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date date;
    private String boardT;
    private int amount;

    @OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private User user;

    @PrePersist
    void onCreate(){
        date = new Date();
    }

    public Bill(int dues, int units, String boardT, int amount, User user) {
        this.dues = dues;
        this.units = units;
        this.boardT = boardT;
        this.amount = amount;
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getBoardT() {
        return boardT;
    }

    public void setBoardT(String boardT) {
        this.boardT = boardT;
    }


    public Bill() {

    }

    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    public int getDues() {
        return dues;
    }

    public void setDues(int dues) {
        this.dues = dues;
    }

    public int getUnits() {
        return units;
    }

    public void setUnits(int units) {
        this.units = units;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}