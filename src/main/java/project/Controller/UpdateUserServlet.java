package project.Controller;

import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "UpdateUserServlet", value = "/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String userName=request.getParameter("user_name");
            String userEmail=request.getParameter("user_email");
            String userPassword=request.getParameter("user_password");
            String userPhone=request.getParameter("user_phone");
            String userAddress=request.getParameter("user_address");

            Session s= FactoryProvider.getFactory().openSession();
            int userId=Integer.parseInt(request.getParameter("user_id").trim());
            Transaction tx=s.beginTransaction();
            User user = s.get(User.class,userId);
            user.setUserEmail(userName);
            user.setUserAddress(userAddress);
            user.setUserPassword(userPassword);
            user.setUserPhone(userPhone);
            tx.commit();
            s.update(user);
            s.close();
            response.sendRedirect("viewUser.jsp");

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
