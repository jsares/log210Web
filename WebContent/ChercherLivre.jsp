
<jsp:include page="header.jsp"/>

    <title>Système d'échange de livres - Rechercher un livre</title>



    <!-- Page Content -->
    <div class="container">
  <div class="body-card">
        <!-- Jumbotron Header -->
        <div class="jumbotron">
            <h1>Rechercher un livre <small>à partir de son...</small></h1>
            <br>
             <div class="row-fluid">
<form class="form-signin" action="/log210Web/ChercherLivre" method="post">
		            

<fieldset>
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Titre</h3>
	</div>
	<div class="panel-body">
		<div class="container">
					<div class="row" style="margin-bottom: 15px;">
						<input type="text" name="titre" placeholder="Entrer une partie du titre" class="form-control">
					</div>
				<div class="row" style="margin-bottom: 15px;">
			    	<button type="submit" name="Titre_Button" class="btn btn-danger"><span class="glyphicon glyphicon-search"></span> Rechercher par titre</button>
				</div>
		</div>
	</div>
</div>
</fieldset>

<fieldset>
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Auteur</h3>
	</div>
	<div class="panel-body">
		<div class="container">
					<div class="row" style="margin-bottom: 15px;">
						<input type="text" name="auteur" placeholder="Entrer l'auteur" class="form-control">
					</div>
				<div class="row" style="margin-bottom: 15px;">
				 <button type="submit" name="Auteur_Button" class="btn btn-danger"><span class="glyphicon glyphicon-search"></span> Rechercher par auteur</button>
				</div>
		</div>
	</div>
</div>
</fieldset>
            
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Code</h3>
	</div>
	<div class="panel-body">
		<div class="container">
			<div class="row" style="margin-bottom: 15px;">
				<input type="text" name="code" placeholder="Entrer le code" class="form-control">
			</div>
			<div class="row" style="margin-bottom: 15px;">
				<button type="submit" name="ISBN_Button" class="btn btn-danger"><span class="glyphicon glyphicon-search"></span> Rechercher par code ISBN</button>
				<button type="submit" name="UPC_Button" class="btn btn-danger"><span class="glyphicon glyphicon-search"></span> Rechercher par code UPC</button>
			</div>
		</div>
	</div>
</div>


</form>
       
      
</div>
    
    <!-- /.container -->

   



</div></div></div>

</body>
</html>




	