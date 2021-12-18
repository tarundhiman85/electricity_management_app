package project.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import project.Helper.FactoryProvider;
import project.Model.Bill;
import project.Model.Transactions;
import project.Model.User;

import java.util.List;

public class UserDao {
    private SessionFactory factory;
    //we need to give Session factory to dao
    public UserDao(SessionFactory factory){
        this.factory=factory;
    }
    public UserDao() {
    }
    public User getUserByEmailandPassword(String email, String password){
        User user = null;
        try {
            //validation if the user exists
            Session session = this.factory.openSession();
            String q = "from User where userEmail=: e and userPassword=: p";
            Query query = (Query) session.createQuery(q);
            query.setParameter("e", email);
            query.setParameter("p", password);
            user = (User) query.uniqueResult();
            session.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public Bill getBillByUserId(int id){
        Bill bill = null;
        try{
            Session session = this.factory.openSession();
            String q = "from Bill where user.userId=:i";
            Query query = (Query) session.createQuery(q);
            query.setParameter("i", id);
            bill = (Bill) query.uniqueResult();
            session.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return bill;
    }
    public User getUserById(int id){
        User user = null;
        try {
            //validation if the user exists
            Session session = this.factory.openSession();
            String q = "from User where userId=:i";
            Query query = (Query) session.createQuery(q);
            query.setParameter("i", id);
            user = (User) query.uniqueResult();
            session.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public List<User> getAllUsers(){
        List<User> userList=null;
        try{
            Session session = this.factory.openSession();
            String q = "from User";
            Query query = (Query) session.createQuery(q);
            userList=query.list();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return userList;
    }
    public long getNumberofUsers(){
        long count=0;
        try{
            Session session = this.factory.openSession();
            String q = "Select count(*) from User";
            Query query = (Query) session.createQuery(q);
            count =(long)query.list().get(0);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return count-1;
    }
}