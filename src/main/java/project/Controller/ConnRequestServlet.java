package project.Controller;

import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Dao.UserDao;
import project.Helper.FactoryProvider;
import project.Model.ConnRequest;
import project.Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ConnRequestServlet", value = "/ConnRequestServlet")
public class ConnRequestServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPhone = request.getParameter("user_phone");
            String userAddress = request.getParameter("user_address");
            String connType = request.getParameter("conn_Type");

            HttpSession httpSession = request.getSession();

            //db logic
            ConnRequest connRequest = new ConnRequest(userName,userEmail,userAddress,userPhone,connType);
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.save(connRequest);
            tx.commit();
            session.close();
            httpSession.setAttribute("message1","Connection Request Sent");
            response.sendRedirect("newConnection.jsp");
        }
        catch (Exception e){
            e.printStackTrace();
        }
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
