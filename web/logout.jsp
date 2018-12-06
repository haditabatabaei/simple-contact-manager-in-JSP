<%--
  Created by IntelliJ IDEA.
  User: Hadi-PC
  Date: 12/7/2018
  Time: 1:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("userid","");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
