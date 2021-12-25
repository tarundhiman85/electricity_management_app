package project.Controller;
import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Dao.UserDao;
import project.Helper.FactoryProvider;
import project.Model.Balance;
import project.Model.Transactions;
import project.Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddBalanceServlet", value = "/AddBalanceServlet")
public class AddBalanceServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            int balanceToAdd = Integer.parseInt(request.getParameter("balance"));

            //db logic
            HttpSession httpSession = request.getSession();
            User user = (User) httpSession.getAttribute("current-User");
            Transactions transactions = new Transactions();
            transactions.setActionDone("Added Balance");
            transactions.setAmount(balanceToAdd);
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
                Balance balance = userDao.getBalanceByUserId(user.getUserId(), user);
                balance.setAvailBalance(balance.getAvailBalance()+balanceToAdd);
                Session session = FactoryProvider.getFactory().openSession();
                Transaction tx = session.beginTransaction();
                session.update(balance);
                session.save(transactions);
                tx.commit();
                session.close();
            httpSession.setAttribute("message","Amount added Successfully");
            response.sendRedirect("wallet.jsp");
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
