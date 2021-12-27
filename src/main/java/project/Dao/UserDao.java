package project.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import project.Helper.FactoryProvider;
import project.Model.*;

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
            session.close();
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

    public Balance getBalanceByUserId(int id, User user){
        Balance balance = null;
        try {
            String query = "from Balance where user.userId=: e";
            Session session=this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("e",id);
            balance = (Balance) q.uniqueResult();
            session.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        if(balance==null){
            Balance balance1 = new Balance();
            balance1.setAvailBalance(0);
            balance1.setUser(user);
            Session session=this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(balance1);
            tx.commit();
            session.close();
            return balance1;
        }
        return balance;
    }

    public boolean validateUserRegistrationEmail(String userEmail) {
        String q="From User where userEmail=:e";
        Session session=this.factory.openSession();
        Query qu= session.createQuery(q);
        qu.setParameter("e",userEmail);
        if(qu.uniqueResult()==null) return true;
        return false;
    }

    public boolean validateUserRegistrationUserName(String userName) {
        String q="From User where userName=:e";
        Session session=this.factory.openSession();
        Query qu= session.createQuery(q);
        qu.setParameter("e",userName);
        if(qu.uniqueResult()==null) return true;
        return false;
    }

    public boolean authenticatePassword(String userPassword) {
        boolean capitalLetterFlag=false;
        boolean smallLetterFlag=false;
        boolean numberFlag=false;
        for(int i=0; i< userPassword.length(); i++){
            int val = userPassword.charAt(i);
            if(65<=val && val<=90){
                capitalLetterFlag=true;
            }
            if(97<=val && val<=122){
                smallLetterFlag=true;
            }
            if(48<=val && val<=57){
                numberFlag=true;
            }
        }
        if(capitalLetterFlag && smallLetterFlag && numberFlag){
            return true;
        }
        return false;
    }

    public ConnRequest getConnectionRequestByReferenceN(int referenceNumber) {
      ConnRequest connRequest =null;
      try{
          Session session = this.factory.openSession();
          String q = "from ConnRequest where requestNumber=:i";
          Query query = (Query) session.createQuery(q);
          query.setParameter("i", referenceNumber);
          connRequest = (ConnRequest) query.uniqueResult();
          session.close();
      }
      catch (Exception e){
          e.printStackTrace();
      }
      return connRequest;
    }

    public List<ConnRequest> getAllConnectionRequests() {
        List<ConnRequest> connRequestList = null;
        try{
            String q = "from ConnRequest";
            Session session = this.factory.openSession();
            Query query = (Query) session.createQuery(q);
            connRequestList=query.list();
            session.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return connRequestList;
    }
}
