<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid">
	<h3>Créer un compte étudiant</h3>
	<form action="/log210Web/CreerCompteEtudiant" method=post>
		<div class="row">
			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="text" name="courriel"
					placeholder="Entrer votre adresse de courriel"
					style="width: 250px;" required>
			</div>
			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="password" name="mdp" placeholder="Entrez un mot de passe"
					style="width: 250px;" required>
			</div>
			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="password" name="confirmerMdp" style="width: 250px;"
					placeholder="confirmer votre mot de passe" required>
			</div>
			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" value="Créer votre compte">
			</div>
		</div>
	</form>
</div>

<jsp:include page="footer.jsp"></jsp:include>