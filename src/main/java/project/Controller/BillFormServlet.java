package project.Controller;

import org.hibernate.Session;
import org.hibernate.Transaction;
import project.Helper.FactoryProvider;
import project.Model.Bill;
import project.Model.Transactions;
import project.Model.User;
import project.Dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;

@WebServlet(name = "BillFormServlet", value = "/BillFormServlet")
public class BillFormServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {

        int units = Integer.parseInt(request.getParameter("units"));
        int dues = Integer.parseInt(request.getParameter("dues"));
        int id = Integer.parseInt(request.getParameter("uid"));

        HttpSession httpSession = request.getSession();
        UserDao userDao = new UserDao(FactoryProvider.getFactory());
        Transactions transactions = new Transactions(units*10,userDao.getUserById(id));

        if(userDao.getBillByUserId(id)!=null){
            //means we have the bill
            Session session = FactoryProvider.factory.openSession();
            Transaction tx = session.beginTransaction();
            Bill bill=userDao.getBillByUserId(id);
            bill.setAmount(bill.getAmount()+(units*10));
            bill.setUnits(bill.getUnits()+units);
            bill.setDues(bill.getDues()+dues);
            session.update(bill);
            tx.commit();
            session.close();
            httpSession.setAttribute("message1","Bill Updated Successfully");
            response.sendRedirect("BillForm.jsp");
        }
        else {
            Session session = FactoryProvider.factory.openSession();
            Transaction tx = session.beginTransaction();
            Bill bill = new Bill(dues, units, units * 10);
            User user = userDao.getUserById(id);
            bill.setUser(user);
            session.save(bill);
            tx.commit();
            session.close();
            httpSession.setAttribute("message1","Bill Added Successfully");
            response.sendRedirect("BillForm.jsp");
        }
        Session session = FactoryProvider.factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(transactions);
        tx.commit();
        session.close();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}