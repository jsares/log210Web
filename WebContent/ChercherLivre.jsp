<!-- Bootstrap -->




<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<jsp:include page="header.jsp"></jsp:include>
<title>Réserver un livre</title>
</head>
<body>
	<h3>Chercher un livre</h3>
	<div class="container-fluid">
		<form class="form-signin" action="/log210Web/ChercherLivre" method=post>
		
			<fieldset>
				<h3>Chercher un livre à partir de son code</h3>
				<div class="row">
					<div class="col-md-8" style="margin-bottom: 15px;">
						<input type="text" name="code"
							placeholder="Veuillez entrer le code"
							style="width: 250px;">
					</div>
				<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="ISBN_Button" value="Code ISBN" >
			
					<input type="submit" name="UPC_Button" value="Code UPC" >
				</div>
			</fieldset>
			
			
			<fieldset>
				<h3>Chercher un livre à partir l'auteur</h3>
				<div class="row">
					<div class="col-md-8" style="margin-bottom: 15px;">
						<input type="text" name="auteur"
							placeholder="Veuillez entrer le nom de l'auteur"
							style="width: 250px;">
					</div>
				<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="Auteur_Button" value="Auteur" >
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
				<input type="submit" name="Titre_Button" value="Titre" >
				</div>
			</fieldset>
			
		</form>
		
		
	</div>
	
	<div>
	<form class="form-signin" action="/log210Web/Logout" method=post>
	<c:if test="${sessionScope.utilisateur != null}">
		<button class="btn btn-lg btn-primary btn-block" type="submit">Se
			déconnecter</button>
	</c:if>
</form>
	</div>
	
	

	
</body>
</html>