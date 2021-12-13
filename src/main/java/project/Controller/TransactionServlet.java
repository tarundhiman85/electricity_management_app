package project.Controller;

import project.Model.User;
import project.Model.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TransactionServlet", value = "/TransactionServlet")
public class TransactionServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int transId = Integer.parseInt(request.getParameter("trans"));
        UserDao userDao = new UserDao(FactoryProvider.getFactory());
        User user = userDao.getUserById(transId);
        HttpSession httpSession = request.getSession();
        if (user == null) {
            httpSession.setAttribute("message1", "No Record Found");
            response.sendRedirect("viewTransaction.jsp");
        } else {
            httpSession.setAttribute("message", user);
            response.sendRedirect("viewTransaction.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            processRequest(request, response);
    }
}
