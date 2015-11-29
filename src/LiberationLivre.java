
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
@WebServlet("/LiberationLivre")
public class LiberationLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id ="";
	private String email = "";
	private ArrayList<String[]> ListePayes = null;
	/**
	 * @see HttpServlet#HttpServlet()
	 */


	public LiberationLivre() {
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
		
            email = request.getParameter("emailE");
            System.out.println("EMAIL RECONNU =" + email);
            
            try {
            	
            
			Class.forName("com.mysql.jdbc.Driver");			
            java.sql.Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/LibrairieLog210","root","toor");
			 	ResultSet rs;
				Statement st= (Statement) con.createStatement(); 
				rs=st.executeQuery("SELECT * FROM reservation where payed = '1' AND etudiant = '"+email+"'"); /////////////////
				
				
				ListePayes = new ArrayList<String[]>(); 
				
				System.out.println("Connection 1 etablit");
					while(rs.next()){
						
							
							try {
								Statement st1= (Statement) con.createStatement(); 
								ResultSet rqs;
								rqs=st1.executeQuery("Select * from livres where id='"+rs.getString(1)+"'"); 
								System.out.println("Connection 2 etablit");
								System.out.println("ID Utilisé =" + rs.getString(1));
								if(rqs.next()){
									ListePayes.add(new String[] {rqs.getString(4), rqs.getString(5)});
								}
								
							
							
							}
							catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} 
						
			        	
			        
			        	}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} 
				
				
				

			
            request.setAttribute("ListePayes", ListePayes);
			request.getRequestDispatcher("/LivreALiberer.jsp").forward(request, response);
        }
}
		
		
			