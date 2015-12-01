

import java.io.IOException;
import java.sql.DriverManager;
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
 * Servlet implementation class AjouterLivre
 */
@WebServlet("/RetourDuLivre")
public class RetourDuLivre extends HttpServlet {
	
	private String id = null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetourDuLivre() {
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
		String id = request.getParameter("id");
		String etudiant = (String) session.getAttribute("etudiant"); 
		
		int retour = new DAOReservations().rembourserLivre(id, etudiant);
		
		if(retour == 0){
			System.out.println("Retour réussit");
			request.getRequestDispatcher("/Accueil.jsp").forward(request, response);
		}
		else{
		request.getRequestDispatcher("/Accueil.jsp").forward(request, response);
		}
	}


}
