<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Créer un nouvel utilisateur</title>
</head>
<body>
	<h3>Créer un nouvel utilisateur</h3>
	<form method="get">
		<div id="courrielEtudiant" style="margin:10px 0px 10px 0px;">
			<input type="text" name="courriel" placeholder="Entrer votre adresse de courriel" style="width:200px;">
		</div>
		<div id="mdpEtudiant" style="margin:10px 0px 10px 0px;">
			<input type="text" name="mdp" placeholder="Entrez un mot de passe" style="width:200px;">
		</div>
		<div id="confirmerMdpEtudiant" style="margin:10px 0px 10px 0px;">
			<input type="text" name="ConfirmerMdp" placeholder="confirmer votre mot de passe" style="width:200px;">
		</div>
		<div id="btnSubmit" style="margin:10px 0px 10px 0px;">
		<input type="submit" value="Créer votre compte">
		</div>
	</form>
</body>
</html>