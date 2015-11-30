

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
 * Servlet implementation class LoginGestionnaire
 */
@WebServlet("/LoginGestionnaire")
public class LoginGestionnaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String courriel = "";
	private String mdp = "";
	private String telephone = "";
	
       
	/**
     * @see HttpServlet#HttpServlet()
     */
    public LoginGestionnaire() {
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
		setMdp(mdp =request.getParameter("mdp"));
		setTelephone(request.getParameter("telephone"));
		Map<String, String> messages = new HashMap<String, String>();

		if (request.getParameter("bmail") != null){
		int login = new DAOCompte().loginGestionnaireEmail(courriel, mdp);
			if (login == 0) { //connection reussi
					session.setAttribute("loginGestionnaire", courriel);
					rd = request.getRequestDispatcher("AcceuilGestionnaire.jsp");
				}
			else if (login == -1){ //mdp ou courriel ne correspondent pas
					request.setAttribute("messages", messages); // Now it's available by ${messages}
					messages.put("erreurLogin", "Le courriel ou le mot de passe ne correspond pas");         
					rd = request.getRequestDispatcher("loginGestionnaire.jsp");
				}
			
			else { //mdp ou courriel ne correspondent pas
				request.setAttribute("messages", messages); // Now it's available by ${messages}
				messages.put("erreurLogin", "Nous éprouvons actuellement des difficultés");         
				rd = request.getRequestDispatcher("loginGestionnaire.jsp");
			}

			rd.forward(request, response);
	}
	
		
		if (request.getParameter("btel") != null){
			int login = new DAOCompte().loginGestionnaireTel(telephone, mdp);
				if (login == 0) { //connection reussi
						setCourriel(new DAOCompte().getEmail(telephone));	
						if(courriel == null){
							System.out.println("SETTING EMAIL FROM TELEPHONE FAILED, CHECK GETEMAIL METHOD");
						}
						session.setAttribute("loginGestionnaire", courriel);
						rd = request.getRequestDispatcher("AcceuilGestionnaire.jsp");
					}
					else { //mdp ou courriel ne correspondent pas
						request.setAttribute("messages", messages); // Now it's available by ${messages}
						messages.put("erreurLogin", "Le telephone ou le mot de passe ne correspond pas");         
						rd = request.getRequestDispatcher("loginGestionnaire.jsp");
					}
				}
				else { //mdp ou courriel ne correspondent pas
					request.setAttribute("messages", messages); // Now it's available by ${messages}
					messages.put("erreurLogin", "Nous éprouvons actuellement des difficultés");         
					rd = request.getRequestDispatcher("loginGestionnaire.jsp");
				}

				rd.forward(request, response);
			
			}

	
	
	  public String getCourriel() {
			return courriel;
		}

		public void setCourriel(String courriel) {
			this.courriel = courriel;
		}
		public String getTelephone() {
			return telephone;
		}

		public void setTelephone(String telephone) {
			this.telephone = telephone;
		}


		public String getMdp() {
			return mdp;
		}

		public void setMdp(String mdp) {
			this.mdp = mdp;
		}

}
