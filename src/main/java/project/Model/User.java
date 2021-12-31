package project.Model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;
    private String userEmail;
    private String userName;
    private String userPassword;
    private String userAddress;
    private String userPhone;
    private String ConnType;
    private String boardType;
    private int BillNo;
    private int Roll_id;



    @PrePersist
    void onCreate(){
        BillNo = (int)(Math.random()*1000000);
    }
    public int getBillNo() {
        return BillNo;
    }

    public void setBillNo(int billNo) {
        BillNo = billNo;
    }
    public String getConnType() {
        return ConnType;
    }

    public void setConnType(String connType) {
        ConnType = connType;
    }

    public User(String userEmail, String userName, String userPassword, String userAddress, String userPhone, int roll_id) {
        this.userEmail = userEmail;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        Roll_id = roll_id;
    }

    public User(String userEmail, String userName, String userPassword, String userAddress, String userPhone, String boardType, int roll_id) {
        this.userEmail = userEmail;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.boardType = boardType;
        Roll_id = roll_id;
    }

    public String getBoardType() {
        return boardType;
    }

    public void setBoardType(String boardType) {
        this.boardType = boardType;
    }

    public User() {

    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public int getRoll_id() {
        return Roll_id;
    }

    public void setRoll_id(int roll_id) {
        Roll_id = roll_id;
    }

}
