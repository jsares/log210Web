
<jsp:include page="header.jsp"/>


    <title>Système d'échange de livres - Ajouter un livre</title>


    <!-- Page Content -->
    <div class="container">
  <div class="body-card">
        <!-- Jumbotron Header -->
        <div class="jumbotron title-over-header-image">
            <h1>Ajouter un livre</h1>
        </div>
    

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Votre livre</h3>
	</div>
	<div class="panel-body">
	
	
	
	<div class="container-fluid">
		<form class="form-signin" action="/log210Web/AjouterLivre" method="post">
		    <fieldset>
			<h4>Titre</h4>
			<div class="form-group">
			 		<input type="text" id="titre" name="titre" class="form-control" value="UML 2 et les Design Patterns" required="" autofocus="">
	    	</div>
			
			</fieldset>
			<fieldset>
			<h4>Auteur</h4>
			<div class="form-group">
	        		
	        		<input type="text" id="auteur" name="auteur" class="form-control" value="Craig Larman" placeholder="Entrer un auteur" required="">
	
	    	</div>
			</fieldset>
			<fieldset>
			<h4>Information</h4>
			<div class="form-group">
	        		<input type="text" id="information" name="information" class="form-control" value="Ceci est un paragrpahe de texte donnant des informations sur le livre" placeholder="Information" required="">
	    	</div>
			</fieldset>		
			<fieldset>
			<h4>Prix($)</h4>
			<div class="form-group">
	        		<input type="text" id="prix" name="prix" class="form-control" value="50" required="">
					<input type="hidden" name="prixStatic" id="prixStatic" value="50">
	    	</div>	
			</fieldset>		
			<fieldset>
			<h4>État</h4>
			<div class="form-group">
				<select class="form-control" name="etat" id="etat">
					<option value="Bon">Bon</option>
					<option value="Passable">Passable</option>
					<option value="Critique">Critique</option>
				</select>
	    	</div>	
			</fieldset>	
			

			<div class="col-xs-2 col-sm-2 col-md-2 col-md-offset-5 col-sm-offset-4" style="margin-bottom: 15px;">
				<button type="submit" name="confirmer" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-ok"></span> Confirmer</button>
			</div>
		
	</form></div>

	</div>

</div></div></div>
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
</body>
</html>


	