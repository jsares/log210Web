<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">

 <form class="form-signin" action="/log210Web/Logout" method=post>
<div style="float: right;">
	<label> Vous êtes connecté en tant que <%=session.getAttribute("utilisateur")%>
	</label>
	<button class="btn btn-lg btn-primary btn-block" type="submit">Se déconnecter</button>
</div>
</form>

<h3>Page d'accueil</h3>
<form>	

	<a href="CreerCompteEtudiant.jsp"> <input type="button"
		value="Créer un compte étudiant" name="Submit" id="frm_submit" />
	</a> <br> <br> <a href="CreerCompteGestionnaire.jsp"> <input
		type="button" value="Créer un compte gestionnaire" name="Submit"
		id="frm_submit" />
	</a> <br> <br> <a href="loginEtudiant.jsp"> <input
		type="button" value="Log in un compte étudiant" name="Submit"
		id="frm_submit" />
	</a> <br> <br> <a href="loginGestionnaire.jsp"> <input
		type="button" value="Log in un compte gestionnaire" name="Submit"
		id="frm_submit" />
	</a> <br> <br>
</form>
