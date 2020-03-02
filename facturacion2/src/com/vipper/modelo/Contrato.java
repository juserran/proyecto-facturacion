package com.vipper.modelo;

public class Contrato {
	private int id_contrato;
	private int id;
	private double comision;
	private String encargado_facturacion;
	
	public Contrato() {
		// TODO Auto-generated constructor stub
	}	

	public Contrato(int id_contrato, int id, double comision, String encargado_facturacion) {
		super();
		this.id_contrato = id_contrato;
		this.id = id;
		this.comision = comision;
		this.encargado_facturacion = encargado_facturacion;
	}

	@Override
	public String toString() {
		return "Contrato [id_contrato=" + id_contrato + ", id=" + id + ", comision=" + comision
				+ ", encargado_facturacion=" + encargado_facturacion + "]";
	}


	public int getId_contrato() {
		return id_contrato;
	}


	public void setId_contrato(int id_contrato) {
		this.id_contrato = id_contrato;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public double getComision() {
		return comision;
	}


	public void setComision(double comision) {
		this.comision = comision;
	}


	public String getEncargado_facturacion() {
		return encargado_facturacion;
	}


	public void setEncargado_facturacion(String encargado_facturacion) {
		this.encargado_facturacion = encargado_facturacion;
	}
	
}
