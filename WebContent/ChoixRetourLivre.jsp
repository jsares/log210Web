<!-- Bootstrap -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<jsp:include page="header.jsp"></jsp:include>


<title>Livres Payés</title>
</head>
<body>
	<h3>Vos livres Payés</h3>
	<div class="container-fluid">
		
				
			
			<fieldset>
			
			
			<c:forEach items="${myListPaye}" var="livreP">  
 			<br> Titre:  ${livreP[0]} <br /> 
 			<br> ID:  ${livreP[4]} <br />   
			</c:forEach>  
				
			</h4>
			
			</fieldset>
			
		
	</div>
	
	 <form class="form-signin" action="/log210Web/RetourDuLivre" method=post>
      	<div class="form-group">
        	<h3 class="form-signin-heading">ID du livre a rembourser</h3>
        </div>
        <div class="form-group">
	        <label for="id" class="sr-only">id</label>
	        <input type="id" id="id" name="id" class="form-control" placeholder="Entrez le ID du livre" required autofocus>
     		<button class="btn btn-lg btn-primary btn-block" type="submit">Rembourser</button>
        </div>
	</form>
	

</body>
</html>