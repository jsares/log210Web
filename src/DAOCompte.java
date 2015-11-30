import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DAOCompte {

Connection con = (Connection) DerbyUtils.getConnection();

public DAOCompte(){
	
}
	
public void creerCompteEtudiant(String courriel, String mdp){
	Statement st = null;
	try {
		st = (Statement) con.createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le statement pour creerCompteEtudiant n'a pas été créé ");
	} 
	try {
		int rs=st.executeUpdate("INSERT INTO etudiants (email, password) VALUES ('"+courriel+"', '"+mdp+"')");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le executeUpdate pour creerCompteEtudiant a échoué ");
	} 
}



public void creerCompteGestionnaire(String courriel, String mdp, String nom, String prenom, String adresse, String telephone){
	Statement st = null;
	try {
		st= (Statement) con.createStatement();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
		System.out.println("Le statement pour creerCompteGestionnaire n'a pas été créé ");
	} 
	try {
		int rs=st.executeUpdate("INSERT INTO gestionnaire (email, password, nom, prenom, adresse, telephone) VALUES ('"+courriel+"','"+mdp+"','"+nom+"','"+prenom+"','"+adresse+"', '"+telephone+"')");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le executeUpdate pour creerCompteGestionnaire a échoué ");
	} 
}

/**
 * @param courriel
 * @param mdp
 * @return 2 if bug // -1 if bad password // 0 if good
 */
public int loginEtudiant(String courriel, String mdp){
	int retour = 2;
	Statement st = null;
	try {
		st = (Statement) con.createStatement();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
		System.out.println("Le statement pour loginEtudiant a échoué ");
	} 
	ResultSet rs = null;
	try {
		rs = st.executeQuery("select password from etudiants where email = '" + courriel + "'");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le executeQuery pour loginEtudiant a échoué ");
	}
	
	try {
		if (rs.next()) { //connection reussi
			if (rs.getString("password").equals(mdp)) {
				retour = 0;
			}
			else { //mdp ou courriel ne correspondent pas
				retour = -1;
			}
		}
		else { //mdp ou courriel ne correspondent pas
			retour = -1;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le rs.next() pour loginEtudiant a échoué ");
	}
	
	return retour;

	
	
}

public int loginGestionnaireEmail(String courriel, String mdp){
	
	int retour = 2;
	

	Statement st= null;
	ResultSet rs = null;
	
	try {
		st = (Statement) con.createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le statement pour loginGestionnaire a échoué ");
	} 
	try {
		rs = st.executeQuery("select password from gestionnaire where email = '" + courriel + "'");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le executeQuery pour loginGestionnaire a échoué ");
	}
	
	try {
		if (rs.next()) { //connection reussi
			if (rs.getString("password").equals(mdp)) {
				retour = 0;
			}
			else { //mdp ou courriel ne correspondent pas
				retour = -1;
			}
		}
		else { //mdp ou courriel ne correspondent pas
			retour = -1;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le rs.next() pour loginGestionnaire a échoué ");
	}

	return retour;
}

public int loginGestionnaireTel(String telephone, String mdp) {
int retour = 2;
	

	Statement st= null;
	ResultSet rs = null;
	
	try {
		st = (Statement) con.createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le statement pour loginGestionnaire a échoué ");
	} 
	try {
		rs = st.executeQuery("select password from gestionnaire where telephone = '" + telephone + "'");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le executeQuery pour loginGestionnaire a échoué ");
	}
	
	try {
		if (rs.next()) { //connection reussi
			if (rs.getString("password").equals(mdp)) {
				retour = 0;
			}
			else { //mdp ou courriel ne correspondent pas
				retour = -1;
			}
		}
		else { //mdp ou courriel ne correspondent pas
			retour = -1;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Le rs.next() pour loginGestionnaire a échoué ");
	}

	return retour;
}

public String getEmail(String telephone) {
	Statement st= null;
	ResultSet rs = null;
	String retour = null;
	try {
		st = (Statement) con.createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		rs = st.executeQuery("select password from gestionnaire where telephone = '" + telephone + "'");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		if (rs.next()) { //connection reussi
			retour = rs.getString("email");
}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return retour;
}



	
}
