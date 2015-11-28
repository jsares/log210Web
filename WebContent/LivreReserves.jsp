
<jsp:include page="header.jsp"/>
    <title>Système d'échange de livres - Rechercher un livre</title>

    <!-- Page Content -->
    <div class="container">
  <div class="body-card">
        <!-- Jumbotron Header -->
        <div class="jumbotron title-over-header-image">
            <h1>Livres réservés</h1>
        </div>
        
 <div class="panel panel-default">
           <div class="panel-heading"><h3>UML 2 et les Design Patterns <small>Craig Larman</small></h3></div>
   			<div class="panel-body">
                <p>Informations sur le livre : ceci est un paragraphe de texte qui apporte des informations sur le livre.</p>
                 
                 <div class="col-md-3">
                 <h4>Prix : 50$</h4>
                 <p>Etat : Neuf</p>
                 </div>
                <div class="col-md-3 pull-right">
                    <a href="#" class="btn btn-success disabled" role="button"><span class="glyphicon glyphicon-ok"></span> Réservé</a>
                </div>
             </div>
         </div> 
         
         
<div class="jumbotron">
    <div class="row">
        <div class="col-md-4 col-sm-12 col-xs-12">
          <p><strong>Prix total : </strong></p>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
	    	<form class="form-signin" action="/log210Web/ReserverLivre" method=post>
				<button class="btn btn-danger btn-lg" name="btel"  type="submit"><span class="glyphicon glyphicon-search"></span> Chercher un autre livre</button>
	    	</form>
		</div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <form class="form-signin" action="/log210Web/LivrePaye" method=post>
				<button class="btn btn-danger btn-lg" name="btel"  type="submit"> <span class="glyphicon glyphicon-shopping-cart"></span> Payer tous les livres</button>
	    	</form>
		</div>
        
    </div>


</div>
         
         

        <!-- Jumbotron Header -->
        <div class="jumbotron title-over-header-image">
            <h1>Livres payés</h1>
        </div>
        
 <div class="panel panel-default">
           <div class="panel-heading"><h3>UML 2 et les Design Patterns <small>Craig Larman</small></h3></div>
   			<div class="panel-body">
                <p>Informations sur le livre : ceci est un paragraphe de texte qui apporte des informations sur le livre.</p>
                 <div class="col-md-6">
                    <h4>Prix : 50$</h4>
                     <p>Etat : Neuf</p>
                 </div>
                <div class="col-md-6 pull-right">
                    <a href="#" class="btn btn-success disabled" role="button"><span class="glyphicon glyphicon-ok"></span> Payé</a>
                </div>
             </div>
         </div> 
</div>


</div>
</body>

