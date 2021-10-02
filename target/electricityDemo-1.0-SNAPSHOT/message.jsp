<%
    String message=(String) session.getAttribute("message1");
    if(message!=null){
%>
<div class="alert alert-a alert-dismissible fade show" role="alert">
    <strong><%=message%></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        session.removeAttribute("message1");
    }
%>