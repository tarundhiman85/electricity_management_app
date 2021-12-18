<%@ page import="java.util.List" %>
<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="project.Model.Transactions" %>
<%@ page import="project.Dao.TransactionDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Transactions</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div id="searchid">
    <h2>Search the User by Id</h2>
    <form action="TransactionServlet" method="post">
        <input type="text" id="id" placeholder="Enter the Id" name="id">
        <input id="register" type="submit" value="Search">
        <input type="hidden" name="trans" value="1">
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
    User user = (User) session.getAttribute("message");
    if(user==null){
        List<Transactions> transactionList =  new TransactionDao(FactoryProvider.getFactory()).getAllTransactions();
        if(transactionList==null)
        {
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message1","No Record Found");
%>

<div>
    <%@include file="message.jsp"%>
</div>

<%
}else{
%>

<div class="card-body">
    <table>
        <tr class="top">
            <td>Transaction Id</td>
            <td>Transaction Paid Amount</td>
            <td>Transaction Date and Time</td>
        </tr>

        <%
            for (Transactions t : transactionList){
        %>

        <tr class="top">
            <td><%=t.getTransId()%></td>
            <td><%=t.getAmount()%></td>
            <td><%=t.getTime()%></td>
        </tr>

        <%}%>

    </table>
</div>
<% }
}
        else{
            %>
            <%
                List<Transactions> transactionList =  new TransactionDao(FactoryProvider.getFactory()).getAllTransactions();
                if(transactionList==null){
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message1","No Record Found");
                }
                else{
                    %>
                <div class="card-body">
                    <table>
                        <tr class="top">
                            <td>Transaction Id</td>
                            <td>Transaction Paid Amount</td>
                            <td>Transaction Date and Time</td>
                        </tr>

                        <%
                            for (Transactions t : transactionList){
                        %>

                        <tr class="top">
                            <td><%=t.getTransId()%></td>
                            <td><%=t.getAmount()%></td>
                            <td><%=t.getTime()%></td>
                        </tr>
                        <%}%>
                    </table>
                </div>
                    <%
                }
         }
}
    %>
</body>
</html>
