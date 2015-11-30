

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
 * Servlet implementation class CreerCompteGestionnaire
 */
@WebServlet("/CreerCompteGestionnaire")
public class CreerCompteGestionnaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String courriel = "";
	private String mdp = "";
	private String confirmerMdp = "";
	private String nom = "";
	private String prenom = "";
	private String adresse = "";
	private String telephone = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreerCompteGestionnaire() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		setCourriel(request.getParameter("courriel"));
		setMdp(request.getParameter("mdp"));
		setConfirmerMdp(request.getParameter("confirmerMdp"));
		setNom(request.getParameter("nom"));
		setPrenom(request.getParameter("prenom"));
		setAdresse(request.getParameter("adresse"));
		setTelephone(request.getParameter("telephone"));
		
		if(verifierMdpIdentique()){
			if(validerChampsVide()){
				
				new DAOCompte().creerCompteGestionnaire(courriel, mdp, nom, prenom, adresse, telephone);
				
				this.getServletContext().getRequestDispatcher("/ConfirmerCreationCompte.jsp").forward(request, response);
			}else
				this.getServletContext().getRequestDispatcher("/CreerCompteGestionnaire.jsp").forward(request, response);
		}
		else
		{
			this.getServletContext().getRequestDispatcher("/CreerCompteGestionnaire.jsp").forward(request, response);
		}}

	private boolean validerChampsVide() {
		if(courriel.length() < 1 || mdp.length() < 1 || confirmerMdp.length() < 1
				|| nom.length() < 1 || prenom.length() < 1 || adresse.length() < 1) return false;
		return true;
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
	
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getConfirmerMdp() {
		return confirmerMdp;
	}

	public void setConfirmerMdp(String confirmerMdp) {
		this.confirmerMdp = confirmerMdp;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}


}
