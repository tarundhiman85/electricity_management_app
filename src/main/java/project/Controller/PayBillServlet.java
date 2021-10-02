package project.Controller;

import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Model.Bill;
import project.Model.User;
import project.Model.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PayBillServlet", value = "/PayBillServlet")
public class PayBillServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            int due = Integer.parseInt(request.getParameter("due"));
            int billA = Integer.parseInt(request.getParameter("billA"));
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("current-User");
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            Bill billByUserId = userDao.getBillByUserId(user.getUserId());
            HttpSession httpSession = request.getSession();
            int currentDue=billByUserId.getDues();
            int currentAmount=billByUserId.getAmount();
            if(currentAmount>=billA && currentDue>=due){
                billByUserId.setDues(currentDue-due);
                billByUserId.setAmount(currentAmount-billA);
                billByUserId.setUnits(billByUserId.getAmount()/10);
                Session session1 = FactoryProvider.getFactory().openSession();
                Transaction tx= session1.beginTransaction();
                session1.update(billByUserId);
                tx.commit();
                session1.close();
                httpSession.setAttribute("message1","Bill Paid Successfully");
                response.sendRedirect("PayBill.jsp");
            }
            else{
                httpSession.setAttribute("message1","Please Enter the Amount and Details under Limits");
                response.sendRedirect("PayBill.jsp");
            }
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