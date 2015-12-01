import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DAOLivre {

	Connection con = (Connection) DerbyUtils.getConnection();
	
	public DAOLivre(){
		
	}
	
	public void enleverLivre(String id){
		

		Statement st = null;
		con = (Connection) DerbyUtils.getConnection();
		ResultSet rs = null;
		
		try {
			st= (Statement) con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans eleverLivre!");
		}
		
		try {
			int rsq=st.executeUpdate("delete from livres where id = '"+id+"'"+"");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Ca va mal dans enleverLivre2!");
		}
	}
	
	
}
