// matrix
object laMatrix {

	method dejaEntrar(persona) {
		return persona.meAlcanza()
	}

}

object puenteDeBrooklyn {

	method dejaEntrar(persona) {
		return (persona.peso()) <= 1000
	}

}

object neo {

	var credito = 7
	var property peso = 0

	method meAlcanza() {
		return credito > 5
	}

	method llamar() {
		if (self.meAlcanza()) credito = credito - 5
	}

}

object paquete {

	var property destino = laMatrix
	var property pago = false

	method pagar() {
		pago = true
	}

	method estaPago() {
		return pago
	}

	method puedeSerEntregadoPor(persona) {
		return self.estaPago() && destino.dejaEntrar(persona)
	}

}

object roberto {

	var property peso = 90
	var property credito = 0

	method meAlcanza() {
		return credito > 5
	}

	method llamar() {
		if (self.meAlcanza()) credito = credito - 5
	}

}

object chuck {

	var property peso = 900

	method meAlcanza() {
		return true
	}

	method llamar() {
		return true
	}

}

object prueba {

	method robertoTieneBici() {
		roberto.peso(roberto.peso() + 1)
	}

	method robertoTieneCamionCon1Acoplado() {
		roberto.peso(roberto.peso() + 500)
	}

	method unAcopladoMasParaElCamionDeRoberto() {
		roberto.peso(roberto.peso() + 500)
	}

}

object mensajeria {

	var empleados = [neo,chuck]
	var property paquetesPendientes = []

	method empleados() {
		return empleados
	}

	method contratar(chuck) {
		empleados.add(chuck)
	}

	method despedir(unEmpleado) {
		empleados.remove(unEmpleado)
	}

	method despedirATodos() {
		empleados = []
	}

	method esGrande() {
		return empleados.size() > 2
	}

	method loEntregaElPrimero() {
		return paquete.puedeSerEntregadoPor(empleados.first())
	}

	method pesoDelUltimo() {
		return empleados.last().peso()
	}

	method algunoPuedeEntregar(unPaquete) {
		return empleados.any({ unEmpleado => unPaquete.puedeSerEntregadoPor(unEmpleado) })
	}

	method candidatosPara(unPaquete) {
		return empleados.filter({ unEmpleado => unPaquete.puedeSerEntregadoPor(unEmpleado) })
	}

	method tieneSobrepeso() {
		return ( empleados.map({ unEmpleado => unEmpleado.peso() }).sum() / empleados.size() ) > 500
	}

	method enviar(unPaquete) {
		if (self.candidatosPara(unPaquete) == []) paquetesPendientes.add(unPaquete)
	}
	
	
	
}

object paquetito {

	var property destino = laMatrix
	var property pago = true

	method pagar() {
		pago = true
	}

	method estaPago() {
		return pago
	}

	method puedeSerEntregadoPor(persona) {
		return self.estaPago() && destino.dejaEntrar(persona)
	}

}

object paqueton {

	var property destinos = []
	var deuda = 0

	method pagar(importe) {
		deuda = deuda - importe
	}

	method estaPago() {
		return deuda == 0
	}

//	method puedeSerEntregadoPor(persona) {
//		return self.estaPago() && destino.dejaEntrar(persona)
//	}
}

