

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class CreerCompteeEtudiant
 */
@WebServlet("/LivrePaye" )
public class LivrePaye extends HttpServlet {
	/**
	 * @see HttpServlet#HttpServlet()
	 */


	public LivrePaye() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			
			java.sql.Connection con;
			try {
				
				con = DriverManager.getConnection("jdbc:mysql://localhost:3307/LibrairieLog210","admin","admin");
				Statement st= (Statement) con.createStatement(); 
				int rs=st.executeUpdate("update reservation set payed = 1 where etudiant = '"+session.getAttribute("utilisateur")+"' ");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		
			request.getRequestDispatcher("/Merci.jsp").forward(request, response);
		}
		
	
	
	
	
	
	

	



}
