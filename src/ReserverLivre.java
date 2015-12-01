

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
@WebServlet("/ReserverLivre")
public class ReserverLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id ="";
	private String prix = "";
	private String titre = "";
	private String utilisateur = "";
	private String auteur = "";
	private ArrayList<String[]> myListPaye = null;
	private ArrayList<String[]> myListReserve = null;
	
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
            utilisateur = (String) (request.getSession().getAttribute("loginEtudiant"));
            System.out.println(id +""+ prix);
                       
            //reservation du livre
			new DAOReservations().reserverLivre(utilisateur, id, prix);
			
			/////ListeReserve
			
				myListReserve = new DAOReservations().listeReserved(utilisateur);
				
							     
			/////ListPayé
			
				myListPaye = new DAOReservations().listePayed(utilisateur);  
				
				prix = new DAOReservations().getPrixReserved(utilisateur);
					
		
			request.setAttribute("myListReserve", myListReserve);
			request.setAttribute("myListPaye", myListPaye);
			request.setAttribute("prix", prix);
		
			request.getRequestDispatcher("/LivreReserves.jsp").forward(request, response);
        } 
		
		else if(request.getParameter("Retour") != null){
			
			request.getRequestDispatcher("/ChercherLivre.jsp").forward(request, response);
		}
		
			
			

			
			
		}
		
	
	
	
	
	
	

	


}
