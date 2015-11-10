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
			<h4>
			
			<c:forEach items="${ListePayes}" var="livreP">  
			
 			  
 			<br> Titre : ${livreP[0]} <br /> 
 			<br> Auteur : ${livreP[1]}  <br /> 
 			<br>  <br />  
			</c:forEach>  		
			
			</h4>
			
			
			
		<form class="form-signin" action="/log210Web/Librer" method=post>
			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="Liberer" value="Liberer ces livres">
			</div>
		</form>
		
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