<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table,th,td{
	border:1px solid black;
	text-align: center;
}
table{
	border-collapse: collapse;
	width:100%;
}
</style>
</head>
<body>
<h1  style="margin-left: 250px;">Danh sách nhân viên</h1>
<table>
<thead>
<tr>
<th>STT</th>
<th>Họ tên</th>
<th>Năm sinh</th>
<th>Giới tính</th>
<th>Số điện thoại</th>
</tr>
<tr>
	                    <td>
	                    	<%
								int stt = 0;
	                    		stt++;
								out.print(stt);
							%>
	                    </td>
    	                <td>
	                    	<%
								String hoten = request.getParameter("hoten");
								out.print(hoten);
							%>
	                    </td>
	                    <td>
	                    	<%
								String namsinh = request.getParameter("namsinh");
								out.print(namsinh);
							%>
	                    </td>
	                    <td>
	                    	<%
								String gioitinh = request.getParameter("gioitinh");
								out.print(gioitinh);
							%>
	                    </td>
	                    <td>
	                    	<%
								String sodienthoai = request.getParameter("sodienthoai");
								out.print(sodienthoai);
							%>
	                    </td>

</tr>
</table>
</body>
</html>