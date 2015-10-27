<!-- Bootstrap -->
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
		<form class="form-signin" action="/log210Web/AjouterLivre" method=post>
			<fieldset>
				<legend>Livre en Cours</legend>
			<fieldset>
			<h4>Titre</h4>
			<div class="form-group">
	        	<input type="titre" id="titre" name="titre" class="form-control" value="<%= request.getAttribute("titre")%>" required autofocus>
	    	</div>
	    	<%
			session.setAttribute("id", request.getAttribute("id"));
			%>
			
			</fieldset>
			<fieldset>
			<h4>Auteur</h4>
			<div class="form-group">
	        	<input type="auteur" id="auteur" name="auteur" class="form-control" value="<%= request.getAttribute("auteur")%>" required autofocus>
	    	</div>
			</fieldset>
			<fieldset>
			<h4>Information</h4>
			<div class="form-group">
	        	<input type="information" id="information" name="information" class="form-control" value="<%= request.getAttribute("information")%>" required autofocus>
	    	</div>
			</fieldset>		
			<fieldset>
			<h4>Prix</h4>
			<div class="form-group">
	        	<input type="prix" id="prix" name="prix" class="form-control" value="<%= request.getAttribute("prix")%>$" required autofocus>
	    	</div>	
			</fieldset>		
			<fieldset>
			<h4>État</h4>
			<div class="form-group">
	        	<input type="etat" id="etat" name="etat" class="form-control" placeholder="indiquez l'état du livre" required autofocus>
	    	</div>	
			</fieldset>	
			</fieldset>
			

			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="confirmer" value="Confirmer">
			</div>
		
	</div>

	</form>
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