package project.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import project.Model.Bill;
import project.Model.User;

import java.util.Date;

public class BillDao {
    private SessionFactory factory;
    public BillDao(SessionFactory factory){
        this.factory=factory;
    }
    public BillDao() {
    }
    public boolean updateBill(int due, int amount, int units, Bill bill, String Board){
        boolean f=false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            bill.setAmount(amount);
            bill.setDues(due);
            bill.setBoardT(Board);
            bill.setUnits(units);
            session.update(bill);
            tx.commit();
            session.close();
            f=true;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    public boolean checkReminder(int userId, Date date) {
        String q = "FROM Bill where user.userId=:e";
        Session session = this.factory.openSession();
        Query query = (Query) session.createQuery(q);
        query.setParameter("e",userId);
        Bill bill = (Bill) query.uniqueResult();
        session.close();
        String reminder = bill.getReminder();
        if(date.getMonth()+1==Integer.parseInt(reminder.substring(3,5))){
            if(date.getDate()+1>Integer.parseInt(reminder.substring(0,2))){
                return true;
            }
        }
        return false;
    }
}
