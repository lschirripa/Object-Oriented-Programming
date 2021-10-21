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

	var property valorBase = valoresAlAzar

	method puedeEnviarEseMensaje(mensaje) = mensaje.words().size() > 3

	method costoMensaje(mensaje) = mensaje.size() * valorBase.entreMinimoYMaximo(3, 7)

}

object valoresAlAzar {

	method entreMinimoYMaximo(minimo, maximo) = (minimo - 1).randomUpTo(maximo).roundUp(0)

}

class Sector {

	var property valor = 15

}

class MensajeroEstandar {

	const sector
	const cantidadMinimaDeCaracteres = 20

	method precioSector() = sector.valor()

	method puedeEnviarEseMensaje(mensaje) = mensaje.size() >= cantidadMinimaDeCaracteres

	method costoMensaje(mensaje) = mensaje.words().size() * self.precioSector()

}

// Manera correcta de crear el sector junto con el mensajero estandar
const elVip = new MensajeroEstandar(sector = new Sector(valor = 30))

const elRapido = new MensajeroEstandar(sector = new Sector(valor = 20))

const elEstandar = new MensajeroEstandar(sector = new Sector())

object agenciaDeMensajeria {

	const mensajeros = [ pali, messich, sherpa, chasqui, pichca, elRapido, elEstandar, elVip ]
	var property historialDeMensajes = []

	method mensajerosPosibles(mensaje) = mensajeros.filter{ mensajero => mensajero.puedeEnviarEseMensaje(mensaje) }

	method mensajeroElegido(mensaje) {
		if (self.mensajerosPosibles(mensaje).isEmpty()) {
			throw new UserException(message = "Ningun mensajero puede enviar su mensaje ")
		}
		return self.mensajerosPosibles(mensaje).min{ mensajero => mensajero.costoMensaje(mensaje) }
	}

	method recibirMensaje(mensaje) {
		if (mensaje.isEmpty()) {
			throw new UserException(message = "El mensaje esta vacio,no se puede enviar")
		}
		const _mensajero = self.mensajeroElegido(mensaje)
		self.registrarMensaje(mensaje, _mensajero)
	}

	method registrarMensaje(_mensaje, _mensajero) {
		historialDeMensajes.add(new Mensaje(mensajeARegistrar = _mensaje, mensajeroAEnviar = _mensajero))
	}

	method obtenerMensajesDelMes() = historialDeMensajes.filter({ mensaje => mensaje.fechaDelMensaje().between(new Date().minusDays(30), new Date()) })

	method gananciaMensajeria() = self.obtenerMensajesDelMes().map({ mensaje => mensaje.gananciaPorMensaje() }).sum()

	// Empleado del mes
	method chasquiQuilla() = (self.obtenerMensajesDelMes()).map({ mensajero => mensajero.mensajeroAEnviar() }).max({ mensajero => self.mensajesEntregado(mensajero) })

	method mensajesEntregado(mensajero) = self.obtenerMensajesDelMes().filter({ mensaje => mensaje.mensajeroAEnviar() == mensajero }).size()

}

class Mensaje {

	var property mensajeARegistrar = ""
	var property fechaDelMensaje = new Date()
	var property costoPorMensajeCorto = 500
	var property costoPorMensajeLargo = 900
	var property cantidadMinimaDeCaracteres = 30
	var property mensajeroAEnviar

	method precioPorMensaje(mensaje) = if (mensaje.size() < cantidadMinimaDeCaracteres) costoPorMensajeCorto else costoPorMensajeLargo

	method gananciaBruta() = self.precioPorMensaje(mensajeARegistrar)

	method costoAPagarAlMensajero() = mensajeroAEnviar.costoMensaje(mensajeARegistrar)

	method gananciaPorMensaje() = self.gananciaBruta() - self.costoAPagarAlMensajero()

}
