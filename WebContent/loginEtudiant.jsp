
<jsp:include page="header.jsp"/>

<div class="container">
      <form class="form-signin" action="/log210Web/LoginEtudiant" method=post>
      	<div class="form-group">
        	<h3 class="form-signin-heading">Se connecter en tant qu'étudiant</h3>
        </div>
        <div class="form-group">
	        <label for="email" class="sr-only">Adresse de courriel</label>
	        <input type="email" id="courriel" name="courriel" class="form-control" placeholder="Entrez votre adresse de courriel" required autofocus>
        </div>
        <div class="form-group">
        	<label for="mdp" class="sr-only">Mot de passe</label>
	        <input type="password" id="mdp" name="mdp" class="form-control" placeholder="mot de passe" required>
        </div>
        <span class="error">${messages.erreurLogin}</span>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Se connecter</button>
      </form>

</div> <!-- /container -->

</body>
</html>
