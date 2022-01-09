package project.Controller;
import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Dao.QueryDao;
import project.Helper.FactoryProvider;
import project.Model.Query;
import project.Dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ResolveServlet", value = "/ResolveServlet")
public class ResolveServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int qId = Integer.parseInt(request.getParameter("qId"));
        //db logic
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query q = new QueryDao().getQueriesById(qId);
        q.setResolve("Yes");
        session.update(q);
        tx.commit();
        session.close();
        response.sendRedirect("ResolveIsue.jsp");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
}
