class Persona {

	var property edad
	var property nombre
	var property ciudad
	const property ciudadesEspeciales = [ "tierra del fuego", "santa cruz", "neuquen" ]
	var property anticuerpos = 0
	var property inmunidad = new Date()

	method aumentarAnticuerpos(vacuna) {
		anticuerpos += vacuna.otorgarAnticuerpos(self)
	}

	method aumentarInmunidad(vacuna) {
		inmunidad = vacuna.otorgarInmunidad(self)
	}

	method esEspecial() = ciudadesEspeciales.contains(ciudad.toLowerCase())
	
	method aplicarseVacuna(vacuna){
		self.aumentarAnticuerpos(vacuna)
		self.aumentarInmunidad(vacuna)
	}

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

	override method otorgarAnticuerpos(persona) = persona.anticuerpos() * 10


	override method otorgarInmunidad(persona) = if (self.personaMayorDeEdad(persona, 40)) persona.inmunidad().plusMonths(6) else persona.inmunidad().plusMonths(9)
	

	override method costoExtraDeVacuna(persona) = if (self.personaMayorDeEdad(persona, 18)) 400 else 100

}

class Larussa inherits Vacuna {

	var property multiplicador

	override method otorgarAnticuerpos(persona) = persona.anticuerpos() * multiplicador.min(20)


	override method otorgarInmunidad(persona) = new Date(day = 3, month = 3, year = 2022)
	

	override method costoExtraDeVacuna(persona) = 100 * multiplicador

}

class AstraLaVistaZeneca inherits Vacuna {

	method tieneNombrePar(persona) = persona.nombre().length().even()

	override method otorgarAnticuerpos(persona) = 10000
	

	override method otorgarInmunidad(persona) = if (self.tieneNombrePar(persona)) persona.inmunidad().plusMonths(6) else persona.inmunidad().plusMonths(7)
	

	override method costoExtraDeVacuna(persona) = if (persona.esEspecial()) 2000 else 0

}

class Combineta inherits Vacuna {

	const property dosisCombinadas = []

	override method otorgarAnticuerpos(persona) = self.listarAnticuerposDeDosisCombinadas().min()
	

	override method otorgarInmunidad(persona) = self.listarInmunidadDeDosisCombinadas().max()
	

	method listarAnticuerposDeDosisCombinadas() = dosisCombinadas.map({ dosis => dosis.otorgarAnticuerpos() })

	method listarInmunidadDeDosisCombinadas() = dosisCombinadas.map({ dosis => dosis.otorgarInmunidad() })

	method listarCostoExtraDeCadaVacuna() = dosisCombinadas.map({ dosis => dosis.costoExtraDeVacuna() })


}

