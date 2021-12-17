package project.Model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import project.Controller.FactoryProvider;

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
    public List<Transactions> getAllTransactions(){
        List<Transactions> transactionList = null;
        try{
            Session session = this.factory.openSession();
            String q = "from Transactions";
            Query query = (Query) session.createQuery(q);
            transactionList=query.list();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return transactionList;
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
    public List<Transactions> getAllTransactionsById(int id) {
        List<Transactions> transactionList = null;
        try{
            Session session = this.factory.openSession();
            String q = "from Transactions where  user.userId=:i";
            Query query = session.createQuery(q);
            query.setParameter("i", id);
            transactionList=query.list();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return transactionList;
    }

    public List<project.Model.Query> getAllQueries() {
        List<project.Model.Query> queryList =null;
        try {
            Session session = FactoryProvider.getFactory().openSession();
            String q = "from Query";
            Query query = session.createQuery(q);
            queryList=query.list();
            session.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return queryList;
    }
    public project.Model.Query getQueriesById(int id) {
        project.Model.Query qu = null;
        try {
            //validation if the query exists
            Session session = FactoryProvider.getFactory().openSession();
            String q = "from Query where queryId=:i";
            Query query = (Query) session.createQuery(q);
            query.setParameter("i", id);
            qu = (project.Model.Query) query.uniqueResult();
            session.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return qu;
    }
}
