<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
  
    <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet"> <!-- PARTIE AJOUTÉE -->
 <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/1-col-portfolio.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
  
    <!-- BARRE DE MENU -->
   
   <nav class="navbar navbar-trans navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapsible">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
       		<a class="navbar-brand text-danger" href="Accueil.jsp">LABORATOIRE LOG210</a>
    		
        </div>
     
          <ul class="nav navbar-nav navbar-right">
      

            <li><a href="ChercherLivre.jsp">Chercher un livre</a></li>
            <li><a href="LivreReserves.jsp">Livres Réservés</a></li>
              <li class="active"><a href="/log210Web/Logout">Se déconnecter </a></li>
    
 

        </diviv><!--/.nav-collapse -->
      </div>
    </nav>
            
            
            
            </ul>
            
            		</form>
        </div>
    </div>
</nav>







    <!-- Les boutons à ajouter -->

<form class="form-signin" action="/log210Web/Logout" method=post>
	<c:if test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
	
		<a href="ChercherLivre.jsp"> <input type="button"
			value="Chercher un livre" name="Submit" id="frm_submit" />
			
			<a href="LivreReserves.jsp"> <input type="button"
			value="Voir livres reservés" name="Submit" id="frm_submit" />

	
		 <li class="btn btn-lg btn-primary btn-block" type="submit"><h4>Se
			déconnecter</h4></li>
	</c:if>
	</form>
	

   
   
   
   
   
  </head>
<body>