package com.vipper.modelo;

public class FormaPago {

	private int id_forma_pago;
	private String descripcion;
	private double valor;
	
	public FormaPago() {
		// TODO Auto-generated constructor stub
	}

	public FormaPago(int id_forma_pago, String descripcion, double valor) {
		super();
		this.id_forma_pago = id_forma_pago;
		this.descripcion = descripcion;
		this.valor = valor;
	}

	@Override
	public String toString() {
		return "FormaPago [id_forma_pago=" + id_forma_pago + ", descripcion=" + descripcion + ", valor=" + valor + "]";
	}

	public int getId_forma_pago() {
		return id_forma_pago;
	}

	public void setId_forma_pago(int id_forma_pago) {
		this.id_forma_pago = id_forma_pago;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}
	
	
}
