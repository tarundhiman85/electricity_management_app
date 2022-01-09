package project.Controller;
import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Dao.UserDao;
import project.Helper.FactoryProvider;
import project.Model.Balance;
import project.Model.Bill;
import project.Model.Transactions;
import project.Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PayBillWithWalletServlet", value = "/PayBillWithWalletServlet")
public class PayBillWithWalletServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            int due = Integer.parseInt(request.getParameter("due"));
            int billA = Integer.parseInt(request.getParameter("billA"));
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("current-User");
            UserDao userDao = new UserDao(FactoryProvider.getFactory());

            //getting the bill
            Bill billByUserId = userDao.getBillByUserId(user.getUserId());
            HttpSession httpSession = request.getSession();
            int currentDue = billByUserId.getDues();
            int currentAmount = billByUserId.getAmount();

            Balance balance = new UserDao(FactoryProvider.getFactory()).getBalanceByUserId(user.getUserId(), user);
            int walletBalance = balance.getAvailBalance();

            if (currentAmount == billA && currentDue == due )
            {
                if((billA+due)<=walletBalance){
                    //updating balance
                    balance.setAvailBalance(balance.getAvailBalance()-(billA+due));
                    //Saving to the database
                    Session session1 = FactoryProvider.getFactory().openSession();
                    Transaction tx= session1.beginTransaction();
                    session1.delete(billByUserId);
                    session1.update(balance);
                    tx.commit();
                    session1.close();

                    Transactions transactions = new Transactions(billA,userDao.getUserById(user.getUserId()));
                    transactions.setActionDone("Paid Bill");
                    Session session2 = FactoryProvider.getFactory().openSession();
                    tx = session2.beginTransaction();
                    session2.save(transactions);
                    tx.commit();
                    session2.close();

                    httpSession.setAttribute("message1","Bill Paid Successfully");
                }
                else{
                    httpSession.setAttribute("message1","You don't have enough balance");
                }
            }
            else{
                httpSession.setAttribute("message1","Please Enter the Amount and Details under Limits");
            }
            response.sendRedirect("wallet.jsp");
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
