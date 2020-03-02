package com.vipper.persistencia;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.vipper.modelo.ClienteProovedor;


public class AccesoClienteProovedor extends Conexion {

	
	public ClienteProovedor mostrarUno(int id) throws ClassNotFoundException, SQLException {

		String sql = "call facturacion.mostrarUnoClienteProovedor(?);";

		ClienteProovedor uno = null;
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
			uno = new ClienteProovedor(rs.getInt("id"), rs.getString("nif"), rs.getString("nombre"), rs.getString("direccion"), rs.getString("tipo"), rs.getString("email"), rs.getInt("telefono"));
		}
		cerrarConexion();
		return uno;

	}
	
	public boolean altaCliente(ClienteProovedor clienteProovedor) throws ClassNotFoundException, SQLException {
	
		String sql = "call facturacion.altaClienteProovedor('?', '?', '?', '?', '?', ?);";
		CallableStatement st;
		int numRegistros;
		
		// abrir Conexion
		abrirConexion();

		// recoger el comando
		st = miConexion.prepareCall(sql);
		// Asignar valor al parametro
		st.setInt(1,clienteProovedor.getId());
        st.setString(2,clienteProovedor.getNif());
        st.setString(3,clienteProovedor.getNombre());
        st.setString(4,clienteProovedor.getDireccion());
        st.setString(5,clienteProovedor.getTipo());
        st.setString(6,clienteProovedor.getEmail());
        st.setInt(7,clienteProovedor.getTelefono());
        
      //Ejecutar el comando
        numRegistros = st.executeUpdate();
        cerrarConexion();
        return numRegistros > 0;
	}
	
	public boolean bajaCliente(int id) throws ClassNotFoundException, SQLException {
		
		String sql = "call facturacion.bajaClienteProovedor(?);";
		CallableStatement st;
		int numRegistros;
		
		// abrir Conexion
		abrirConexion();

		// recoger el comando
		st = miConexion.prepareCall(sql);
		// Asignar valor al parametro
		st.setInt(1, id);
        
        
		//Ejecutar el comando
        numRegistros = st.executeUpdate();
        cerrarConexion();
        return numRegistros > 0;
	}
	
	
}
