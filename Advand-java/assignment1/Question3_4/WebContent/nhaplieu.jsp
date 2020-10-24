<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">

</head>
<body>
<table>
<thead>
<tr>
<th>STT</th>
<th>Ten VXL</th>
<th>Hang sx</th>
<th>Ngay ra mat</th>
<th>Gia</th>
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
								String name = request.getParameter("name");
								out.print(name);
							%>
	                    </td>
	                    <td>
	                    	<%
								String hang = request.getParameter("hang");
								out.print(hang);
							%>
	                    </td>
	                    <td>
	                    	<%
								String ngay = request.getParameter("date");
								out.print(ngay);
							%>
	                    </td>
	                    <td>
	                    	<%
								String gia = request.getParameter("gia");
								out.print(gia);
							%>
	                    </td>

</tr>
</table><br>
             <div style="border:1px solid black ;width:200px;margin-left:790px;">
                 <div style="padding: 12px 20px;">
             <form action="nhaplieu.jsp">
                <label for="Tên VXL"><b>Tên VXL</b></label><br>
                <input type="text" placeholder="Tên VXL" name="name" id="Tên VXL" required><br>

                <label for="Hãng"><b>Hãng</b></label><br>
                <input type="text" placeholder="Hãng" name="hang" id="Hãng" required><br>

                <label for="Ngày ra mắt"><b>Ngày ra mắt</b></label><br>
                <input type="time"  name="date" id="Ngày ra mắt" required><br>
                
                <label for="Giá"><b>Giá</b></label><br>
                <input type="text" placeholder="Giá" name="gia" id="Giá" required><br>
                <input type="submit" class="btn btn-primary " value="Thêm" style="margin-left: 47px;" >
		        <input type="reset" class="btn btn-secondary" value="Hủy" style="margin-left: 0px;">
		           
                </form>
                </div>
</body>
</html>