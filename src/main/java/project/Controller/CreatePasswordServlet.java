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

@WebServlet(name = "CreatePasswordServlet", value = "/CreatePasswordServlet")
public class CreatePasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userPassword=request.getParameter("user_password");
        String confirmPassword=request.getParameter("confirm_password");
        HttpSession httpSession = request.getSession();
        ConnRequest connRequest = (ConnRequest) httpSession.getAttribute("CurrentConnection");

        //validation
        UserDao userDao = new UserDao(FactoryProvider.getFactory());
        if(!userDao.authenticatePassword(userPassword)){
            httpSession.setAttribute("message1","Please follow instruction of password");
            response.sendRedirect("createPassword.jsp");
        }
        else if(!confirmPassword.equals(userPassword)){
            httpSession.setAttribute("message1","Password don't match Please Retype it");
            response.sendRedirect("createPassword.jsp");
        }
        else{
            User user = userDao.getUserByEmail(connRequest.getEmail());
            user.setUserPassword(userPassword);
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.update(user);
            session.delete(connRequest);
            tx.commit();
            session.close();
            httpSession.setAttribute("message1","Password Created Successfully you can login now");
            response.sendRedirect("createPassword.jsp");
       }
    }
}
