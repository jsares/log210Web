

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjouterLivre
 */
@WebServlet("/AjouterLivre")
public class AjouterLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String information = "";
	private String auteur = "";
	private String titre = "";
	private String prix = "";
	private String id = "";
	private String etat = "";
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
		
		information = request.getParameter("information");
		auteur = request.getParameter("auteur");
		titre = request.getParameter("titre");
		prix = request.getParameter("prix");
		id = request.getParameter("id");
		etat = request.getParameter("etat");
		System.out.println(information + " " + auteur + " " + titre + " " + prix + " " + id + " " + etat );
	}

}
