<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">

<form class="form-signin" action="/log210Web/Logout" method=post>
	<c:if test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
		<c:if test="${sessionScope.loginGestionnaire != null}">
			<label> Vous êtes connecté en tant que <%=session.getAttribute("loginGestionnaire")%>
			</label>
		</c:if>
		<c:if test="${sessionScope.loginEtudiant != null}">
			<label> Vous êtes connecté en tant que <%=session.getAttribute("loginEtudiant")%>
			</label>
		</c:if>
		<button class="btn btn-lg btn-primary btn-block" type="submit"><h4>Se
			déconnecter</h4></button>
	</c:if>
	<div>
      <a href="Accueil.jsp"> <input type="button"
			value="Retourner sur la page d'accueil" name="Submit" id="frm_submit" />
      </div>
</form>


<form class="form-signin" action="/log210Web/LiberationLivre" method=post>

	<c:if test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
	
	
		<div class="form-group">
		<h3>Email de l'étudiant</h3>
	        <label for="emailE" class="sr-only">Email étudiant</label>
	        <input type="emailE" id="emailE" name="emailE" class="form-control" required autofocus>
	        <button class="btn btn-lg btn-primary btn-block" type="submit"><h4>Submit</h4></button>
	
	</c:if>
</form>
</form>
