<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession ses = request.getSession();
    ses.invalidate();
    response.sendRedirect("index.jsp");
%>