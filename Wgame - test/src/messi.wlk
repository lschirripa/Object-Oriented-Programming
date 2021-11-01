import wollok.game.*
import scalonetaInGame.*

const t3st = 1

object messi {

	const nombre = "Lionel"
	var property vidas = 3
	var property position = new Position(x = 0, y = 0) // o sino game.origin()

	method image() = "messi.png"

	method irA(nuevaPosicion) {
		position = nuevaPosicion
	}

	method perderVidas(cantidad) {
		vidas -= cantidad
	}

	method meChocoAlguien(alguno) {
		 return alguno.position() == self.position()
	}

}

