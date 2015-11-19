<!-- Bootstrap -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<jsp:include page="header.jsp"></jsp:include>



<title>Réserver un livre</title>
</head>
<body>
	<h3>Votre livre</h3>
	<div class="container-fluid">
		<form class="form-signin" action="/log210Web/ReserverLivre" method=post>
			<fieldset>
				<legend>Livre en Cours</legend>
			<fieldset>
			<h4>Titre</h4>
			<%
			session.setAttribute("id", request.getAttribute("id"));
			session.setAttribute("prix", request.getAttribute("prix"));
			out.println(request.getAttribute("titre") ); 
			%>
			
			</fieldset>
			<fieldset>
			<h4>Auteur</h4>
			<%
			out.println(request.getAttribute("auteur") ); 
			%>
			</fieldset>
			<fieldset>	
			<fieldset>
			<h4>Prix ($)</h4>
			<%
			out.println(request.getAttribute("prix")); 
			%>	
			</fieldset>		

			<fieldset>
			<h4>État</h4>
				<select name="etat" disabled="disabled">
					<option value=etat><%=request.getAttribute("etat")%></option>

				</select>	
			</fieldset>	
			
			</fieldset>

			<div class="col-md-8" style="margin-top: 15px;">
				<a href="AjouterLivre.jsp"> <input type="button" value="Ajouter un livre" />
				</a>
			</div>

			<div class="col-md-8" style="margin-bottom: 15px; margin-top: 15px;">
				<input type="submit" name="Reserver" value="Reserver le livre">
			</div>
			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="Retour" value="Chercher un autre livre">
			</div>

	</form>
	</div>
	</div>
	
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