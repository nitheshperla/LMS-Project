package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDAO;
/**
 * Servlet implementation class UserControllerServlet
 */
@WebServlet("/UserControllerServlet")
public class UserControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String userName = request.getParameter("uname");
	        String password = request.getParameter("pword");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("number");
	        String state = request.getParameter("state");
	        String gender = request.getParameter("gender");
	        String name = request.getParameter("firstname");
	 
	        HttpSession session = request.getSession(true);
	        try {
	            UserDAO userDAO = new UserDAO();
	            userDAO.addUserDetails(userName, password, email, phone, state, gender,name);
	            response.sendRedirect("login.jsp");
	            return;
	        } catch (Exception e) {
	 
	            e.printStackTrace();
	        }
	 
	}

}