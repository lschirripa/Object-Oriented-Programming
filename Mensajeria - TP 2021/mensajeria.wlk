class UserException inherits Exception {

}

object chasqui {

	method puedeEnviarEseMensaje(mensaje) = mensaje.size() < 50

	method costoMensaje(mensaje) = mensaje.size() * 2

}

object sherpa {

	var property precio = 60

	method puedeEnviarEseMensaje(mensaje) = mensaje.length().even()

	method costoMensaje(mensaje) = precio

}

object messich {

	var property precioPorPalabra = 10

	method puedeEnviarEseMensaje(mensaje) = !mensaje.startsWith("a")

	method costoMensaje(mensaje) = mensaje.words().size() * precioPorPalabra

}

object pali {

	var property maximoMensaje = 80
	var property indice = 4

	method puedeEnviarEseMensaje(mensaje) {
		const mensajeSinEspaciosYEnLetrasMinusculas = mensaje.words().join("").toLowerCase()
		return mensajeSinEspaciosYEnLetrasMinusculas == mensajeSinEspaciosYEnLetrasMinusculas.reverse()
	}

	method costoMensaje(mensaje) = (mensaje.length() * indice).min(maximoMensaje)

}

object pichca {

	method puedeEnviarEseMensaje(mensaje) = mensaje.words().size() > 3

	method costoMensaje(mensaje) = mensaje.size() * valoresAlAzar.entreMinimoYMaximo(3, 7)

}

object valoresAlAzar {

	method entreMinimoYMaximo(minimo, maximo) = (minimo - 1).randomUpTo(maximo).roundUp(0)

}

const enviosRapidos = new MensajeroEstandar(precioSector = 20)

const enviosEstandares = new MensajeroEstandar()

const enviosVip = new MensajeroEstandar(precioSector = 30)

class MensajeroEstandar {

	const precioSector = 15
	const cantidadMinimaDeCaracteres = 20

	method precioSector() = precioSector

	method puedeEnviarEseMensaje(mensaje) = mensaje.size() >= cantidadMinimaDeCaracteres

	method costoMensaje(mensaje) = mensaje.words().size() * precioSector

}

object agenciaDeMensajeria {

	var property costoPorMensajeCorto = 500
	var property costoPorMensajeLargo = 900
	var property cantidadMinimaDeCaracteres = 30
	const mensajeros = [ pali, messich, sherpa, chasqui, pichca, enviosRapidos, enviosEstandares, enviosVip ]
	const historialDeMensajes = []

	method historialDeMensajes() = historialDeMensajes

	method mensajerosPosibles(mensaje) = mensajeros.filter{ mensajero => mensajero.puedeEnviarEseMensaje(mensaje) }

	method mensajeroElegido(mensaje) {
		if (self.mensajerosPosibles(mensaje).isEmpty()) {
			throw new UserException(message = "Ningun mensajero puede enviar su mensaje ")
		}
		return self.mensajerosPosibles(mensaje).min{ mensajero => mensajero.costoMensaje(mensaje) }
	}

	method recibirMensaje(mensaje) {
		if (mensaje.isEmpty()) {
			throw new UserException(message = "El mensaje esta vacio")
		}
			// esa excepcion ya esta siendo tratada, hace sentido volver a tratarla??
		self.mensajeroElegido(mensaje)
		self.registrarMensaje(mensaje)
	}

	method registrarMensaje(mensaje) {
		historialDeMensajes.add(self.crearMensajeNuevo(mensaje))
	}

	method crearMensajeNuevo(mensaje) = new Mensaje(mensajeARegistrar = mensaje, precioQueCobraElMensajero = self.mensajeroElegido(mensaje).costoMensaje(mensaje), mensajeroQueEnviara = self.mensajeroElegido(mensaje))

	method precioPorMensaje(mensaje) = if (mensaje.size() < cantidadMinimaDeCaracteres) costoPorMensajeCorto else costoPorMensajeLargo

	method obtenerMensajesDelMes() = historialDeMensajes.filter({ mensaje => mensaje.fechaDelMensaje().between(new Date().minusDays(30), new Date()) })

	method obtenerGananciaNetaDelMes() = self.gananciaBrutaDeLaMensajeriaDelMes() - self.valorAPagarAlosMensajeros()

	method valorAPagarAlosMensajeros() = (self.obtenerMensajesDelMes().map({ valor => valor.precioQueCobraElMensajero() })).sum()

	method gananciaBrutaDeLaMensajeriaDelMes() = (self.obtenerMensajesDelMes()).map({ mensaje => mensaje.mensajeARegistrar() }).map({ mensaje => self.precioPorMensaje(mensaje) }).sum()

	// empleado del mes
	method chasquiQuilla() {
		return (self.obtenerMensajesDelMes()).map({ mensajero => mensajero.mensajeroQueEnviara() }).max({ mensajero => self.mensajesEntregado(mensajero) })
	}

	method mensajesEntregado(mensajero) {
		return self.obtenerMensajesDelMes().filter({ mensaje => mensaje.mensajeroQueEnviara() == mensajero }).size()
	}

}

class Mensaje {

	const mensajeARegistrar = ""
	const fechaDelMensaje = new Date()
	const precioQueCobraElMensajero
	const mensajeroQueEnviara

	method mensajeroQueEnviara() = mensajeroQueEnviara

	method precioQueCobraElMensajero() = precioQueCobraElMensajero

	method mensajeARegistrar() = mensajeARegistrar

	method fechaDelMensaje() = fechaDelMensaje

}
 
