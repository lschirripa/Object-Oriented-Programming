object chasqui {

	method puedeEnviarEseMensaje(mensaje) = mensaje.size() < 50

	method costoMensaje(mensaje) = mensaje.size() * 2

}

object sherpa {

	var precio = 60

	method puedeEnviarEseMensaje(mensaje) = mensaje.length().even()

	method precio(nuevoPrecio) {
		precio = nuevoPrecio
	}

	method costoMensaje(mensaje) = precio

}

object messich {

	var precioPorPalabra = 10

	method precio(nuevoPrecio) {
		precioPorPalabra = nuevoPrecio
	}

	method puedeEnviarEseMensaje(mensaje) = mensaje.charAt(0) != 'a'

	method costoMensaje(mensaje) = mensaje.words().size() * precioPorPalabra

}

object pali {

	method puedeEnviarEseMensaje(mensaje) {
		const mensajeSinEspaciosYEnLetrasMinusculas = mensaje.words().join("").toLowerCase()
		return mensajeSinEspaciosYEnLetrasMinusculas == mensajeSinEspaciosYEnLetrasMinusculas.reverse()
	}

	method costoMensaje(mensaje) {
		const maximoMensaje = 80
		const indice = 4
		return [ mensaje.length() * indice, maximoMensaje ].min()
	}

}


object agenciaDeMensajeria {

	const mensajeros = [ pali, messich, sherpa, chasqui ]

	method mensajerosPosibles(mensaje) = mensajeros.filter{ mensajero => mensajero.puedeEnviarEseMensaje(mensaje)}
	
	method mensajeroElegido(mensaje) = self.mensajerosPosibles(mensaje).min{ mensajero => mensajero.costoMensaje(mensaje)}
	

}