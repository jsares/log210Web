<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
      <form class="form-signin" action="/log210Web/LoginGestionnaire" method=post>
      	<div class="form-group">
        	<h3 class="form-signin-heading">Se connecter en tant que gestionnaire</h3>
        </div>
        <div class="form-group">
	        <label for="email" class="sr-only">Adresse de courriel</label>
	        <input type="email" id="courriel" name="courriel" class="form-control" placeholder="Entrez votre adresse de courriel"  autofocus>
        </div>
        <div class="form-group">
	        <label for="email" class="sr-only">Num de telephone</label>
	        <input  id="telephone" name="telephone" class="form-control" placeholder="Entrez votre num de telephone"  autofocus>
        </div>
        <div class="form-group">
        	<label for="mdp" class="sr-only">Mot de passe</label>
	        <input type="password" id="mdp" name="mdp" class="form-control" placeholder="mot de passe" required>
        </div>
        <span class="error">${messages.erreurLogin}</span>
        <button class="btn btn-lg btn-primary btn-block" name="bmail" type="submit">Se connecter via email</button>
         <button class="btn btn-lg btn-primary btn-block" name="btel"  type="submit">Se connecter via telephone</button>
      </form>

</div> <!-- /container -->


<jsp:include page="header.jsp"></jsp:include>