class Persona {

	var property edad
	var property nombre
	var property ciudad
	const property ciudadesEspeciales = [ "tierra del fuego", "santa cruz", "neuquen" ]
	var property anticuerpos = 0
	var property vacuna
	var property inmunidad = new Date()

	method aumentarAnticuerpos(valor) {
		anticuerpos += valor
	}

	method aumentarInmunidad(nuevaFecha) {
		inmunidad = nuevaFecha
	}

	method esEspecial() = ciudadesEspeciales.contains(ciudad.toLowerCase())

// tambien pude haber hecho esEspecial(persona) = ciudad == "tierra del fuego" || "neuquen" || "santa cruz",
// pero por alguna razon me parecio mas linda y sostenible a largo plazo la opcion de una lista
}

class Vacuna {

	var property costoInicialVacuna = 1000

	method otorgarAnticuerpos(persona)

	method otorgarInmunidad(persona)

	method costoExtraDeVacuna(persona)

	method calcularCostoAdicionalPorEdad(persona) = ((persona.edad() - 30) * 50).max(0)

	method costoTotalVacuna(persona) = costoInicialVacuna + self.calcularCostoAdicionalPorEdad(persona) + self.costoExtraDeVacuna(persona)

}

class Paifer inherits Vacuna {

	method personaMayorDeEdad(persona, edad) = persona.edad() > edad

	override method otorgarAnticuerpos(persona) {
		persona.aumentarAnticuerpos(persona.anticuerpos() * 10)
	}

	override method otorgarInmunidad(persona) {
		if (self.personaMayorDeEdad(persona, 40)) persona.aumentarInmunidad(persona.inmunidad().plusMonths(6)) else persona.aumentarInmunidad(persona.inmunidad().plusMonths(9))
	}

	override method costoExtraDeVacuna(persona) = if (self.personaMayorDeEdad(persona, 18)) 400 else 100

}

class Larussa inherits Vacuna {

	var property multiplicador

	override method otorgarAnticuerpos(persona) {
		persona.aumentarAnticuerpos(persona.anticuerpos() * multiplicador.min(20))
	}

	override method otorgarInmunidad(persona) {
		persona.aumentarInmunidad(new Date(day = 3, month = 3, year = 2022))
	}

	override method costoExtraDeVacuna(persona) = 100 * multiplicador

}

class AstraLaVistaZeneca inherits Vacuna {

	method tieneNombrePar(persona) = persona.nombre().length().even()

	override method otorgarAnticuerpos(persona) {
		persona.aumentarAnticuerpos(10000)
	}

	override method otorgarInmunidad(persona) {
		if (self.tieneNombrePar(persona)) persona.aumentarInmunidad(persona.inmunidad().plusMonths(6)) else persona.aumentarInmunidad(persona.inmunidad().plusMonths(7))
	}

	override method costoExtraDeVacuna(persona) = if(persona.esEspecial()) 2000 else 0

}

class Combineta inherits Vacuna {

	const property dosisCombinadas = []

	override method otorgarAnticuerpos(persona) {
		persona.aumentarAnticuerpos(self.listarAnticuerposDeDosisCombinadas().min())
	}

	override method otorgarInmunidad(persona) {
		persona.aumentarAnticuerpos(self.listarAnticuerposDeDosisCombinadas().max())
	}

	method listarAnticuerposDeDosisCombinadas() = dosisCombinadas.map({ dosis => dosis.anticuerpos() })

	method listarInmunidadDeDosisCombinadas() = dosisCombinadas.map({ dosis => dosis.inmunidad() })
	
	method listarCostoExtraDeCadaVacuna() = dosisCombinadas.map({ dosis => dosis.costoExtraDeVacuna() })
	
	override method costoExtraDeVacuna(persona) = 0

}

