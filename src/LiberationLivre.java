
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
@WebServlet("/LiberationLivre")
public class LiberationLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id ="";
	private String email = "";
	private ArrayList<String[]> ListePayes = null;
	/**
	 * @see HttpServlet#HttpServlet()
	 */


	public LiberationLivre() {
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
		
            email = request.getParameter("emailE");
            System.out.println("EMAIL RECONNU =" + email);
            session.setAttribute("etudiant", email);
           
			ListePayes = new DAOReservations().listePayed(email);
				
				
				

			
            request.setAttribute("ListePayes", ListePayes);
			request.getRequestDispatcher("/LivreALiberer.jsp").forward(request, response);
        }
}
		
		
			