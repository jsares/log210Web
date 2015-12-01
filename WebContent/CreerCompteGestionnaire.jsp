<jsp:include page="header.jsp"></jsp:include>
<title>Créer un compte gestionnaire</title>

	<div class="container">
      <form class="form-signin" action="/log210Web/CreerCompteGestionnaire" method=post>
      	<div class="form-group">
        	<h3 class="bg-danger">Créer un compte gestionnaire</h3>
        </div>
        <legend>Infos personnelles</legend>
        <div class="form-group">
	        <label for="email" class="sr-only">Adresse de courriel</label>
	        <input type="email" id="courriel" name="courriel" class="form-control" placeholder="Entrez votre adresse de courriel" required autofocus>
	    </div>
	    <div class="form-group">
	        <label for="mdp" class="sr-only">Mot de passe</label>
	        <input type="password" id="mdp" name="mdp" class="form-control" placeholder="Entrez un mot de passe" required>
	    </div>
	    <div class="form-group">
	        <label for="confirmation_mdp" class="sr-only">Confirmation du mot de passe</label>
	        <input type="password" id="confirmerMdp" name="confirmerMdp"  class="form-control" style="margin-bottom: 0;" placeholder="Confirmez votre mot de passe" required>
      	</div>
      	<div class="col-md-8" style="margin-bottom: 15px;">
						<input type="text" name="telephone" style="width: 250px;"
							placeholder="Entrez votre numéro de téléphone" required>
		</div>
        
        
        
        <legend>Infos cooperative</legend>
        <div class="form-group">
	        <input type="text" id="nom" name="nom" class="form-control" placeholder="Entrez votre nom" required>
	    </div>
	    <div class="form-group">
	        <input type="text" id="prenom"  name="prenom"class="form-control" placeholder="Entrez votre prénom" required>
	    </div>
	    <div class="form-group">
	        <input type="text" id="adresse"  name="adresse" class="form-control" style="margin-bottom: 0;" placeholder="Entrez votre adresse" required>
      	</div>
        
        
        
        <button class="btn btn-lg btn-danger btn-block" type="submit">Créer votre compte</button>
      </form>

</div> <!-- /container -->
	
</body>
</html>