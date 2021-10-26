import wollok.game.*
import scalonetaInGame.*
import messi.*

class Randoms {

	var property position = game.origin()

	method image()

	method perderAltura() {
		position = position.down(1)
		self.corregirPosicion()
	}

	method corregirPosicion() {
		if (self.salioDelTablero()) {
			position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)
			self.asignarNuevaVelocidad()
		}
	}

	method salioDelTablero() {
		return self.position().y() == -1
	}

	method asignarNuevaVelocidad()

}

object pelota inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) { // o game.at(1.randomUpTo(10).roundUp(), 5)))

	override method image() = "pelota.png"

	override method asignarNuevaVelocidad() {
		game.removeTickEvent("caePelota")
		game.onTick(50.randomUpTo(800).roundUp(), "caePelota", { self.perderAltura()})
	}

}

object trofeo inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) {

	override method image() = "trofeo.png"

	override method asignarNuevaVelocidad() {
		game.removeTickEvent("caeTrofeo")
		game.onTick(50.randomUpTo(800).roundUp(), "caeTrofeo", { self.perderAltura()})
	}

}

object china inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) {

	override method image() = "china.png"

	override method asignarNuevaVelocidad() {
		game.removeTickEvent("caeChina")
		game.onTick(50.randomUpTo(800).roundUp(), "caeChina", { self.perderAltura()})
	}

}

object dePaul inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) {

	override method image() = "depaul.png"

	override method asignarNuevaVelocidad() {
		game.removeTickEvent("caeDePaul")
		game.onTick(50.randomUpTo(800).roundUp(), "caeDePaul", { self.perderAltura()})
	}

}

object auxiliarRandom {

	const personajes = [ china, dePaul, trofeo, pelota ]
	var property elegido = personajes.anyOne()

	method image() = elegido.image()

}

