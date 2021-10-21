object spa {

	method atender(persona) {
		persona.recibirMasajes()
		persona.darseUnBanioDeVapor()
	}

}

object olivia {

	var property gradoDeConcentracion = 4
	var property cantMasajes = 0

	method recibirMasajes() {
		if (cantMasajes >= 2) {
			gradoDeConcentracion += 3
		}
		gradoDeConcentracion += 2
		cantMasajes += 1
	}

	method darseUnBanioDeVapor() {
		gradoDeConcentracion += 1
	}

	method esFeliz() {
		return self.gradoDeConcentracion() >= 7
	}

	method discutir() {
		gradoDeConcentracion = 5.min(self.gradoDeConcentracion())
	}

}

object adriano {

	var property nivelDeContractura = 5
	var property frescoParaProgramar = true

	method recibirMasajes() {
		nivelDeContractura = (nivelDeContractura - 2).max(0)
	}

	method darseUnBanioDeVapor() {
		frescoParaProgramar = true
	}

	method comerBigMac() {
		frescoParaProgramar = true
	}

	method codear() {
		if (frescoParaProgramar) nivelDeContractura += 1 else (nivelDeContractura += 3)
		frescoParaProgramar = false
	}

	method trabajarUnDia() {
		self.codear()
		self.comerBigMac()
		self.codear()
	}

}

class Producto {

	var property descripcion
}

class ProductoNormal inherits Producto{
	var property precioUnitario
}

class ProductoPorPeso inherits Producto{
	var property peso
	var property pesoPorKilo
	
	method precioAAbonar() {
		return pesoPorKilo*peso
	}
	
	method precioUnitario(){
		return self.precioAAbonar()
	}
}

const manzana = new ProductoNormal(descripcion = "verde", precioUnitario = 20)
const banana = new ProductoNormal(descripcion = "amarilla", precioUnitario = 30)
const milanga = new ProductoNormal(descripcion = "rica", precioUnitario = 50)

const berenjena = new ProductoPorPeso(descripcion = "fea", peso=10, pesoPorKilo=5)

object carrito {

	const productos = []

	method agregar(producto) {
		productos.add(producto)
	}
	
	method estaVacio(){
		return productos == []
	}
	
	method cantidadDeProductos(){
		return productos.size()
	}
	
	method totalAAbonar(){
		return productos.map({unProducto => unProducto.precioUnitario()}).sum()
	}
	
}



