package com.vipper.persistencia;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.vipper.modelo.Contrato;
import com.vipper.modelo.FormaPago;

public class AccesoFormaPago extends Conexion {
	
	public FormaPago mostrarUno(int id_forma_pago) throws ClassNotFoundException, SQLException {
		
		String sql = "call facturacion.mostrarUnoFormaPago(?);";
		FormaPago uno = null;
		CallableStatement st;
		ResultSet rs;

		// abrir Conexion
		abrirConexion();

		// recoger el comando
		st = miConexion.prepareCall(sql);
		// Asignar valor al parametro
		st.setInt(1, id_forma_pago);
		// Ejecutamos comando
		rs = st.executeQuery();
		// recorremos el resulset
		if (rs.next()) {
			uno = new FormaPago(rs.getInt("id_forma_pago"),rs.getString("descripcion"), rs.getDouble("valor"));
		}
		cerrarConexion();
		return uno;
	}
	
	public boolean altaFormaPago (FormaPago formaPago) throws ClassNotFoundException, SQLException {
		
		String sql = "call facturacion.altaFormaPago(?, '?', ?);";
		CallableStatement st;
		int numRegistros;
		
		// abrir Conexion
		abrirConexion();

		// recoger el comando
		st = miConexion.prepareCall(sql);
		// Asignar valor al parametro
		st.setInt(1, formaPago.getId_forma_pago());
		st.setString(2, formaPago.getDescripcion());
		st.setDouble(3, formaPago.getValor());
		
		//Ejecutar el comando
        numRegistros = st.executeUpdate();
        cerrarConexion();
        return numRegistros > 0;
        
}
	
	public boolean bajaFormaPago(int id_forma_pago) throws ClassNotFoundException, SQLException {
		
		String sql = "call facturacion.bajaFormaPago(?);";
		CallableStatement st;
		int numRegistros;
		
		// abrir Conexion
		abrirConexion();

		// recoger el comando
		st = miConexion.prepareCall(sql);
		// Asignar valor al parametro
		st.setInt(1, id_forma_pago);
		
		
		//Ejecutar el comando
        numRegistros = st.executeUpdate();
        cerrarConexion();
        return numRegistros > 0;
	}
	
}
