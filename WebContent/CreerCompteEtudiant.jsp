
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
      <form class="form-signin" action="/log210Web/CreerCompteEtudiant" method=post>
      	<div class="form-group">
        	<h3 class="form-signin-heading">Créer un compte étudiant</h3>
        </div>
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
	        <input type="password" id="confirmerMdp" name="confirmerMdp" class="form-control" style="margin-bottom: 0;" placeholder="Confirmez votre mot de passe" required>
      	<span class="error">${messages.test}</span>
      	</div>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Créer votre compte</button>
      </form>

</div> <!-- /container -->
</body>
</html>