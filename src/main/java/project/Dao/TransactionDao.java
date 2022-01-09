package project.Dao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import project.Model.Transactions;

import java.util.List;

public class TransactionDao {
    private SessionFactory factory;

    //we need to give Session factory to dao
    public TransactionDao(SessionFactory factory) {
        this.factory = factory;
    }

    public TransactionDao() {
    }

    public List<Transactions> getAllTransactionsById(int id) {
        List<Transactions> transactionList = null;
        try {
            Session session = this.factory.openSession();
            String q = "from Transactions where  user.userId=:i";
            Query query = session.createQuery(q);
            query.setParameter("i", id);
            transactionList = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transactionList;
    }

    public List<Transactions> getAllTransactions() {
        List<Transactions> transactionList = null;
        try {
            Session session = this.factory.openSession();
            String q = "from Transactions";
            Query query = (Query) session.createQuery(q);
            transactionList = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transactionList;
    }

    public Transactions getTransactionById(int transId) {
        Transactions transactions = null;
        try {
            Session session = this.factory.openSession();
            String q = "from Transactions where transId=:e";
            Query query = (Query) session.createQuery(q);
            query.setParameter("e",transId);
            transactions = (Transactions) query.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transactions;
}
}
