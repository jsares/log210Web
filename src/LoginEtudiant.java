

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class LoginEtudiant
 */
@WebServlet("/LoginEtudiant")
public class LoginEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String courriel = "";
	private String mdp = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginEtudiant() {
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
		HttpSession session = request.getSession();
		RequestDispatcher rd = request.getRequestDispatcher("Accueil.jsp");

		setCourriel(request.getParameter("courriel"));
		setMdp(request.getParameter("mdp"));
		Map<String, String> messages = new HashMap<String, String>();

		
		int login = new DAOCompte().loginEtudiant(courriel, mdp);
			if (login == 0) { //connection reussi
					session.setAttribute("loginEtudiant", courriel);
					rd = request.getRequestDispatcher("Accueil.jsp");
				}
			else if (login == -1) {  { //mdp ou courriel ne correspondent pas
					request.setAttribute("messages", messages); // Now it's available by ${messages}
					messages.put("erreurLogin", "Le courriel ou le mot de passe ne correspond pas");         
					rd = request.getRequestDispatcher("loginEtudiant.jsp");
				}
			}
			else { //mdp ou courriel ne correspondent pas
				request.setAttribute("messages", messages); // Now it's available by ${messages}
				messages.put("erreurLogin", "Nous éprouvons actuellement des difficultés");         
				rd = request.getRequestDispatcher("loginEtudiant.jsp");
			}

			rd.forward(request, response);
		

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

	public void setMdp(String pwd) {
		this.mdp = pwd;
	}

}
