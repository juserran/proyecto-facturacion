package com.vipper.persistencia;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.vipper.modelo.Pedido;


public class AccesoPedido extends Conexion {

	public Pedido mostrarUno(int id) throws ClassNotFoundException, SQLException {

		String sql = "call facturacion.mostrarUnoPedido(?);";

		Pedido uno = null;
		CallableStatement st;
		ResultSet rs;

		// abrir Conexion
		abrirConexion();

		// recoger el comando
		st = miConexion.prepareCall(sql);
		// Asignar valor al parametro
		st.setInt(1, id);
		// Ejecutamos comando
		rs = st.executeQuery();
		// recorremos el resulset
		if (rs.next()) {
			uno = new Pedido(rs.getInt("id_pedido"), rs.getString("descripcion"), rs.getInt("id"), rs.getInt("id_forma_pago"),rs.getDouble("total") , rs.getDate("fecha"), rs.getInt("id_servicio"),rs.getInt("id_contrato") , rs.getDouble("importe_facturado"));

		}
		cerrarConexion();
		return uno;

	}

	public String verificarPassword(String usuario) throws ClassNotFoundException, SQLException {
		// Declarar las variables
		String sql = "call verificarPassword(?);";
		CallableStatement st;
		ResultSet rs;
		String password = null;

		abrirConexion();
		st = miConexion.prepareCall(sql);
		st.setString(1, usuario);

		rs = st.executeQuery();
		if (rs.next()) {
			password = rs.getString("password");
		}
		cerrarConexion();
		return password;

	}

}
