<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- Usando beans:
1.clase encapsulada
2.Serializable(implementación de la interface)
3.Constructor vacio  -->
<%if(request.getParameter("id")!=null){%>
<jsp:useBean id="p1" scope="request" class="com.vipper.modelo.Pedido"/>
<jsp:setProperty name="p1" property="*"/>
<jsp:forward page="servletfacturacion?op=1"/>
<% }%>
<form action="mostraruno.jsp" method="post">
Pedido : <input type="text" name="id"/>
<input type="submit" value="Buscar pedido"/>
</form>
</body>
</html>