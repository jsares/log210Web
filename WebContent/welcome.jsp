<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String user=session.getValue("userid").toString(); 
%>
Registration is Successfull. Welcome to <%=user %>