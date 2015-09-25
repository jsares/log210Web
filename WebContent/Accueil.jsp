<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>



	<h3>Page d'accueil</h3>
	<form action="Accueil.jsp" method="POST">
		<a href="CreerCompteEtudiant.jsp"> <input type="button" value="Créer un compte étudiant" name="Submit" id="frm_submit" />
		</a>
		 <br> <br> 
		 <input type="button" value="Créer un compte gestionnaire" name="Submit" id="frm_submit" />
	</form>
	
	
<jsp:include page="footer.jsp"></jsp:include>