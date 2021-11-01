import wollok.game.*
import messi.*
import objetosRandoms.*

object scalonetaInGame {

	method configurar() {
		game.addVisual(messi)
		game.addVisual(china)
		game.addVisual(dePaul)
		game.addVisual(kiko)
		game.addVisual(trofeo)
		game.addVisual(vida1)
		game.addVisual(vida2)
		game.addVisual(vida3)
		game.addVisual(score)
		game.showAttributes(score)
		game.showAttributes(messi) // Debug
		game.showAttributes(china)
		game.showAttributes(dePaul)
		game.showAttributes(kiko)
		game.showAttributes(trofeo)
		teclado.configurar()
	}

	method configurarAcciones() {
		game.onTick(50.randomUpTo(800).roundUp(), "caeChina", { china.perderAltura()})
		game.onTick(50.randomUpTo(800).roundUp(), "caeDePaul", { dePaul.perderAltura()})
		game.onTick(50.randomUpTo(800).roundUp(), "caeKiko", { kiko.perderAltura()})
		game.onTick(50.randomUpTo(800).roundUp(), "caeTrofeo", { trofeo.perderAltura()})
	}

}

object teclado {

	method configurar() {
		// keyboard.any().onPressDo{ juegoPepita.chequearEstadoJuego()}
		keyboard.left().onPressDo{ messi.irA(messi.position().left(1))}
		keyboard.right().onPressDo{ messi.irA(messi.position().right(1))}
	// keyboard.up().onPressDo{ messi.irA(messi.position().up(1))}
	// keyboard.down().onPressDo{ messi.irA(messi.position().down(1))}
	// keyboard.c().onPressDo{ juegoPepita.atraparComida()}
	}

}

object score {

	var property position = game.at(8, 9)
	var property score = 0

	method text() = "score"

	method sumarScore(cantidad) {
		score += cantidad
	}

}

