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
 
    <h3>Product List</h3>
 
    <p style="color: red;">${errorString}</p>
 
    <table border="1" cellpadding="5" cellspacing="1" >
       <tr>
          <th>Code</th>
          <th>Name</th>
          <th>Price</th>
          <th>Edit</th>
          <th>Delete</th>
       </tr>
          <tr>
             <td>P001</td>
             <td>Java Core</td>
             <td>2000.0</td>
             <td>
                <a href="">Edit</a>
             </td>
             <td>
                <a href="">Delete</a>
             </td>
          </tr>
          <tr>
             <td>P002</td>
             <td>C# Core</td>
             <td>190.0</td>
             <td>
                <a href="">Edit</a>
             </td>
             <td>
                <a href="">Delete</a>
             </td>
          </tr>
          <tr>
    	                <td>
	                    	<%
								String code = request.getParameter("code");
								out.print(code);
							%>
	                    </td>
	                    <td>
	                    	<%
								String name = request.getParameter("name");
								out.print(name);
							%>
	                    </td>
	                    <td>
	                    	<%
								String price = request.getParameter("price");
								out.print(price);
							%>
	                    </td>
	                    <td>
                <a href="">Edit</a>
             </td>
             <td>
                <a href="">Delete</a>
             </td>

</tr>
    </table>
    <a href="Question4.jsp" >Create Product</a>
    <%@include file="footer.jsp" %>
</body>
</html>