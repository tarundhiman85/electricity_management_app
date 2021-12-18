package project.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import project.Helper.FactoryProvider;
import project.Model.Query;

import java.util.List;

public class QueryDao {
    private SessionFactory factory;
    //we need to give Session factory to dao
    public QueryDao(SessionFactory factory){
        this.factory=factory;
    }
    public QueryDao() {

    }
    public List<Query> getAllQueries() {
        List<project.Model.Query> queryList =null;
        try {
            Session session = FactoryProvider.getFactory().openSession();
            String q = "from Query";
            org.hibernate.query.Query query = session.createQuery(q);
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
            org.hibernate.query.Query query = (org.hibernate.query.Query) session.createQuery(q);
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
