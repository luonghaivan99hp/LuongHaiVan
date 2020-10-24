<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="ketqua.jsp" method="post">
       <h2>Cong tru nhan chia</h2>
        <label>So hang 1</label>
		<input id="a" type="text" name="a"><br>
		<label>So hang 2</label>
		<input id="b" type="text" name="b"><br>
		<div style="margin-left:68px;">
		<input id="+" type="submit" name="cong" value="+" >
		<input id="-" type="submit" name="tru" value="-">
		<input id="*" type="submit" name="nhan" value="*">
		<input id="/" type="submit" name="chia" value="/">
		</div>
	</form>
	
</body>
</html>