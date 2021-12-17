package project.Controller;

import project.Helper.FactoryProvider;
import project.Model.User;
import project.Dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        UserDao userDao = new UserDao(FactoryProvider.getFactory());
        User user = userDao.getUserById(id);
        HttpSession httpSession = request.getSession();
            if (user == null) {
                httpSession.setAttribute("message1", "No Record Found");
                response.sendRedirect("viewUser.jsp");
            } else {
                httpSession.setAttribute("message", user);
                response.sendRedirect("viewUser.jsp");
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
