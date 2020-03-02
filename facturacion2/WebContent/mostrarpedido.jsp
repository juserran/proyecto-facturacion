<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="p1" class="com.vipper.modelo.Pedido" scope="request" />
	<h1>Datos del pedido</h1>
	<ul>
		<li>Id:<%=p1.getId_pedido() %></li>
		<li>Descripcion:<%=p1.getDescripcion()%></li>
		<li>Id Cliente:<%=p1.getId()%></li>
		<li>Forma de pago:<%=p1.getId_forma_pago() %></li>
		<li>total:<%=p1.getTotal() %></li>
		<li>Fecha:<%=p1.getFecha() %></li>
		<li>Id Servicio:<%=p1.getId_servicio() %></li>
		<li>Id Contrato:<%=p1.getId_contrato() %></li>
		<li>Importe facturado:<%=p1.getImporte_facturado() %></li>
	</ul>
</body>
</html>