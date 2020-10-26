package dangnhap;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if("van".equals(username)&&"12345".equals(password)){
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("dangnhap");
			requestDispatcher.forward(request, response);
		}else{
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.print("ban da nhap sai");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("dangnhap");
					
	}
	}
}
