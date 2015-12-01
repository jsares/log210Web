import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DAOReservations {

	Connection con = null;
	
	public DAOReservations(){
		
	}
	
	public void reserverLivre(String utilisateur, String id, String prix){
		
	Statement st = null;
		
	con = (Connection) DerbyUtils.getConnection();
	try {
		st= (Statement) con.createStatement();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
		System.out.println("Le statement dans reserverLivre n'a pas été créé");
	} 
	try {
		int rs=st.executeUpdate("INSERT INTO reservation (etudiant, id, prix, payed) VALUES ('"+(utilisateur)+"', '"+(id)+"', '"+(prix)+"','"+(0)+"')");
		System.out.println("La reservation c<est fait sur le nom de :"+utilisateur);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le executeUpdate dans reserverLivre n'a pas été effectué");
	} 
		
		}
	
	public ArrayList<String[]> listeReserved(String utilisateur){
		
		ArrayList<String[]> myListReserve;
		
		Statement st = null;
		con = (Connection) DerbyUtils.getConnection();
		ResultSet rs = null;
		
		try {
			st= (Statement) con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans listeReserved!");
		} 
		int prixInt = 0;
		try {
			rs=st.executeQuery("Select * from reservation where etudiant='"+utilisateur+"'");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans listeReserved!");
		} 
	
		myListReserve = new ArrayList<String[]>();  
		
		try {
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
						System.out.println("Ca va mal dans listeReserved!");
					} 

			}
				
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Ca va mal dans listeReserved!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Ca va mal dans listeReserved!");
		}
		return myListReserve;
		}
	
	public ArrayList<String[]> listePayed(String utilisateur){
		
		ArrayList<String[]> myListPayed;
		
		Statement st = null;
		con = (Connection) DerbyUtils.getConnection();
		ResultSet rs = null;
		
		try {
			st= (Statement) con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans listePayed!");
		} 
		try {
			rs=st.executeQuery("Select * from reservation where etudiant='"+utilisateur+"'");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans listePayed!");
		} 
	
		myListPayed = new ArrayList<String[]>();  
		
		try {
			while(rs.next()){
				
				if(Integer.parseInt(rs.getString(1))==1){
					String id= (rs.getString(2) ); 
					
					try {
						Statement st1= (Statement) con.createStatement(); 
						ResultSet rqs;
						rqs=st1.executeQuery("Select * from livres where id='"+id+"'"); 
						
						if(rqs.next()){
							myListPayed.add(new String[] {rqs.getString(4), rqs.getString(5), rqs.getString(7), rqs.getString(6), rqs.getString(1) });
						}
						
					
					
					}
					catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("Ca va mal dans listePayed!");
					} 

			}
				
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Ca va mal dans listePayed!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Ca va mal dans listePayed!");
		}
		return myListPayed;
		}
		
	public String getPrixReserved(String utilisateur){

		int prixInt = 0;
		
		Statement st = null;
		con = (Connection) DerbyUtils.getConnection();
		ResultSet rs = null;
		
		try {
			st= (Statement) con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans getPrix!");
		}
		
		try {
			rs=st.executeQuery("Select * from reservation where etudiant='"+utilisateur+"'");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans getPrix!");
		}
		 
		
		try {
			while(rs.next()){
					
					if(Integer.parseInt(rs.getString(1))==0){
						String id;
						
							id = (rs.getString(2) );
							System.out.println("id trouvÉ pour getprix :"+id);
						
						
						try {
							Statement st1= (Statement) con.createStatement(); 
							ResultSet rqs;
							rqs=st1.executeQuery("Select * from livres where id='"+id+"'"); 
							
							if(rqs.next()){
								prixInt = prixInt + Integer.parseInt(rqs.getString(7));
							}
							
						}
						catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							System.out.println("Ca va tres mal dans getPrix!");
						} 

				}
				
					
			
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Ca va mal dans getPrix!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Ca va mal dans getPrix!");
		}
		return String.valueOf((int) prixInt);
		
	}
	
	public void libererLivres(String utilisateur){
		
	
		Statement st = null;
		Statement sts = null;
		con = (Connection) DerbyUtils.getConnection();
		ResultSet rs = null;
		
		try {
			st= (Statement) con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans LibererLivre!");
		}
		
		try {
			rs=st.executeQuery("Select * from reservation where etudiant ='"+utilisateur+"'");
			System.out.println("Libre string ="+rs.getString(1));
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans LibererLivre2!");
		}
		
		try {
			while(rs.next()){
					
					System.out.println("Livre string ="+rs.getString(2));
					sts= (Statement) con.createStatement();
					int rsq=sts.executeUpdate("delete from reservation where id = '"+rs.getString(2)+"'"+"");
					new DAOLivre().enleverLivre(rs.getString(2));
					
				}
				
			
				
				
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Ca va mal dans LibererLivre3!");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	}
	
	public int rembourserLivre(String id, String utilisateur ){
		int retour = 2;
		
		Statement st = null;
		con = (Connection) DerbyUtils.getConnection();
		ResultSet rs = null;
		
		try {
			st= (Statement) con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans RembourserLivre!");
		}
		
		try {
			rs=st.executeQuery("Select * from reservation where id ='"+id+"'");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans RembourserLivre!");
		}
		
		try {
			if(rs.next()){
				System.out.println("Ceci devrai etre un email : /"+utilisateur+"/ /"+rs.getString(3)+"/");
				
					
					
					int rsq=st.executeUpdate("delete from reservation where id = '"+id+"'"+"");
					retour = 0;
				
			
			
				
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return retour;
		
	}
	
	
	
}
