<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Bootstrap -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recherche de livre</title>
</head>
<body>

<h3>Votre livre</h3>
	<div class="container-fluid">
		<form class="form-signin" action="/log210Web/ReserverLivre" method=post>
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
			<fieldset>
			<h4>Prix ($)</h4>
			<%
			out.println(request.getAttribute("prix")); 
			%>	
			</fieldset>		

			<fieldset>
			<h4>État</h4>
				<select name="etat" disabled="disabled">
					<option value=etat><%=request.getAttribute("etat")%></option>

				</select>	
			</fieldset>	
			
			</fieldset>

			<div class="col-md-8" style="margin-top: 15px;">
				<a href="ConfirmerEtatLivre.jsp"> <input type="button" value="Confirmer l'état du livre" />
				</a>
			</div>
			<div class="col-md-8" style="margin-top: 15px;">
				<a href="ReceptionLivre.jsp"> <input type="button" value="Confirmer un autre livre" />
				</a>
			</div>
			

	</form>
	</div>
	</div>
	
	<div>

</body>
</html>