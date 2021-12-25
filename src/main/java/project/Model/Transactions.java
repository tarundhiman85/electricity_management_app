package project.Model;


import javax.persistence.*;
import java.util.Date;

@Entity
public class Transactions {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int transId;

    @Column(name = "Amount_Paid")
    private int amount;
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(name = "Date_Time", nullable = false)
    private Date Time;
    private String ActionDone;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private User user;

    @PrePersist
    void onCreate(){
        Time = new Date();
    }

    public Transactions() {
    }

    public String getActionDone() {
        return ActionDone;
    }

    public void setActionDone(String actionDone) {
        ActionDone = actionDone;
    }

    public int getTransId() {
        return transId;
    }

    public void setTransId(int transId) {
        this.transId = transId;
    }

    public Transactions(int amount, User user) {
        this.amount = amount;
        this.user = user;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Date getTime() {
        return Time;
    }

    public void setTime(Date time) {
        Time = time;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
