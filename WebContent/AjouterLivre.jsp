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

	<c:if test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
		<c:if test="${sessionScope.loginGestionnaire != null}">
			<label> Vous devez être connecté en tant qu'étudiant pour pouvoir accéder à cette page.
			</label>
			
			<a href="Accueil.jsp"> <input type="button"
			value="Retourner sur la page d'accueil" name="Submit" id="frm_submit" />
		
		</c:if>
		<c:if test="${sessionScope.loginEtudiant != null}">
			<label> Vous êtes connecté en tant que <%=session.getAttribute("loginEtudiant")%>
			</label>
			<form class="form-signin" action="/log210Web/ChercherLivre" method=post>
				<fieldset>
					<div class="row">
						<div class="col-md-8" style="margin-bottom: 15px;">
							<input type="text" name="code"
								placeholder="Code ISBN du livre"
								style="width: 250px;" required>
						</div>
					<div class="col-md-8" style="margin-bottom: 15px;">
					<%session.setAttribute("action", "ajouterLivreRecherche");%>
					<input type="submit" name="ISBN_Button" value="Code ISBN" >			
					<input type="submit" name="UPC_Button" value="Code UPC" >
					<input type="submit" name="EAN_Button" value="Code EAN" >
				</div>
					</div>
				</fieldset>
			</form>
		</c:if>
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