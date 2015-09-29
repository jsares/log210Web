<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<jsp:include page="header.jsp"></jsp:include>
<title>Cr�er un compte gestionnaire</title>
</head>
<body>
	<h3>Cr�er un compte gestionnaire</h3>
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
				<legend>Info coop�rative</legend>
				<div class="row">
					<div class="col-md-8" style="margin-bottom: 15px;">
						<input type="text" name="nom" placeholder="Entrer votre nom"
							style="width: 250px;" required>
					</div>
					<div class="col-md-8" style="margin-bottom: 15px;">
						<input type="text" name="prenom" placeholder="Entrez votre pr�nom"
							style="width: 250px;" required>
					</div>
					<div class="col-md-8" style="margin-bottom: 15px;">
						<input type="text" name="adresse" style="width: 250px;"
							placeholder="Entrez votre adresse" required>
					</div>
			</fieldset>

			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" value="Cr�er votre compte">
			</div>
	</div>

	</form>
	</div>
</body>
</html>