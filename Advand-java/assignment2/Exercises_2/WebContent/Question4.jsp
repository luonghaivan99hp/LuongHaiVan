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
       
      <h3>Create Product</h3>
       
      <p style="color: red;">${errorString}</p>
       
      <form action="Question3.jsp">
         <table border="0">
            <tr>
               <td>Code</td>
               <td><input type="text" name="code"  /></td>
            </tr>
            <tr>
               <td>Name</td>
               <td><input type="text" name="name" /></td>
            </tr>
            <tr>
               <td>Price</td>
               <td><input type="text" name="price" " /></td>
            </tr>
            <tr>
               <td colspan="2">                   
                   <input type="submit" value="Submit" />
                   <a href="productList">Cancel</a>
               </td>
            </tr>
         </table>
      </form>
       
</body>
</html>