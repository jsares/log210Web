<!-- Bootstrap -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<jsp:include page="header.jsp"></jsp:include>


<title>Livres A Libérer</title>
</head>
<body>
	<h3>Les livres</h3>
	<div class="container-fluid">
		
			<fieldset>
			<h3>Payés</h3>
			<br>  <br /> 
			<h4>			
			
			
			<form class="form-signin" action="/log210Web/RetournerLivre" method=post>
			<c:forEach items="${ListePayes}" var="livreP">  
			<br> Titre : ${livreP[0]} <br /> 
 			 Auteur : ${livreP[1]}  <br /> 
 			 Etat : TODO <br /> 
 			 
 				
 			 
 			<button class="btn btn-lg btn-primary btn-block" name="LivreID" value="${livreP[2]}" type="submit"><h4>Rembourser le livre</h4></button>
            <BR>
 			<br>  <br />  
 			<br>  <br />  
 			
			</c:forEach>  		
			</form>
			</h4>
			<h3>Veuillez présenter ces livres à l'élève et annoter tous les livres acceptés</h3>
			
				
			
		<div>
		<form class="form-signin" >
				<a href="Merci.jsp"> <button type="button" class="btn btn-lg btn-primary btn-block" ><h4>Liberer ces livres</h4></button>
		</a>
		</form>
	</div>
		
	</div>
	
	<div>
		<form class="form-signin" action="/log210Web/Logout" method=post>
			<c:if test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
				<button class="btn btn-lg btn-primary btn-block" type="submit">Se
					déconnecter</button>
			</c:if>
		</form>
	</div>
	

</body>
</html>