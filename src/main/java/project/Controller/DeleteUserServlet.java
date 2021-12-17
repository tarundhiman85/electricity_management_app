package project.Controller;

import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Helper.FactoryProvider;
import project.Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteUserServlet", value = "/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            int userId=Integer.parseInt(request.getParameter("user_id").trim());
            Session s= FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            User user = s.get(User.class,userId);
            s.delete(user);
            tx.commit();
            s.close();
            response.sendRedirect("viewUser.jsp");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
