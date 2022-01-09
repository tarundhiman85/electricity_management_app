package project.Controller;
import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Helper.FactoryProvider;
import project.Model.Query;
import project.Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "QueryServlet", value = "/QueryServlet")
public class QueryServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String query = request.getParameter("query");
            HttpSession httpSession = request.getSession();
            User currentUser = (User) httpSession.getAttribute("current-User");
            //db logic
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query q = new Query(query, "No", currentUser);
            session.save(q);
            tx.commit();
            session.close();
            httpSession.setAttribute("message1", "Your query is sent to admin and Your Query Id is " + q.getQueryId());
            response.sendRedirect("help.jsp");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
