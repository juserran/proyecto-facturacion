package com.vipper.modelo;

public class ClienteProovedor {
	private int id;
	private String nif;
	private String nombre;
	private String direccion;
	private String tipo;
	private String email;
	private int telefono;
	
	public ClienteProovedor() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ClienteProovedor(int id, String nif, String nombre, String direccion, String tipo, String email,
			int telefono) {
		super();
		this.id = id;
		this.nif = nif;
		this.nombre = nombre;
		this.direccion = direccion;
		this.tipo = tipo;
		this.email = email;
		this.telefono = telefono;
	}

	@Override
	public String toString() {
		return "ClienteProoveedor [id=" + id + ", nif=" + nif + ", nombre=" + nombre + ", direccion=" + direccion
				+ ", tipo=" + tipo + ", email=" + email + ", telefono=" + telefono + "]";
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNif() {
		return nif;
	}


	public void setNif(String nif) {
		this.nif = nif;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getTelefono() {
		return telefono;
	}


	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}
	
}
