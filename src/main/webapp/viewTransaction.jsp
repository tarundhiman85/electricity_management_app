<%@ page import="java.util.List" %>
<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="project.Model.Transactions" %>
<%@ page import="project.Dao.TransactionDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Transactions</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Analysis - 31251.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>
<div style="top:10rem" class="tablesection">
    <div class="tableform">
        <h2>Search the Transaction by Id</h2>
        <form style="display: flex; margin: 1rem;" action="TransactionServlet" method="post">
            <div style="margin-right:1rem" class="searchform">
                <div  class="boximage">
                    <img style="width:2rem" src="./img/loupe.png" alt="" srcset="">
                </div>
                <input style="color:white; background:linear-gradient(45deg, black, transparent); border-color: transparent; color:white "  type="text" placeholder="Enter the ID" name="trans">
            </div>
            <input style="color: white; background-color: rgb(155, 216, 216); border-radius: 0.6rem; width: 6rem;" type="submit" value="Search">
        </form>
    </div>
    <%
        if(session.getAttribute("message1")!=null){
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message1","No Record Found");
    %>
    <%@include file="message.jsp"%>
    <%    }
    else{
        Transactions transactions=(Transactions) session.getAttribute("message");
        if(transactions==null) {
            List<Transactions> transactionList = new TransactionDao(FactoryProvider.getFactory()).getAllTransactions();
            if (transactionList == null) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message1", "No Record Found");
    %>
    <div>
        <%@include file="message.jsp"%>
    </div>
    <%
    }else{
    %>
    <table style="background:linear-gradient(45deg, black, transparent) " class="table">
        <thead>
        <tr>
            <th scope="col">Transaction Id</th>
            <th scope="col">Transaction Paid Ammount</th>
            <th scope="col">Transaction Date and Time</th>
            <th scope="col">Transaction Action Done</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Transactions t : transactionList){
        %>
        <tr>
            <th scope="row"><%=t.getTransId()%></th>
            <td><%=t.getAmount()%></td>
            <td><%=t.getTime()%></td>
            <td><%=t.getActionDone()%></td>
        </tr>
        <%}%>

        </tbody>
    </table>
    <% }
    }
    else{
    %>
    <table style="background:linear-gradient(45deg, black, transparent) " class="table">
        <thead>
        <tr>
            <th scope="col">Transaction Id</th>
            <th scope="col">Transaction Paid Ammount</th>
            <th scope="col">Transaction Date and Time</th>
            <th scope="col">Transaction Action Done</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row"><%=transactions.getTransId()%></th>
            <td><%=transactions.getAmount()%></td>
            <td><%=transactions.getTime()%></td>
            <td><%=transactions.getActionDone()%></td>
        </tr>
        <%}%>

        </tbody>
    </table>
    <%
        }
    %>
</div>
</body>
</html>
