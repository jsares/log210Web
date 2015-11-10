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
		<form class="form-signin" action="/log210Web/AjouterLivre" method=post>
			<fieldset>
				<legend>Livre en Cours</legend>
			<fieldset>
			<h4>Titre</h4>
			<div class="form-group">
			 		<input type="text" id="titre" name="titre" class="form-control" value="<%= request.getAttribute("titre")%>" required autofocus>
	    	</div>
	    	<%
			session.setAttribute("id", request.getAttribute("id"));
			%>
			
			</fieldset>
			<fieldset>
			<h4>Auteur</h4>
			<div class="form-group">
	        		
	        		<input type="text" id="auteur" name="auteur" class="form-control" value="<%= request.getAttribute("auteur")%>" placeholder="Entrer un auteur" required autofocus>
	
	    	</div>
			</fieldset>
			<fieldset>
			<h4>Information</h4>
			<div class="form-group">
	        		<input type="text" id="information" name="information" class="form-control" value="<%= request.getAttribute("information")%>" placeholder="" required autofocus>
	    	</div>
			</fieldset>		
			<fieldset>
			<h4>Prix($)</h4>
			<div class="form-group">
				
	        		<input type="text" id="prix" name="prix" class="form-control" value="<%= request.getAttribute("prix")%>" required autofocus>
					<input type="hidden" name="prixStatic" id="prixStatic" value="<%= request.getAttribute("prix")%>">
				
	    	</div>	
			</fieldset>		
			<fieldset>
			<h4>État</h4>
			<div class="form-group">
				<select name="etat" id="etat">
					<option value="Bon">Bon</option>
					<option value="Passable">Passable</option>
					<option value="Critique">Critique</option>
				</select>
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

<script type="text/javascript">
function calculerPrix(){
	var elem = document.getElementById("prix");
	var pr = document.getElementById("prixStatic");
	if(pr.value != "" || pr.value != null)
		elem.value = pr.value;
	
    var selection = document.getElementById("etat").value;
    
    if(elem.value != "" || elem.value != null || pr.value != "" || pr.value != null){
		if(selection == "Bon")
			elem.value *= 0.25;
		if(selection == "Passable")
			elem.value *= 0.50;
		if(selection == "Critique")
			elem.value *= 0.75;
	}
}
</script>
</html>