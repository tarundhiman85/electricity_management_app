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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "BillFormServlet", value = "/BillFormServlet")
public class BillFormServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        int units = Integer.parseInt(request.getParameter("units"));
        int dues = Integer.parseInt(request.getParameter("dues"));
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date date=formatter.parse(request.getParameter("date"));

        int id = Integer.parseInt(request.getParameter("uid"));

        HttpSession httpSession = request.getSession();
        UserDao userDao = new UserDao(FactoryProvider.getFactory());
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
            httpSession.setAttribute("message1","User Updated Successfully");
            response.sendRedirect("BillForm.jsp");
        }
        else {
            Session session = FactoryProvider.factory.openSession();
            Transaction tx = session.beginTransaction();
            Bill bill = new Bill(dues, units, date, units * 10);
            User user = userDao.getUserById(id);
            bill.setUser(user);
            session.save(bill);
            tx.commit();
            session.close();
            httpSession.setAttribute("message1","User Added Successfully");
            response.sendRedirect("BillForm.jsp");
        }
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