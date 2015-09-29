<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Créer un compte gestionnaire</title>
</head>
<body>
	<h3>Créer un compte gestionnaire</h3>
	<div class="container-fluid">
		<form action="/log210Web/CreerCompteGestionnaire" method=post>
			<fieldset>
				<legend>Info personnel</legend>
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
			</fieldset>
			<fieldset>
				<legend>Info coopérative</legend>
				<div class="row">
					<div class="col-md-8" style="margin-bottom: 15px;">
						<input type="text" name="nom" placeholder="Entrer votre nom"
							style="width: 250px;" required>
					</div>
					<div class="col-md-8" style="margin-bottom: 15px;">
						<input type="text" name="prenom" placeholder="Entrez votre prénom"
							style="width: 250px;" required>
					</div>
					<div class="col-md-8" style="margin-bottom: 15px;">
						<input type="text" name="adresse" style="width: 250px;"
							placeholder="Entrez votre adresse" required>
					</div>
			</fieldset>

			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" value="Créer votre compte">
			</div>
	</div>

	</form>
	</div>
</body>
</html>