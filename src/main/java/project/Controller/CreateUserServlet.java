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

@WebServlet(name = "CreateUserServlet", value = "/CreateUserServlet")
public class CreateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userPhone = request.getParameter("user_phone");
            String userAddress = request.getParameter("user_address");
            String boardType = request.getParameter("board");
            String connType = request.getParameter("conn_type");
            int id=Integer.parseInt(request.getParameter("connId"));
            ConnRequest connRequest = new UserDao(FactoryProvider.getFactory()).getConnectionRequestByReferenceN(id);
            connRequest.setStatus("Approved");
            HttpSession httpSession = request.getSession();
            User user = new User(userEmail, userName, userPassword, userAddress, userPhone, 2);
            user.setBoardType(boardType);
            user.setConnType(connType);
            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();
            session.save(user);
            session.update(connRequest);
            transaction.commit();
            session.close();
            httpSession.setAttribute("message1", "User Created");
            response.sendRedirect("viewConnRequests.jsp");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
