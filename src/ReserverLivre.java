

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
@WebServlet("/ReserverLivre")
public class ReserverLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id ="";
	private String prix = "";
	private String titre = "";
	private String auteur = "";
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */


	public ReserverLivre() {
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
		
				
		
		if (request.getParameter("Reserver") != null) {
            id = (String) (request.getSession().getAttribute("id"));
            prix =  (String) (request.getSession().getAttribute("prix"));
            System.out.println(id + prix);
            try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
            
            java.sql.Connection con;
			try {
				
				con = DriverManager.getConnection("jdbc:mysql://localhost:3307/LibrairieLog210","admin","admin");
				Statement st= (Statement) con.createStatement(); 
				int rs=st.executeUpdate("INSERT INTO reservation (etudiant, id, prix, payed) VALUES ('"+(session.getAttribute("utilisateur"))+"', '"+(this.id)+"', '"+(this.prix)+"','"+(0)+"')"); 
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
		
			request.getRequestDispatcher("/LivreReserves.jsp").forward(request, response);
        } 
		
		else if(request.getParameter("Retour") != null){
			
			request.getRequestDispatcher("/ChercherLivre.jsp").forward(request, response);
		}
		
			
			

			
			
		}
		
	
	
	
	
	
	

	


}
