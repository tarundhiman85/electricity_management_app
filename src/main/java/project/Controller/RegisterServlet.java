package project.Controller;

import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Dao.UserDao;
import project.Helper.FactoryProvider;
import project.Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html");

        try (PrintWriter out = response.getWriter()) {
            try {
                String userName=request.getParameter("user_name");
                String userEmail=request.getParameter("user_email");
                String userPassword=request.getParameter("user_password");
                String userPhone=request.getParameter("user_phone");
                String userAddress=request.getParameter("user_address");
                String boardType=request.getParameter("board");

                HttpSession httpSession=request.getSession();
                //validation
                UserDao userDao = new UserDao(FactoryProvider.getFactory());
                if(userName==null)
                {
                    httpSession.setAttribute("message1", "User Name Cannot be Null");
                    response.sendRedirect("register.jsp");
                }
                else if(!userDao.validateUserRegistrationEmail(userEmail)){
                    httpSession.setAttribute("message1","This email is already registered with us choose another");
                    response.sendRedirect("register.jsp");
                }
                else if(!userDao.validateUserRegistrationUserName(userName)){
                    httpSession.setAttribute("message1","This UserName is already available choose another");
                    response.sendRedirect("register.jsp");
                }
                else if(!userDao.authenticatePassword(userPassword)){
                    httpSession.setAttribute("message1","Please follow instruction of password");
                    response.sendRedirect("register.jsp");
                }
                else{
                    User user = new User(userEmail,userName,userPassword,userAddress,userPhone,2);
                    user.setBoardType(boardType);
                    Session session = FactoryProvider.getFactory().openSession();
                    Transaction transaction = session.beginTransaction();
                    int userId= (int)session.save(user);
                    transaction.commit();
                    session.close();
                    httpSession.setAttribute("message1","User Created Successfully");
                    response.sendRedirect("register.jsp");
                }
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request,response);
    }
}
