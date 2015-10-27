<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajouter un livre</title>



<c:if test="${sessionScope.utilisateur != null}">
	<label> Vous devez être connecté en tant qu'étudiant pour
		pouvoir ajouter un livre. </label>
	<a href="Accueil.jsp"> <input type="button"
		value="Retourner à la page d'accueil" name="Submit" id="frm_submit" />
</c:if>

</head>
<body>
	<div>
		<form class="form-signin" action="/log210Web/Logout" method=post>
			<c:if test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
				<button class="btn btn-lg btn-primary btn-block" type="submit">Se
					déconnecter</button>
			</c:if>
		</form>
	</div>
</body>
</html>