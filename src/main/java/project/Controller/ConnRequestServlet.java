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
        try
        {
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPhone = request.getParameter("user_phone");
            String userAddress = request.getParameter("user_address");
            String connType = request.getParameter("conn_Type");
            String board = request.getParameter("board");
            //validation
            HttpSession httpSession = request.getSession();
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            if(userName==null)
            {
                httpSession.setAttribute("message1", "User Name Cannot be Null");
                response.sendRedirect("newConnection.jsp");
            }
            else if(!userDao.validateUserRegistrationEmail(userEmail)){
                httpSession.setAttribute("message1","This email is already registered with us choose another");
                response.sendRedirect("newConnection.jsp");
            }
            else if(!userDao.validateUserRegistrationUserName(userName)){
                httpSession.setAttribute("message1","This UserName is already available choose another");
                response.sendRedirect("newConnection.jsp");
            }
            int randomNumber = (int)(Math.random()*1000);
            //db logic
            ConnRequest connRequest = new ConnRequest(userName,userEmail,userAddress,userPhone,connType);
            connRequest.setBoardType(board);
            connRequest.setRequestNumber(randomNumber);
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.save(connRequest);
            tx.commit();
            session.close();
            httpSession.setAttribute("message1","Connection Request Sent Your Request Number is "+randomNumber+" Please save it for View Status");
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
