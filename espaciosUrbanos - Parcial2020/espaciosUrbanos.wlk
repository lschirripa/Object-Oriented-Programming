class UserException inherits Exception {

}

class EspaciosUrbanos {

	const property superficieTotal
	var property vallado
	var property valuacion
	const property trabajosRealizados = []

	method esGrande() = superficieTotal > 50 && self.criterioParaSerGrande()

	method cespedMasLindo() {
		valuacion = valuacion * 0.1
	}

	method aumentarValuacion(valor) {
		valuacion = valuacion + valor
	}

	method esDeUsoIntensivo() {
		return self.cantTrabajosHeavies() > 5
	}

	method criterioParaSerGrande()

	method cantTrabajosHeavies() {
		return self.trabajosRealizadosHeavies().size()
	}
	method trabajosRealizadosHeavies() = trabajosRealizados.filter({trabajo => trabajo.esHeavy()})
	
	method esLimpiable() = false
}

class Plaza inherits EspaciosUrbanos {

	const property canchas

	method esVerde() = canchas == 0

	override method criterioParaSerGrande() = self.muchasCanchas()

	method muchasCanchas() = canchas > 2

	override method esLimpiable() = true

}

class Plazoleta inherits EspaciosUrbanos {

	const property procer
	const property cierraConLlave

	override method criterioParaSerGrande() = self.procer() && self.cierraConLlave()

	method procer() = procer.toLowerCase() == "san martin"

}

class Anfiteatro inherits EspaciosUrbanos {

	const property capacidad

	override method criterioParaSerGrande() = self.muchasPersonas()

	method muchasPersonas() = capacidad > 500

	override method esLimpiable() = self.esGrande()

}

class MultiEspacio inherits EspaciosUrbanos {

	const property multiEspacios = []

	method esVerde() = self.muchosMultiespacios()

	method muchosMultiespacios() = multiEspacios.size() > 3

	override method criterioParaSerGrande() = multiEspacios.all{ espacio => espacio.criterioParaSerGrande() }

}

class Trabajador {

	var property profesion = cerrajero
	

	method trabajaEn(espacio) = profesion.trabajaEn(espacio, self)
	
	method costoTrabajo(espacio) = profesion.costoTrabajo(espacio)
	
	method hizoTrabajoHeavy(trabajo){
		return profesion.esHeavy(trabajo)
	}
	
	method trabajar(espacio){
		profesion.validarTrabajo(espacio)
		profesion.trabajoRealizado(espacio)
		self.registrartrabajo(espacio)
	}
	method registrartrabajo(espacioUrbano) {
		const trabajo = new Trabajo(trabajadorQueRealizo = self, espacioUrbanoQueSeRealizoElTrabajo = self.trabajaEn(espacioUrbano, trabajador), duracionDelTrabajo = trabajador.profesion().duracionDeTrabajo(espacioUrbano), costoDelTrabajo = trabajador.profesion().costoTrabajo(espacioUrbano, trabajador))
		espacioUrbano.registrarTrabajo(trabajo)
	}
}

class Profesion {
	var property valorHoraDeTrabajo = 100
	const property trabajosRealizados = []

	method trabajaEnEspacio(espacio)
	
	method trabajoRealizado(espacio)

	method duracionDeTrabajo(espacio)

	method costoTrabajo(espacio) = self.duracionDeTrabajo(espacio) * self.valorHoraDeTrabajo()

	method validarTrabajo(espacioUrbano) {
		if (!self.trabajaEnEspacio(espacioUrbano)) {
			throw new UserException(message = "No se puede realizar el trabajo")
		}
	}
	
	method esHeavy(trabajo) = trabajo.costoDelTrabajo() > 10000

}

object cerrajero inherits Profesion {

	override method trabajaEnEspacio(espacio) = !espacio.vallado()

	override method trabajoRealizado(espacio) {
		espacio.vallado(true)
	}
	
    override method esHeavy(trabajo) {
		return trabajo.duracionDelTrabajo() > 5 || super(trabajo)
	}
	
	override method duracionDeTrabajo(espacio) = if (espacio.esGrande()) 5 else 3

}

object jardinero inherits Profesion {

	override  method trabajaEnEspacio(espacio) = espacio.esVerde()

	override method trabajoRealizado(espacio) {
		espacio.cespedMasLindo()
	}

	override method duracionDeTrabajo(espacio) = espacio.superficieTotal() / 10

	override method costoTrabajo(espacio) = 2500

}

object encargado inherits Profesion {

	override method trabajaEnEspacio(espacio) = espacio.esLimpiable()

	override method trabajoRealizado(espacio) {
		espacio.aumentarValuacion(5000)
	}

	override method duracionDeTrabajo(espacio) = 8

}

class Trabajo {

	const property fechaDelTrabajoRealizado = new Date()
	const property trabajadorQueRealizo
	const property espacioUrbanoQueSeRealizoElTrabajo
	const property duracionDelTrabajo
	const property costoDelTrabajo

	method esHeavy(espacio, trabajador) = trabajador.hizoTrabajoHeavy(self)

}

//------------------------------------------ MUNICIPALIDAD

object secretaria {
	var property espacios = []
	
	method espaciosUsoIntensivo() {
		return espacios.filter({espacio => espacio.esDeUsoIntensivo()})
	}
}


