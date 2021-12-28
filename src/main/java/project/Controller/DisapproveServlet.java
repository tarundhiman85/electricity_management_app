package project.Controller;

import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Dao.UserDao;
import project.Helper.FactoryProvider;
import project.Model.ConnRequest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DisapproveServlet", value = "/DisapproveServlet")
public class DisapproveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int getConnId = Integer.parseInt(request.getParameter("connId"));
        ConnRequest connectionRequestByConnId = new UserDao(FactoryProvider.getFactory()).getConnectionRequestByConnId(getConnId);
        //disapproving the request
        connectionRequestByConnId.setStatus("Disapproved");
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(connectionRequestByConnId);
        tx.commit();
        session.close();
        response.sendRedirect("viewConnRequests.jsp");
    }
}
