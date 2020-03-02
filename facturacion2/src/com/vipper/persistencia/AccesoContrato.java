package com.vipper.persistencia;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.vipper.modelo.Contrato;


public class AccesoContrato extends Conexion {
	
	public Contrato mostrarUno(int id_contrato) throws ClassNotFoundException, SQLException {
		
		String sql = "call facturacion.mostrarUnoContrato(?);";
		Contrato uno = null;
		CallableStatement st;
		ResultSet rs;

		// abrir Conexion
		abrirConexion();

		// recoger el comando
		st = miConexion.prepareCall(sql);
		// Asignar valor al parametro
		st.setInt(1, id_contrato);
		// Ejecutamos comando
		rs = st.executeQuery();
		// recorremos el resulset
		if (rs.next()) {
			uno = new Contrato(rs.getInt("id_contrato"), rs.getInt("id"), rs.getDouble("comision"), rs.getString("encargado_facturacion"));
		}
		cerrarConexion();
		return uno;
	}
	
	public boolean altaContrato(Contrato contrato) throws ClassNotFoundException, SQLException {
		
		String sql = "call facturacion.altaContrato(?, ?, ?, '?');";
		CallableStatement st;
		int numRegistros;
		
		// abrir Conexion
		abrirConexion();

		// recoger el comando
		st = miConexion.prepareCall(sql);
		// Asignar valor al parametro
		st.setInt(1,contrato.getId_contrato());
		st.setInt(2, contrato.getId());
		st.setDouble(3, contrato.getComision());
		st.setString(4, contrato.getEncargado_facturacion());
		
		//Ejecutar el comando
        numRegistros = st.executeUpdate();
        cerrarConexion();
        return numRegistros > 0;
	}
	
public boolean bajaContrato(int id_contrato) throws ClassNotFoundException, SQLException {
		
		String sql = "call facturacion.bajaContrato(?);";
		CallableStatement st;
		int numRegistros;
		
		// abrir Conexion
		abrirConexion();

		// recoger el comando
		st = miConexion.prepareCall(sql);
		// Asignar valor al parametro
		st.setInt(1, id_contrato);
		
		
		//Ejecutar el comando
        numRegistros = st.executeUpdate();
        cerrarConexion();
        return numRegistros > 0;
	}
}
