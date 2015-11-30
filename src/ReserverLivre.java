

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
@WebServlet("/ReserverLivre")
public class ReserverLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id ="";
	private String prix = "";
	private String titre = "";
	private String auteur = "";
	private ArrayList<String> myListPaye = null;
	private ArrayList<String[]> myListReserve = null;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */


	public ReserverLivre() {
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
		
				
		
		if (request.getParameter("Reserver") != null) {
            id = (String) (request.getSession().getAttribute("id"));
            prix =  (String) (request.getSession().getAttribute("prix"));
            System.out.println(id + prix);
                       
            java.sql.Connection con;
			try {
				
				con = DerbyUtils.getConnection();
				Statement st= (Statement) con.createStatement(); 
				int rs=st.executeUpdate("INSERT INTO reservation (etudiant, id, prix, payed) VALUES ('"+(session.getAttribute("utilisateur"))+"', '"+(this.id)+"', '"+(this.prix)+"','"+(0)+"')"); 
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			/////ListeReserve
			try {
				
				con = DerbyUtils.getConnection();
				Statement st= (Statement) con.createStatement(); 
				int prixInt = 0;
				ResultSet rs=st.executeQuery("Select * from reservation where etudiant='"+session.getAttribute("utilisateur")+"'"); 
			
				myListReserve = new ArrayList<String[]>();  
				
				while(rs.next()){
					
		        	if(Integer.parseInt(rs.getString(1))==0){
						String id= (rs.getString(2) ); 
						
						try {
							Statement st1= (Statement) con.createStatement(); 
							ResultSet rqs;
							rqs=st1.executeQuery("Select * from livres where id='"+id+"'"); 
							
							if(rqs.next()){
								myListReserve.add(new String[] {rqs.getString(4), rqs.getString(5), rqs.getString(7)});
							}
							
							prixInt = prixInt + Integer.parseInt(rqs.getString(7));
						
						
						}
						catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} 
					
		        	
		        
		        	}}
				prix = (""+prixInt+"");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			/////ListPayé
			try {
				
				con = DerbyUtils.getConnection();
				Statement st= (Statement) con.createStatement(); 
				ResultSet rs=st.executeQuery("Select * from reservation where etudiant='"+session.getAttribute("utilisateur")+"'"); 
			
				myListPaye = new ArrayList<String>();  
				
				while(rs.next()){
					
		        	if(Integer.parseInt(rs.getString(1))==1){
						String id= (rs.getString(2) ); 
						
						try {
							Statement st1= (Statement) con.createStatement(); 
							ResultSet rqs;
							rqs=st1.executeQuery("Select * from livres where id='"+id+"'"); 
							
							if(rqs.next()){
								myListPaye.add(rqs.getString(4));
							}
							
						
						
						}
						catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} 
					
		        	
		        
		        	}}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		
			request.setAttribute("myListReserve", myListReserve);
			request.setAttribute("myListPaye", myListPaye);
			request.setAttribute("prix", prix);
		
			request.getRequestDispatcher("/LivreReserves.jsp").forward(request, response);
        } 
		
		else if(request.getParameter("Retour") != null){
			
			request.getRequestDispatcher("/ChercherLivre.jsp").forward(request, response);
		}
		
			
			

			
			
		}
		
	
	
	
	
	
	

	


}
