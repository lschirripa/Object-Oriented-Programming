class UserException inherits Exception {

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////           PERSONAS             //////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Persona {

	var property edad
	var property nombre
	var property ciudad
	var property anticuerpos = 10
	var property inmunidad = new Date()
	var property criterioDeVacunacion
	var property historialDeVacunacion = []

	method aumentarAnticuerpos(vacuna) {
		anticuerpos += vacuna.otorgarAnticuerpos(self)
	}

	method aumentarInmunidad(vacuna) {
		inmunidad = vacuna.otorgarInmunidad(self)
	}

	method esEspecial() = ciudadesEspeciales.contains(ciudad.toLowerCase())

// tambien pude haber hecho esEspecial(persona) = ciudad == "tierra del fuego" || "neuquen" || "santa cruz",
// pero por alguna razon me parecio mas linda y sostenible a largo plazo la opcion de una lista
	method aceptarTurno(vacuna) {
		if (!self.aceptaVacuna(vacuna)) {
			throw new UserException(message = "la persona no acepta esta vacuna segun sus criterios, intente con otra")
		}
		self.aplicarVacuna(vacuna)
	}

	method aplicarVacuna(vacuna) {
		self.aumentarAnticuerpos(vacuna)
		self.aumentarInmunidad(vacuna)
		self.agregarVacunaAlHistorial(vacuna)
	}

	method aceptaVacuna(vacuna) = criterioDeVacunacion.eligeVacuna(self, vacuna)

	method vacunasQueAcepta() = vacunasDisponibles.filter({ vacuna => self.aceptaVacuna(vacuna) })

	method esTremendoAntivacuna() = self.vacunasQueAcepta().isEmpty()

	method vacunaMasBarataPosible() = self.vacunasQueAcepta().min({ vacuna => vacuna.costoTotalVacuna(self) })

	method costosDeLasVacunasQueAcepta() = self.vacunasQueAcepta().map({ vacuna => vacuna.costoTotalVacuna(self) })

	method costoDeLaVacunaMasBarataPosible() = self.costosDeLasVacunasQueAcepta().min()

	method agregarVacunaAlHistorial(vacuna) {
		historialDeVacunacion.add(vacuna)
	}

}

const ginesGarcia = new Persona(edad = 60, nombre = "ladri1", ciudad = "TIERRA del FUEgo", criterioDeVacunacion = cualquierosa)

const hijoDeGinesGarcia = new Persona(edad = 30, nombre = "ladri2", ciudad = "la PamPA", criterioDeVacunacion = anticuerposa)

const nietoDeGinesGarcia = new Persona(edad = 7, nombre = "ladri3", ciudad = "Santiago del Estero", criterioDeVacunacion = inmunidosaVariable7)

const mamaDeGinesGarcia = new Persona(edad = 90, nombre = "ladri4", ciudad = "bueNOS AIRES", criterioDeVacunacion = inmunidosaFija)

const papaDeGinesGarcia = new Persona(edad = 80, nombre = "ladri5", ciudad = "NEUQUEN", criterioDeVacunacion = inmunidosaVariable2)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////           VACUNAS             ///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Vacuna {

	var property costoInicialVacuna = 1000

	method otorgarAnticuerpos(persona)

	method otorgarInmunidad(persona)

	method costoExtraDeVacuna(persona)

	method calcularCostoAdicionalPorEdad(persona) = ((persona.edad() - 30) * 50).max(0)

	method costoTotalVacuna(persona) = costoInicialVacuna + self.calcularCostoAdicionalPorEdad(persona) + self.costoExtraDeVacuna(persona)

	method agregarMesesDeInmunidad(persona, valor) = persona.inmunidad().plusMonths(valor)

}

class Paifer inherits Vacuna {

	method personaMayorDe(persona, edad) = persona.edad() > edad

	override method otorgarAnticuerpos(persona) = persona.anticuerpos() * 10

	override method otorgarInmunidad(persona) = if (self.personaMayorDe(persona, 40)) self.agregarMesesDeInmunidad(persona, 6) else self.agregarMesesDeInmunidad(persona, 9)

	override method costoExtraDeVacuna(persona) = if (self.personaMayorDe(persona, 18)) 400 else 100

}

class Larussa inherits Vacuna {

