package project.Controller;

import project.Helper.FactoryProvider;
import project.Model.User;
import project.Dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BillServlet", value = "/BillServlet")
public class BillServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("usId"));
        UserDao userDao = new UserDao(FactoryProvider.getFactory());
        User user= userDao.getUserById(id);
        HttpSession httpSession = request.getSession();
        if(user==null){
            httpSession.setAttribute("message1","No Record Found");
            response.sendRedirect("calculateBill.jsp");
        }
        else{
//            httpSession.setAttribute("message", user);
            response.sendRedirect("BillForm.jsp?user_id="+user.getUserId());
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