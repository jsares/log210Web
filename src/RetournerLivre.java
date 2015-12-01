

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
@WebServlet("/RetournerLivre")
public class RetournerLivre extends HttpServlet {
	
	private ArrayList<String[]> myListPaye = null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetournerLivre() {
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
		myListPaye = new DAOReservations().listePayed((String)session.getAttribute("etudiant"));  
		request.setAttribute("myListPaye", myListPaye);
		request.getRequestDispatcher("/ChoixRetourLivre.jsp").forward(request, response);
	}


}