	var property multiplicador

	override method otorgarAnticuerpos(persona) {
		if (multiplicador > 20) {
			throw new UserException(message = "el multiplicador de esta vacuna debe ser menor o igual a 20, modifiquelo e intente nuevamente")
		}
		return persona.anticuerpos() * multiplicador
	}

	override method otorgarInmunidad(persona) = new Date(day = 3, month = 3, year = 2022)

	override method costoExtraDeVacuna(persona) = 100 * multiplicador

}

class AstraLaVistaZeneca inherits Vacuna {

	method tieneNombrePar(persona) = persona.nombre().length().even()

	override method otorgarAnticuerpos(persona) = 10000

	override method otorgarInmunidad(persona) = if (self.tieneNombrePar(persona)) self.agregarMesesDeInmunidad(persona, 6) else self.agregarMesesDeInmunidad(persona, 7)

	override method costoExtraDeVacuna(persona) = if (persona.esEspecial()) 2000 else 0

}

class Combineta inherits Vacuna {

	const property dosisCombinadas = []

	method totalDeDosisCombinadas() = dosisCombinadas.size()

	method listarAnticuerposDeDosisCombinadas(persona) = dosisCombinadas.map({ dosis => dosis.otorgarAnticuerpos(persona) })

	method listarInmunidadDeDosisCombinadas(persona) = dosisCombinadas.map({ dosis => dosis.otorgarInmunidad(persona) })

	method listarCostoExtraDeCadaVacuna(persona) = dosisCombinadas.map({ dosis => dosis.costoExtraDeVacuna(persona) })

	override method otorgarAnticuerpos(persona) = self.listarAnticuerposDeDosisCombinadas(persona).min()

	override method otorgarInmunidad(persona) = self.listarInmunidadDeDosisCombinadas(persona).max()

	override method costoExtraDeVacuna(persona) = self.listarCostoExtraDeCadaVacuna(persona).sum() + self.costoExtraPorDosisCombinadas()

	method costoExtraPorDosisCombinadas() = self.totalDeDosisCombinadas() * 100

}

const paifer = new Paifer()

const larussa2 = new Larussa(multiplicador = 2)

const larussa5 = new Larussa(multiplicador = 5)

const astraLaVistaZeneca = new AstraLaVistaZeneca()

const combineta = new Combineta(dosisCombinadas = [ paifer, larussa2 ])

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////           CRITERIOS             /////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
object cualquierosa {

	method eligeVacuna(persona, vacuna) = true

}

object anticuerposa {

	method eligeVacuna(persona, vacuna) = vacuna.otorgarAnticuerpos(persona) > 100000

}

object inmunidosaFija {

	const fechaMinimaDeInmunidad = new Date(day = 5, month = 3, year = 2022)

	method eligeVacuna(persona, vacuna) = vacuna.otorgarInmunidad(persona) >= fechaMinimaDeInmunidad

}

class InmunidosaVariable {

	var property mesesMinimosDeInmunidad

	method fechaMinimaDeInmunidad() = new Date().plusMonths(mesesMinimosDeInmunidad)

	method eligeVacuna(persona, vacuna) = vacuna.otorgarInmunidad(persona) >= self.fechaMinimaDeInmunidad()

}

const inmunidosaVariable2 = new InmunidosaVariable(mesesMinimosDeInmunidad = 2)

object inmunidosaVariable7 inherits InmunidosaVariable(mesesMinimosDeInmunidad = 7) {

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////           VACUNATORIO VIP             ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
object vacunatorioVip {

	method personasCoherentes() = personasAVacunar.filter({ persona => !persona.esTremendoAntivacuna() })

	method costoDelPlanInicialDeVacunacion() = self.personasCoherentes().map({ persona => persona.costoDeLaVacunaMasBarataPosible() }).sum()

	method enviarTurno(persona, vacuna) = persona.aceptarTurno(vacuna)

}

const ciudadesEspeciales = [ "tierra del fuego", "santa cruz", "neuquen" ]

const vacunasDisponibles = [ paifer, larussa2, larussa5, astraLaVistaZeneca, combineta ]

const personasAVacunar = [ ginesGarcia, hijoDeGinesGarcia, nietoDeGinesGarcia, mamaDeGinesGarcia, papaDeGinesGarcia ]

