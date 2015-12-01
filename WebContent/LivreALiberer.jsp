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
			
		
			<c:forEach items="${ListePayes}" var="livreP">  
			<br> Titre : ${livreP[0]} <br /> 
 			 Auteur : ${livreP[1]}  <br /> 
 			 Etat : ${livreP[3]} <br /> 
 			 
 				
 			 
 			
            <BR>
 			<br>  <br />  
 			<br>  <br />  
 			
			</c:forEach>  
			</h4>
			<h3>Veuillez présenter ces livres à l'élève pour qu'il vérifie leur état</h3>
			
			
				
			
		<div>
		<form class="form-signin" action="/log210Web/TraiterRemise" method=post>
				 <input type="submit" name="Liberer" value="Liberer les livres">
		</a>
		</form>
		</div>
		<div>
		<form class="form-signin" action="/log210Web/RetournerLivre" method=post>
				 <input type="submit" name="Retourner" value="Rembourser un livre">
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