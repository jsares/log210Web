<!-- Bootstrap -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation</title>
</head>
<body>
	<h3>Le livre est prêt à être échangé !</h3>

	<div class="col-md-8" style="margin-top: 15px;">
		<a href="ReceptionLivre.jsp"> <input type="button"
			value="Confirmer un autre livre" />
		</a>
	</div>
</body>

<div>
	<form class="form-signin" action="/log210Web/Logout" method=post>
		<c:if
			test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
			<button class="btn btn-lg btn-primary btn-block" type="submit">Se
				déconnecter</button>
		</c:if>
	</form>
</div>
</html>