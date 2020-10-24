<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<input type="text" name="ket qua" value="
<%

		String a=request.getParameter("a");
		int a1=Integer.parseInt(a);
		String b=request.getParameter("b");
		int b1=Integer.parseInt(b);
		String cong1=request.getParameter("cong");
		String tru1=request.getParameter("tru");
		String nhan1=request.getParameter("nhan");
		String chia1=request.getParameter("chia");
	    if(cong1!=null){
	    	out.print(a1+b1);
	    }
	    else if(tru1!=null){
	    	out.print(a1-b1);
	    }
	    else if(nhan1!=null){
	    	out.print(a1*b1);
	    }
	    else{
	    	out.print((float)a1/b1);
	    }
%>">

</body>
</html>