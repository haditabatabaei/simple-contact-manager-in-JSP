<%@ page import="data.DataCenter" %>
<%@ page import="data.Account" %><%--
  Created by IntelliJ IDEA.
  User: Hadi-PC
  Date: 12/7/2018
  Time: 12:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% DataCenter dataCenter = DataCenter.getInstance();
String username = request.getParameter("userName");
String password = request.getParameter("password");
boolean loginResult = dataCenter.login(username,password);
    System.out.println(username + " " + password + " " + loginResult);
if(loginResult){
    session.setAttribute("userid",username);
}
    response.sendRedirect("index.jsp");
%>