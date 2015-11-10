

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class CreerCompteeEtudiant
 */
@WebServlet("/ChercherLivre" )
public class ChercherLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String entree = "";
	private String typeEntree = "";
	private String information = "";
	private String auteur = "";
	private String titre = "";
	private String prix = "";
	private String id = "";
	private String etat = "";
	private String accesKey = "RI48ATRC";

	/**
	 * @see HttpServlet#HttpServlet()
	 */


	public ChercherLivre() {
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

		
		setTypeEntree(request);


		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {

			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librairieLog210","root","toor");
			Statement st= (Statement) con.createStatement(); 
			ResultSet rs;
			if(typeEntree == "Titre"){
				rs=st.executeQuery("Select * from livres where titre like '"+entree+"%'"); 
			}
			else{
				rs=st.executeQuery("Select * from livres where "+typeEntree+" ='"+entree+"'"); 
			}

			if(rs.next()){
				chercheLivredb(rs);
			}

			if(auteur == "" || titre == "")
				chercherLivreISBNDB(request);
			else
				preparerInfo(request);
			
			checkIfNull(request);

			if(request.getSession().getAttribute("action") == "ajouterLivreRecherche"){
				request.getSession().removeAttribute("action");
				request.getRequestDispatcher("/AjoutLivreEnCours.jsp").forward(request, response);
			}
			else
				request.getRequestDispatcher("/LivreEnCours.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void setTypeEntree(HttpServletRequest request) {
		if (request.getParameter("ISBN_Button") != null) {
			typeEntree = "ISBN";
			setEntree(request.getParameter("code"));
		} else if (request.getParameter("UPC_Button") != null) {
			typeEntree = "UPC";
			setEntree(request.getParameter("code"));
		} else if (request.getParameter("EAN_Button") != null) {
			typeEntree = "EAN";
			setEntree(request.getParameter("code"));
		} else if (request.getParameter("Auteur_Button") != null) {
			typeEntree = "Auteur";
			setEntree(request.getParameter("auteur"));
		} else if (request.getParameter("Titre_Button") != null) {
			typeEntree = "Titre";
			setEntree(request.getParameter("titre"));
		}
	}

	private void checkIfNull(HttpServletRequest request) {
		if(request.getAttribute("information") == null)
			request.setAttribute("information", "");
		if(request.getAttribute("auteur") == null)
			request.setAttribute("auteur", "");
		if(request.getAttribute("titre") == null)
			request.setAttribute("titre", "");
		if(request.getAttribute("prix") == null)
			request.setAttribute("prix", "0");
		
	}

	private void chercheLivredb(ResultSet rs) throws SQLException {
		information = (rs.getString(6) ); 
		auteur = (rs.getString(5) ); 
		titre = (rs.getString(4) ); 
		prix = (rs.getString(7) ); 
		id = (rs.getString(1) ); 
		etat = (rs.getString(8));
	}

	private void preparerInfo(HttpServletRequest request) {
		request.setAttribute("information", information);
		request.setAttribute("titre", titre);
		request.setAttribute("auteur", auteur);
		request.setAttribute("prix", prix);
		request.setAttribute("id", id);
	}


	public void setEntree(String entree) {
		this.entree = entree;
	}

	private void chercherLivreISBNDB(HttpServletRequest request){
		URL url;
		try {
			String titre = "";
			String auteur = "";
			url = new URL("http://isbndb.com/api/books.xml?access_key="+accesKey+"&index1=isbn&value1="+entree);

			URLConnection urlConnection = url.openConnection();
			InputStream in = new BufferedInputStream(urlConnection.getInputStream());

			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse( in );


			doc.getDocumentElement().normalize();

			NodeList nList = doc.getElementsByTagName("BookData");

			for (int temp = 0; temp < nList.getLength(); temp++) {

				Node nNode = nList.item(temp);

				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;

					titre = eElement.getElementsByTagName("Title").item(0).getTextContent();
					auteur = eElement.getElementsByTagName("AuthorsText").item(0).getTextContent();
				}

			}
			
			request.setAttribute("titre", titre);
			request.setAttribute("auteur", auteur);
			request.setAttribute("information", "");
			request.setAttribute("prix", "");
			

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Source: http://www.mkyong.com/java/how-to-read-xml-file-in-java-dom-parser/ 
		//**********************************
		//**************************************
		//*************************************
		//**************************************
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
