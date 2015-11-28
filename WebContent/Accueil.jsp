
<jsp:include page="header.jsp"/>


<section class="container-fluid" id="section1">
    <div class="v-center">
        <h1 class="text-center">Système d'échange de livres</h1>
        <h2 class="text-center lato animate slideInDown">Vous êtes...</h2>
        <div class="text-center">
            <br>
            <br>
            <div class="btn-group">
                        <button type="button" class="btn btn-danger btn-lg btn-huge lato dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     Etudiant <span class="caret"></span>
                </button>
                 <ul class="dropdown-menu">
                <li><a href="#" data-toggle="modal" data-target="#modalLogInEtudiant">Se connecter</a></li>
                <li><a href="#" data-toggle="modal" data-target="#modalSignUpEtudiant">Créer un compte</a></li>
              </ul>
            </div>&nbsp;
            <div class="btn-group">
                        <button type="button" class="btn btn-danger btn-lg btn-huge lato dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     Gestionnaire <span class="caret"></span>
                </button>
                 <ul class="dropdown-menu">
                <li><a href="#" data-toggle="modal" data-target="#modalLogInGestionnaire">Se connecter</a></li>
                <li><a href="#" data-toggle="modal" data-target="#modalSignUpGestionnaire">Créer un compte</a></li>
              </ul>
            </div>
          </div>
</div>
</section>

<div class="scroll-up">
	<a href="#"><i class="fa fa-angle-up"></i></a>
</div>

<div id="modalLogInEtudiant" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center"><br>Se connecter en tant qu'étudiant</h2>
            </div>
            <div class="modal-body row">
                <h6 class="text-center">COMPLETEZ CES CHAMPS POUR VOUS IDENTIFIER</h6>
                
                <form class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" action="/log210Web/LoginEtudiant" method=post>
                    <div class="form-group">
                        <input type="email" id="courriel" name="courriel" class="form-control input-lg" placeholder="Entrez votre adresse de courriel" required autofocus>
                    </div>
                    <div class="form-group">
                        <input type="password" id="mdp" name="mdp" class="form-control input-lg" placeholder="Mot de passe" required>
                    </div>
                    <div class="form-group">
                        <span class="error">${messages.erreurLogin}</span>
                        <button class="btn btn-danger btn-lg btn-block" type="submit">Se connecter</button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
</div>

<div id="modalSignUpEtudiant" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center"><br>Créer un compte étudiant</h2>
            </div>
            <div class="modal-body row">
                <h6 class="text-center">COMPLETEZ CES CHAMPS POUR VOUS INSCRIRE</h6>
                
                <form class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" action="/log210Web/CreerCompteEtudiant" method=post>
                    <div class="form-group">
            	         <input type="email" id="courriel" name="courriel" class="form-control input-lg" placeholder="Email" required autofocus>
            	    </div>
            	    <div class="form-group">
            	        <input type="password" id="mdp" name="mdp" class="form-control input-lg" placeholder="Mot de passe" required>
            	    </div>
            	    <div class="form-group">
            	        <input type="password" id="confirmerMdp" name="confirmerMdp" class="form-control input-lg" placeholder="Confirmez votre mot de passe" required>
                        <span class="error">${messages.test}</span>
                  	</div>
                    <div class="form-group">
                        <button class="btn btn-danger btn-lg btn-block" type="submit">Créer votre compte</button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
</div>

<div id="modalLogInGestionnaire" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center"><br>Se connecter en tant que gestionnaire</h2>
            </div>
            <div class="modal-body row">
                <h6 class="text-center">COMPLETEZ CES CHAMPS POUR VOUS IDENTIFIER</h6>
                
                <form class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" action="/log210Web/LoginGestionnaire" method=post>
                    <div class="form-group">
                        <input type="email" id="courriel" name="courriel" class="form-control input-lg" placeholder="Entrez votre adresse de courriel" required autofocus>
                    </div>
                    <div class="form-group">
                        <input type="tel" id="telephone" name="telephone" class="form-control input-lg" placeholder="Entrez votre numéro de téléphone" required>
                    </div>
                    <div class="form-group">
                        <input type="password" id="mdp" name="mdp" class="form-control input-lg" placeholder="Password" required>
                    </div>
                    
                    <div class="form-group">
                        <div class="error">${messages.erreurLogin}</div>
                        <button class="btn btn-danger btn-lg" name="bmail" type="submit">Se connecter via email</button>&nbsp;
                        <button class="btn btn-danger btn-lg" name="btel"  type="submit">Se connecter via telephone</button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
</div>

<div id="modalSignUpGestionnaire" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center"><br>Créer un compte gestionnaire</h2>
            </div>
            <div class="modal-body row">
                <h6 class="text-center">COMPLETEZ CES CHAMPS POUR VOUS INSCRIRE</h6>
                
                <form class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" action="/log210Web/CreerCompteGestionnaire" method=post>
  
                    <legend>Infos personnelles</legend>
                    <div class="form-group">
                        <input type="email" id="courriel" name="courriel" class="form-control input-lg" placeholder="Entrez votre adresse de courriel" required autofocus>
                    </div>
                    <div class="form-group">
                        <input type="password" id="mdp" name="mdp" class="form-control input-lg" placeholder="Entrez un mot de passe" required>
                    </div>
                    <div class="form-group">
                        <input type="password" id="confirmerMdp" name="confirmerMdp" class="form-control input-lg" placeholder="Confirmez votre mot de passe" required>
                    </div>
                    <div class="form-group">
						<input type="text" id="telephone" name="telephone" class="form-control input-lg" placeholder="Entrez votre numéro de téléphone" required>
                    </div>

                    <legend>Infos coopérative</legend>
                    <div class="form-group">
                        <input type="text" id="nom" name="nom" class="form-control input-lg" placeholder="Entrez votre nom" required>
                    </div>
                    <div class="form-group">
                        <input type="text" id="prenom"  name="prenom" class="form-control input-lg" placeholder="Entrez votre prénom" required>
                    </div>
                    <div class="form-group">
                        <input type="text" id="adresse"  name="adresse" class="form-control input-lg" placeholder="Entrez votre adresse" required>
                    </div>
                    
                    <button class="btn btn-danger btn-lg btn-block" type="submit">Créer votre compte</button>
                </form>
                
            </div>
        </div>
    </div>
</div>
</body>
</html>

<!-- PARTIE AJOUTÉE- FINNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN -->







	
	