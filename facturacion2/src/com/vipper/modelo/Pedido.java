package com.vipper.modelo;

import java.sql.Date;


public class Pedido {
	
private int id_pedido;
private String descripcion;
private int id;
private int id_forma_pago;
private double total;
private Date fecha;
private int id_servicio;
private int id_contrato;
private double importe_facturado;

public Pedido() {
	// TODO Auto-generated constructor stub
}

@Override
public String toString() {
	return "Pedido [id_pedido=" + id_pedido + ", descripcion=" + descripcion + ", id=" + id + ", id_forma_pago="
			+ id_forma_pago + ", total=" + total + ", fecha=" + fecha + ", id_servicio=" + id_servicio
			+ ", id_contrato=" + id_contrato + ", importe_facturado=" + importe_facturado + "]";
}

public Pedido(int id_pedido, String descripcion, int id, int id_forma_pago, double total, Date fecha,
		int id_servicio, int id_contrato, double importe_facturado) {
	super();
	this.id_pedido = id_pedido;
	this.descripcion = descripcion;
	this.id = id;
	this.id_forma_pago = id_forma_pago;
	this.total = total;
	this.fecha = fecha;
	this.id_servicio = id_servicio;
	this.id_contrato = id_contrato;
	this.importe_facturado = importe_facturado;
}

public int getId_pedido() {
	return id_pedido;
}

public void setId_pedido(int id_pedido) {
	this.id_pedido = id_pedido;
}

public String getDescripcion() {
	return descripcion;
}

public void setDescripcion(String descripcion) {
	this.descripcion = descripcion;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public int getId_forma_pago() {
	return id_forma_pago;
}

public void setId_forma_pago(int id_forma_pago) {
	this.id_forma_pago = id_forma_pago;
}

public double getTotal() {
	return total;
}

public void setTotal(double total) {
	this.total = total;
}

public Date getFecha() {
	return fecha;
}

public void setFecha(Date fecha) {
	this.fecha = fecha;
}

public int getId_servicio() {
	return id_servicio;
}

public void setId_servicio(int id_servicio) {
	this.id_servicio = id_servicio;
}

public int getId_contrato() {
	return id_contrato;
}

public void setId_contrato(int id_contrato) {
	this.id_contrato = id_contrato;
}

public double getImporte_facturado() {
	return importe_facturado;
}

public void setImporte_facturado(double importe_facturado) {
	this.importe_facturado = importe_facturado;
}


}
