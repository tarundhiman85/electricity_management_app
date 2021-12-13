package project.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import project.Model.Bill;

public class BillDao {
    private SessionFactory factory;
    public BillDao(SessionFactory factory){
        this.factory=factory;
    }
    public BillDao() {
    }

    public boolean updateBill(int due, int amount, int units, Bill bill){
        boolean f=false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            bill.setAmount(amount);
            bill.setDues(due);
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
//    public boolean saveNewBill(int due, int amount, int units, Bill bill){
//        Session session = this.factory.openSession();
//        Transaction tx = session.beginTransaction();
//    }
}