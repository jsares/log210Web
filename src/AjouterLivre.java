

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class AjouterLivre
 */
@WebServlet("/AjouterLivre")
public class AjouterLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String auteur = "";
	private String titre = "";
	private String prix = "";
	private String id = "";
	private String etat = "";
	private String isbn = "";
	private String ean = "";
	private String upc = "";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterLivre() {
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
		
		auteur = request.getParameter("auteur");
		titre = request.getParameter("titre");
		prix = request.getParameter("prix");
		id = request.getParameter("id");
		etat = request.getParameter("etat");
		isbn = request.getParameter("isbn");
		upc = request.getParameter("upc");
		ean = request.getParameter("ean");
		
		prix = determinerPrix(etat,prix);
		
		checkIfNull();
		
		if(ajouterLivre(auteur, titre, prix, etat, isbn, upc, ean)){
			preparerInfo(request);
			request.getRequestDispatcher("/LivreEnCours.jsp").forward(request, response);
		}
		

	}

	private void checkIfNull() {
		if(auteur == null)
			auteur = "";
		if(titre == null)
			titre = "";
		if(prix == null)
			prix = "";
		if(id == null)
			id = "";
		if(etat == null)
			etat = "";
		if(isbn == null || isbn == "")
			isbn = "0";
		if(upc == null)
			upc = "0";
		if(ean == null)
			ean = "0";
		
	}

	private String determinerPrix(String etat, String prix) {
		double prixFinal = Double.parseDouble(prix);
		if(etat.equals("Bon"))
			prixFinal *= 0.75;
		else if(etat.equals("Passable"))
			prixFinal *= 0.50;
		else if(etat.equals("Critique"))
			prixFinal *= 0.25;
		
		return String.valueOf(prixFinal);
	}

	private void preparerInfo(HttpServletRequest request) {
		request.setAttribute("auteur", auteur);
		request.setAttribute("titre", titre);
		request.setAttribute("etat", etat);
		request.setAttribute("prix", prix);
	}

	private boolean ajouterLivre(String auteur, String titre, String prix, String etat, String isbn, String upc, String ean) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		java.sql.Connection con;
		try {

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librairieLog210","root","toor");
			Statement st= (Statement) con.createStatement(); 
			int rs=st.executeUpdate("INSERT INTO livres (ISBN,UPC, titre, auteur, prix, etat, ean) VALUES ('"+isbn+"', '"+upc+"', '"+titre+"','"+auteur+"','"+prix+"','"+etat+"','"+ean+"')"); 
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return false;
		
	}

}
