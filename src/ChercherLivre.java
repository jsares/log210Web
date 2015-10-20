

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class CreerCompteeEtudiant
 */
@WebServlet("/ChercherLivre" )
public class ChercherLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String entree = "";
	private String typeEntree = "";
	private String information = "";
	private String auteur = "";
	private String titre = "";
	private String prix = "";
	private String id = "";
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */


	public ChercherLivre() {
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
		
		
		
		if (request.getParameter("ISBN_Button") != null) {
            typeEntree = "ISBN";
            setEntree(request.getParameter("code"));
        } else if (request.getParameter("UPC_Button") != null) {
        	typeEntree = "UPC";
        	setEntree(request.getParameter("code"));
        } else if (request.getParameter("Auteur_Button") != null) {
        	typeEntree = "Auteur";
        	setEntree(request.getParameter("auteur"));
		} else if (request.getParameter("Titre_Button") != null) {
			typeEntree = "Titre";
			setEntree(request.getParameter("titre"));
		}
		
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibrairieLog210","root","toor");
				Statement st= (Statement) con.createStatement(); 
				ResultSet rs;
				if(typeEntree == "Titre"){
					rs=st.executeQuery("Select * from livres where titre like '"+entree+"%'"); 
				}
				else{
					rs=st.executeQuery("Select * from livres where "+typeEntree+" ='"+entree+"'"); 
				}
				
				if(rs.next()){
				information = (rs.getString(6) ); 
				auteur = (rs.getString(5) ); 
				titre = (rs.getString(4) ); 
				prix = (rs.getString(7) ); 
				id = (rs.getString(1) ); 
				System.out.println(id + prix);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			request.setAttribute("information", information);
			request.setAttribute("titre", titre);
			request.setAttribute("auteur", auteur);
			request.setAttribute("prix", prix);
			request.setAttribute("id", id);
			request.getRequestDispatcher("/LivreEnCours.jsp").forward(request, response);
		}
		
	
	
	
	
	
	

	



	public void setEntree(String entree) {
		this.entree = entree;
	}


}
