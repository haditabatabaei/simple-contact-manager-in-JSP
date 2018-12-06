<%@ page import="sun.text.resources.cldr.pa.FormatData_pa_Arab" %>
<%@ page import="data.DataCenter" %><%--
  Created by IntelliJ IDEA.
  User: Hadi-PC
  Date: 12/7/2018
  Time: 1:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ include file="index.jsp" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean registerResult = false;
    if (request.getMethod().equals("POST")) {
        String username, password;
        username = request.getParameter("userName");
        password = request.getParameter("password");
        DataCenter dataCenter = DataCenter.getInstance();
        registerResult = dataCenter.registerAccount(username, password);
    }
%>
<html>
<head>
    <title>Registration Status</title>
</head>
<body>
<script>document.write("")</script>
<% if (registerResult) {%>
<h2 class="text-center text-success">Registration Completed.</h2>
<a href="index.jsp" class="text-center my-auto text-info">Click here to login</a>
<%} else { %>
<h2 class="text-center text-danger">Registration Failed.Try Again</h2>
<% } %>
</body>
</html>
