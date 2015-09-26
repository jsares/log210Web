<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">

<h3>Page d'accueil</h3>
<form>
	<a href="CreerCompteEtudiant.jsp"> <input type="button"
		value="Créer un compte étudiant" name="Submit" id="frm_submit" />
	</a> <br> <br> 
	<a href="CreerCompteGestionnaire.jsp"> <input type="button"
		value="Créer un compte gestionnaire" name="Submit" id="frm_submit" />
</form>


<jsp:include page="footer.jsp"></jsp:include>