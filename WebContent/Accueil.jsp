<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">

<form class="form-signin" action="/log210Web/Logout" method=post>
	<c:if test="${sessionScope.utilisateur != null}">
		<label> Vous êtes connecté en tant que <%=session.getAttribute("utilisateur")%>
		</label>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Se
			déconnecter</button>
	</c:if>
</form>

	<c:if test="${sessionScope.utilisateur != null}">
		<a href="ChercherLivre.jsp"> <input type="button"
			value="Chercher un livre" name="Submit" id="frm_submit" />
			
	</c:if>

<h3>Page d'accueil</h3>
<form>
	<c:if test="${sessionScope.utilisateur == null}">
		<a href="CreerCompteEtudiant.jsp"> <input type="button"
			value="Créer un compte étudiant" name="Submit" id="frm_submit" />
		</a>
		<br>
		<br>
		<a href="CreerCompteGestionnaire.jsp"> <input type="button"
			value="Créer un compte gestionnaire" name="Submit" id="frm_submit" />
		</a>
		<br>
		<br>
		<a href="loginEtudiant.jsp"> <input type="button"
			value="Log in un compte étudiant" name="Submit" id="frm_submit" />
		</a>
		<br>
		<br>
		<a href="loginGestionnaire.jsp"> <input type="button"
			value="Log in un compte gestionnaire" name="Submit" id="frm_submit" />
		</a>
		<br>
		<br>
	</c:if>
</form>
