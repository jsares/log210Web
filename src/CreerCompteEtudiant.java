

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreerCompteeEtudiant
 */
@WebServlet(name = "CreerCompteEtudiant", urlPatterns = { "/CreerCompteEtudiant" })
public class CreerCompteEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String courriel = "";
	private String mdp = "";
	private String confirmerMdp = "";
	/**
	 * @see HttpServlet#HttpServlet()
	 */


	public CreerCompteEtudiant() {
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
		setCourriel(request.getParameter("courriel"));
		setMdp(mdp = request.getParameter("mdp"));
		setConfirmerMdp(request.getParameter("confirmerMdp"));
		
		if(verifierMdpIdentique()){
			if(validerChampsVide())
				this.getServletContext().getRequestDispatcher("/ConfirmerCreationCompte.jsp").forward(request, response);
			else
				this.getServletContext().getRequestDispatcher("/CreerCompteEtudiant.jsp").forward(request, response);
		}
		else
			this.getServletContext().getRequestDispatcher("/CreerCompteEtudiant.jsp").forward(request, response);
	}


	private boolean validerChampsVide() {
		if(courriel.length() > 1 || mdp.length() > 1 || confirmerMdp.length() > 1) return true;
		return false;
	}

	private boolean verifierMdpIdentique() {
		if(this.mdp.equals(confirmerMdp)) return true;
		return false;		
	}

	public String getCourriel() {
		return courriel;
	}

	public void setCourriel(String courriel) {
		this.courriel = courriel;
	}

	public String getMdp() {
		return mdp;
	}

	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public String getConfirmerMdp() {
		return confirmerMdp;
	}

	public void setConfirmerMdp(String confirmerMdp) {
		this.confirmerMdp = confirmerMdp;
	}

}
