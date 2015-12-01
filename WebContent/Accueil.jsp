<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">

<form class="form-signin" action="/log210Web/Logout" method=post>
	<c:if test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
		<c:if test="${sessionScope.loginGestionnaire != null}">
			<label> Vous êtes connecté en tant que <%=session.getAttribute("loginGestionnaire")%>
			</label>
		</c:if>
		<c:if test="${sessionScope.loginEtudiant != null}">
			<label> Vous êtes connecté en tant que <%=session.getAttribute("loginEtudiant")%>
			</label>
		</c:if>
		<button class="btn btn-lg btn-primary btn-block" type="submit"><h4>Se
			déconnecter</h4></button>
	</c:if>
</form>

	<c:if test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
		<a href="ChercherLivre.jsp"> <input type="button"
			value="Chercher un livre" name="Submit" id="frm_submit" />
			
			<a href="LivreReserves.jsp"> <input type="button"
			value="Voir livres reservés" name="Submit" id="frm_submit" />
				
		<c:if test="${sessionScope.loginEtudiant != null}">
			<a href="AjouterLivre.jsp"> <input type="button"
			value="Ajouter un livre" name="Submit" id="frm_submit" /></a>
		</c:if>
		
		<c:if test="${sessionScope.loginGestionnaire != null}">
			<a href="ReceptionLivre.jsp"> <input type="button"
			value="Réception d'un livre" name="Submit" id="frm_submit" /></a>
		</c:if>
			
	</c:if>

<h3>Page d'accueil</h3>
<form>
	<c:if test="${sessionScope.loginEtudiant == null && sessionScope.loginGestionnaire == null}">
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
