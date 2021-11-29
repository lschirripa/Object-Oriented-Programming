class Persona {

	var property edad
	var property nombre
	var property ciudad
	var property anticuerpos = 0
	var property vacuna
	var property inmunidad = new Date()

	method aumentarAnticuerpos(valor) {
		anticuerpos += valor
	}

	method aumentarInmunidad(nuevaFecha) {
		inmunidad = nuevaFecha
	}

}

class Vacuna {

	var property costoInicialVacuna = 1000

	method otorgarAnticuerpos(persona)

	method otorgarInmunidad(persona)

	method costoExtraDeVacuna()

	method calcularCostoAdicionalPorEdad(persona) = ((persona.edad() - 30) * 50).max(0)

	method costoTotalVacuna(persona) = costoInicialVacuna + self.calcularCostoAdicionalPorEdad(persona) + self.costoExtraDeVacuna()

}

class Paifer inherits Vacuna {

	override method otorgarAnticuerpos(persona) {
		persona.aumentarAnticuerpos(persona.anticuerpos() * 10)
	}

	override method otorgarInmunidad(persona) {
		if (self.personaMayor(persona)) persona.aumentarInmunidad(persona.inmunidad().plusMonths(6)) else persona.aumentarInmunidad(persona.inmunidad().plusMonths(9))
	}

	method personaMayor(persona) = persona.edad() > 40

}

class Larussa inherits Vacuna {

	var property multiplicador

	override method otorgarAnticuerpos(persona) {
		persona.aumentarAnticuerpos(persona.anticuerpos() * multiplicador.min(20))
	}

	override method otorgarInmunidad(persona) {
		persona.aumentarInmunidad(new Date(day = 3, month = 3, year = 2022))
	}

}

class AstraLaVistaZeneca inherits Vacuna {

	override method otorgarAnticuerpos(persona) {
		persona.aumentarAnticuerpos(10000)
	}

	override method otorgarInmunidad(persona) {
		if (self.tieneNombrePar(persona)) persona.aumentarInmunidad(persona.inmunidad().plusMonths(6)) else persona.aumentarInmunidad(persona.inmunidad().plusMonths(7))
	}

	method tieneNombrePar(persona) = persona.nombre().length().even()

}

class Combineta inherits Vacuna {

	const property dosisCombinadas = []

	override method otorgarAnticuerpos(persona) {
		self.listarAnticuerposDeDosisCombinadas().min()
	}

	override method otorgarInmunidad(persona) {
		self.listarAnticuerposDeDosisCombinadas().max()
	}

	method listarAnticuerposDeDosisCombinadas() = dosisCombinadas.map({ dosis => dosis.anticuerpos() })

	method listarInmunidadDeDosisCombinadas() = dosisCombinadas.map({ dosis => dosis.inmunidad() })

}

