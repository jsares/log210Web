<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Bootstrap -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Processus de réception d'un livre</title>

<c:if
	test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
	<c:if test="${sessionScope.loginGestionnaire == null}">
		<label> Vous devez être connecté en tant que gestionnaire pour
			pouvoir accéder à cette page. </label>

	</c:if>
	<c:if test="${sessionScope.loginGestionnaire != null}">
		<label> Vous êtes connecté en tant que <%=session.getAttribute("loginGestionnaire")%>
		</label>

		<h3>Réception de Livres</h3>
		<form class="form-signin" action="/log210Web/ChercherLivreReceptionLivre" method=post>

			<div class="container-fluid">


				<fieldset>
					<h3>Chercher un livre à partir de son code</h3>
					<div class="row">
						<div class="col-md-8" style="margin-bottom: 15px;">
							<input type="text" name="code"
								placeholder="Veuillez entrer le code" style="width: 250px;">
						</div>
						<div class="col-md-8" style="margin-bottom: 15px;">
							<input type="submit" name="ISBN_Button" value="Code ISBN">
							<input type="submit" name="UPC_Button" value="Code UPC">

						</div>
				</fieldset>


				<fieldset>
					<h3>Chercher un livre à partir du titre</h3>
					<div class="row">
						<div class="col-md-8" style="margin-bottom: 15px;">
							<input type="text" name="titre"
								placeholder="Veuillez entrer une partie du titre"
								style="width: 250px;">
						</div>
						<div class="col-md-8" style="margin-bottom: 15px;">
							<input type="submit" name="Titre_Button" value="Titre">
						</div>
				</fieldset>

			</div>

			<span class="error" style="color: red;">${messages.msgErreur}</span>
		</form>
	</c:if>
</c:if>

<div>
	<a href="Accueil.jsp"> <input type="button"
		value="Retourner sur la page d'accueil" name="Submit" id="frm_submit" />
</div>

</head>
<body>

</body>
</html>