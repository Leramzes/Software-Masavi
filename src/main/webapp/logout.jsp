<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession ses = request.getSession();
    ses.invalidate();
    response.sendRedirect("index.jsp");
%>