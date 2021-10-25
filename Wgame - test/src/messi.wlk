import wollok.game.*
import scalonetaInGame.*

object messi {
	
	var nombre = "Lionel"

	var property position = new Position(x = 0, y = 0) // o sino game.origin()

	method image() = "messi.png"
	
	method irA(nuevaPosicion) {
			position = nuevaPosicion
		}
	}
	

}

