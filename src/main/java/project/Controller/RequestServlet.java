package project.Controller;

import project.Dao.UserDao;
import project.Helper.FactoryProvider;
import project.Model.ConnRequest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RequestServlet", value = "/RequestServlet")
public class RequestServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int referenceNumber = Integer.parseInt(request.getParameter("referenceN"));
            ConnRequest connRequest = new UserDao(FactoryProvider.getFactory()).getConnectionRequestByReferenceN(referenceNumber);
            HttpSession httpSession = request.getSession();
            if (connRequest == null) {
                httpSession.setAttribute("message1", "No Record Found You can make a connection Request");
            } else {
                httpSession.setAttribute("message", connRequest);
            }
        response.sendRedirect("viewStatus.jsp");
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
