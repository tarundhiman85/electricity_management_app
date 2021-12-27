package project.Controller;

import org.hibernate.Transaction;
import project.Dao.TransactionDao;
import project.Helper.FactoryProvider;
import project.Model.Transactions;
import project.Model.User;
import project.Dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TransactionServlet", value = "/TransactionServlet")
public class TransactionServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int transId = Integer.parseInt(request.getParameter("trans"));
        TransactionDao transactionDao = new TransactionDao(FactoryProvider.getFactory());
        Transactions transactions = transactionDao.getTransactionById(transId);
        HttpSession httpSession = request.getSession();
        if (transactions == null) {
            httpSession.setAttribute("message1", "No Record Found");
            response.sendRedirect("viewTransaction.jsp");
        } else {
            httpSession.setAttribute("message", transactions);
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
