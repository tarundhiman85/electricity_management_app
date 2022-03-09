package project.Controller;
import project.Helper.FactoryProvider;
import project.Model.User;
import project.Dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try(PrintWriter out = response.getWriter()){

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            String op = request.getParameter("op");



            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user=userDao.getUserByEmailandPassword(email,password);  //this is returning basically user object
            HttpSession httpSession=request.getSession();

            if(user == null){
                //user does not exist
                out.println("<h1>Invalid Details</h1>");
                httpSession.setAttribute("message1", "Invalid User Try Again");
                response.sendRedirect("login.jsp");
//                return;
            }
            else if(user.getRoll_id()==2){
                httpSession.setAttribute("current-User", user);
                if(op.equals("dashboard")){
                    response.sendRedirect("user.jsp");
                }
                else{
                    response.sendRedirect("wallet.jsp");
                }
            }
            else {
                //user exists
                //then redirect to page and display information
                httpSession.setAttribute("current-User", user);
                response.sendRedirect("admin.jsp");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
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
