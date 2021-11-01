import wollok.game.*
import scalonetaInGame.*
import messi.*

const MIN_VELOCIDAD = 50

const MAX_VELOCIDAD = 150

class Randoms {

	var property position = game.origin()

	method image()

	method perderAltura() {
		position = position.down(1)
		self.corregirPosicion()
		self.choqueAMessi()
	}

	method choqueAMessi()

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

object kiko inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) { // o game.at(1.randomUpTo(10).roundUp(), 5)))

	override method image() = "kiko.png"

	override method asignarNuevaVelocidad() {
		game.removeTickEvent("caeKiko")
		game.onTick(MIN_VELOCIDAD.randomUpTo(MAX_VELOCIDAD).roundUp(), "caeKiko", { self.perderAltura()})
	}

	override method choqueAMessi() {
		if (messi.meChocoAlguien(self)) game.sound("vamoniubel.mp3").play()
	}

}

object trofeo inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) {

	override method image() = "trofeo.png"

	override method asignarNuevaVelocidad() {
		game.removeTickEvent("caeTrofeo")
		game.onTick(MIN_VELOCIDAD.randomUpTo(MAX_VELOCIDAD).roundUp(), "caeTrofeo", { self.perderAltura()})
	}

	override method choqueAMessi() {
	}

}

object china inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) {

	override method image() = "china.png"

	override method asignarNuevaVelocidad() {
		game.removeTickEvent("caeChina")
		game.onTick(MIN_VELOCIDAD.randomUpTo(MAX_VELOCIDAD).roundUp(), "caeChina", { self.perderAltura()})
	}

	override method choqueAMessi() {
		if (messi.meChocoAlguien(self)) {
			messi.perderVidas(1)
			game.sound("chan.mp3").play()
		}
	}

}

object dePaul inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) {

	override method image() = "depaul.png"

	override method asignarNuevaVelocidad() {
		game.removeTickEvent("caeDePaul")
		game.onTick(MIN_VELOCIDAD.randomUpTo(MAX_VELOCIDAD).roundUp(), "caeDePaul", { self.perderAltura()})
	}

	override method choqueAMessi() {
	}

}

class MessiChiquito {

	var property position = new Position(x = 0, y = 9)

	method image()

	method vidasMessi(num) {
		return messi.vidas() < num
	}

}

object vida1 inherits MessiChiquito(position = game.at(0, 9)) {

	override method image() = if (self.vidasMessi(1)) "messiCaido.png" else "messiChiquito.png"

}

object vida2 inherits MessiChiquito(position = game.at(1, 9)) {

	override method image() = if (self.vidasMessi(2)) "messiCaido.png" else "messiChiquito.png"

}

object vida3 inherits MessiChiquito(position = game.at(2, 9)) {

	override method image() = if (self.vidasMessi(3)) "messiCaido.png" else "messiChiquito.png"

}

