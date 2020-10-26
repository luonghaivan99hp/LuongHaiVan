<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <%@include file="header.jsp" %>
     <%@include file="menu.jsp" %>
 
      <h3>Login Page</h3>
      <p style="color: red;"></p>
 
 
      <form method="post" action="login">
         <table border="0">
            <tr>
               <td>User Name</td>
               <td><input type="text" name="username" /> </td>
            </tr>
            <tr>
               <td>Password</td>
               <td><input type="text" name="password" /> </td>
            </tr>
            <tr>
               <td>Remember me</td>
               <td><input type="checkbox" name="rememberMe" /> </td>
            </tr>
            <tr>
               <td colspan ="2">
                  <input type="submit" value= "Submit" />
                  <a href="">Cancel</a>
               </td>
            </tr>
         </table>
      </form>
 
       <%@include file="footer.jsp" %>
</body>
</html>