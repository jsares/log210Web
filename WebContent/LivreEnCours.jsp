<!-- Bootstrap -->
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<jsp:include page="header.jsp"></jsp:include>



<title>Réserver un livre</title>
</head>
<body>
	<h3>Votre livre</h3>
	<div class="container-fluid">
		<form action="/log210Web/ReserverLivre" method=post>
			<fieldset>
				<legend>Livre en Cours</legend>
			<fieldset>
			<h4>Titre</h4>
			<%
			session.setAttribute("id", request.getAttribute("id"));
			session.setAttribute("prix", request.getAttribute("prix"));
			out.println(request.getAttribute("titre") ); 
			%>
			
			</fieldset>
			<fieldset>
			<h4>Auteur</h4>
			<%
			out.println(request.getAttribute("auteur") ); 
			%>
			</fieldset>
			<fieldset>
			<h4>Information</h4>
			<%
			out.println(request.getAttribute("information") ); 
			%>	
			</fieldset>		
			<fieldset>
			<h4>Prix</h4>
			<%
			out.println(request.getAttribute("prix")+"$" ); 
			%>	
			</fieldset>		
			</fieldset>
			

			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="Payer" value="Payer les livres">
			</div>
			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="Retour" value="Chercher un autre livre">
			</div>
	</div>

	</form>
	</div>
</body>
</html>