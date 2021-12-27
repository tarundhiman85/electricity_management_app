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
    private String reminder;

    @OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.PERSIST)
    @JoinColumn(name = "user_id")
    private User user;

    @PrePersist
    void onCreate()
    {
        date = new Date();
        int number_Of_DaysInMonth = 0;
        int month=date.getMonth()+1;
        int year=date.getYear()+1900;
        switch (month) {
            case 1:
                number_Of_DaysInMonth = 31;
                break;
            case 2:
                if ((year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))) {
                    number_Of_DaysInMonth = 29;
                } else {
                    number_Of_DaysInMonth = 28;
                }
                break;
            case 3:
                number_Of_DaysInMonth = 31;
                break;
            case 4:
                number_Of_DaysInMonth = 30;
                break;
            case 5:
                number_Of_DaysInMonth = 31;
                break;
            case 6:
                number_Of_DaysInMonth = 30;
                break;
            case 7:
                number_Of_DaysInMonth = 31;
                break;
            case 8:
                number_Of_DaysInMonth = 31;
                break;
            case 9:
                number_Of_DaysInMonth = 30;
                break;
            case 10:
                number_Of_DaysInMonth = 31;
                break;
            case 11:
                number_Of_DaysInMonth = 30;
                break;
            case 12:
                number_Of_DaysInMonth = 31;
        }

        //handling next days
        StringBuilder stringBuilder = new StringBuilder();
        if(date.getDate()+20>number_Of_DaysInMonth){

            stringBuilder.append(((date.getDate()+20)%number_Of_DaysInMonth)+1);
            int next_month = ((date.getMonth()+1)%12)+1;
            if(next_month<date.getMonth()+1){
                int next_year = (date.getYear()+1900)+1;

                stringBuilder.append('-');
                String nextMonthIfLess = '0'+String.valueOf(next_month);
                if(next_month<10) stringBuilder.append(nextMonthIfLess);
                else stringBuilder.append(String.valueOf(next_month));
                stringBuilder.append('-');
                stringBuilder.append(String.valueOf(next_year));
            }
        }
        else{
            stringBuilder.append(String.valueOf(date.getDate()+20));
            stringBuilder.append('-');
            String monthIfLess = '0'+String.valueOf(date.getMonth()+1);
            if(date.getMonth()+1<10) stringBuilder.append(String.valueOf(monthIfLess));
            else stringBuilder.append(date.getMonth()+1);
            stringBuilder.append('-');
            stringBuilder.append(String.valueOf(date.getYear()+1900));
        }
        reminder = stringBuilder.toString();
    }

    public String getReminder() {
        return reminder;
    }

    public void setReminder(String reminder) {
        this.reminder = reminder;
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