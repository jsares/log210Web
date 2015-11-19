

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import log210Web.AmazonInfo;
import log210Web.SignedRequestsHelper;

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
	private String auteur = "";
	private String titre = "";
	private String prix = "";
	private String asin = "";
	private String id = "";
	private String etat = "";
	private String link = "";

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

			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/LibrairieLog210","admin","admin");
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

			if(auteur == "" || titre == ""){
				//chercherLivreISBNDB(request);
				AmazonInfo amazonInfo = new AmazonInfo(entree, typeEntree);
				link = amazonInfo.callForSign();
				chercherLivreAmazon(request, link);
			}
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
		if(request.getAttribute("auteur") == null)
			request.setAttribute("auteur", "");
		if(request.getAttribute("titre") == null)
			request.setAttribute("titre", "");
		if(request.getAttribute("prix") == null)
			request.setAttribute("prix", "0");
		
	}

	private void chercheLivredb(ResultSet rs) throws SQLException {
		auteur = (rs.getString(5) ); 
		titre = (rs.getString(4) ); 
		prix = (rs.getString(7) ); 
		id = (rs.getString(1) ); 
		etat = (rs.getString(8));
	}

	private void preparerInfo(HttpServletRequest request) {
		request.setAttribute("titre", titre);
		request.setAttribute("auteur", auteur);
		request.setAttribute("prix", prix);
		request.setAttribute("id", id);
	}


	public void setEntree(String entree) {
		this.entree = entree;
	}

	
	private void chercherLivreAmazon(HttpServletRequest request, String link){
		URL url;
		try {
			
			String titre = "";
			String auteur = "";
			String nbPages = "";
			//url = new URL("http://isbndb.com/api/books.xml?access_key="+accesKey+"&index1=isbn&value1="+entree);
			url = new URL(link);

			URLConnection urlConnection = url.openConnection();
			InputStream in = new BufferedInputStream(urlConnection.getInputStream());

			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse( in );


			doc.getDocumentElement().normalize();

			NodeList nListInfo = doc.getElementsByTagName("ItemAttributes");

			//for (int temp = 0; temp < nListInfo.getLength(); temp++) {

				Node nNode = nListInfo.item(0);

				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;

					if(eElement.getElementsByTagName("Title").item(0) != null)
						titre = eElement.getElementsByTagName("Title").item(0).getTextContent();
					if(eElement.getElementsByTagName("Author").item(0) != null)
						auteur = eElement.getElementsByTagName("Author").item(0).getTextContent();
					if(eElement.getElementsByTagName("NumberOfPages").item(0) != null)
						nbPages = eElement.getElementsByTagName("NumberOfPages").item(0).getTextContent();
				}

				//}

				NodeList nListAsin = doc.getElementsByTagName("Item");

				nNode = nListAsin.item(0);

				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;

				if(eElement.getElementsByTagName("ASIN").item(0) != null)
					asin = eElement.getElementsByTagName("ASIN").item(0).getTextContent();
			}


			if(asin != ""){
				in.close();
				chercherPrixAmazon();
			}
			
			request.setAttribute("titre", titre);
			request.setAttribute("auteur", auteur);
			request.setAttribute("nbPages", nbPages);
			request.setAttribute("prix", this.prix);
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	private void chercherPrixAmazon() {
		String link;
		URL url;
		AmazonInfo amazonInfo = new AmazonInfo(asin);
		link = amazonInfo.callForPrice();

		try {
			url = new URL(link);


			URLConnection urlConnection = url.openConnection();
			InputStream in = new BufferedInputStream(urlConnection.getInputStream());

			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse( in );


			doc.getDocumentElement().normalize();

			NodeList nListPrix = doc.getElementsByTagName("LowestNewPrice");

			Node nNodePrix = nListPrix.item(0);

			if (nNodePrix.getNodeType() == Node.ELEMENT_NODE) {
				Element eElement = (Element) nNodePrix;

				if(eElement.getElementsByTagName("FormattedPrice").item(0) != null)
					this.prix = eElement.getElementsByTagName("FormattedPrice").item(0).getTextContent();
			}
			
			if(this.prix != "")
				formatPrix();


		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
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

	private void formatPrix() {
		String str = this.prix;
		this.prix = str.substring(1);
		
	}

}
