<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="border:1px solid black ;width:500px;margin-left:240px;">
                 <div style="padding: 12px 20px;">
             <form action="thongtin.jsp">
               <pre><b style="font-family: Times New Roman">Họ tên:</b>         <input type="text" name="hoten" id="hoten" required style="width: 300px;"></pre>
               <pre><b style="font-family: Times New Roman">Năm sinh:</b>       <input type="text" name="namsinh" id="namsinh" required style="width: 300px;"></pre>
               <pre><b style="font-family: Times New Roman">Giới tính:</b>      <input type="radio" checked name="gioitinh">Nam  <input type="radio"  name="gioitinh">Nữ</pre>
               <pre><b style="font-family: Times New Roman">Số điện thoại:</b>    <input type="text" name="sodienthoai" id="sodienthoai" required style="width: 300px;"></pre>
                <input type="submit" class="btn btn-primary " value="Thêm" style="margin-left: 310px;background-color: white;" >
		        <input type="reset" class="btn btn-secondary" value="Hủy" style="margin-left: 0px;background-color: white;">
                </form>
                </div>
                
</body>
</html>