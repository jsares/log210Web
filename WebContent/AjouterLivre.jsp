
<jsp:include page="header.jsp"/>

    <title>Système d'échange de livres - Ajouter un livre</title>

    <!-- Page Content -->
    <div class="container">
  <div class="body-card">
        <!-- Jumbotron Header -->
        <div class="jumbotron title-over-header-image">
            <h1>Ajouter un livre</h1>
        </div>
    
         
<div class="container">
<form class="form-signin" action="/log210Web/ChercherLivre" method=post>
				<fieldset>
					<div class="col-xs-6 col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3 col-xs-offset-3">
						<div class="row" style="margin-bottom: 15px;">
								<input type="text" name="code" class="form-control input-lg" placeholder="Code ISBN/UPC/EAN du livre" required autofocus>
						</div>
					<div class="row">
					<button class="btn btn-danger" type="submit" name="ISBN_Button"><span class="glyphicon glyphicon-search"></span> Code ISBN</button>&nbsp;
                    <button class="btn btn-danger" type="submit" name="UPC_Button"><span class="glyphicon glyphicon-search"></span> Code UPC</button>&nbsp;
					<button class="btn btn-danger" type="submit" name="EAN_Button"><span class="glyphicon glyphicon-search"></span> Code EAN</button>
					
				</div>
					</div>
				</fieldset>
			</form>
</div>
        


</div>
    
    <!-- /.container -->

</div>

</body>
</html>