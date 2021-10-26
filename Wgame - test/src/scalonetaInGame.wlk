import wollok.game.*
import messi.*
import objetosRandoms.*

object scalonetaInGame {

	method configurar() {
		game.addVisual(messi)
		game.addVisual(china)
		game.addVisual(dePaul)
		game.addVisual(pelota)
		game.addVisual(trofeo)
		game.showAttributes(china) // Debug
		game.showAttributes(dePaul)
		game.showAttributes(pelota)
		game.showAttributes(trofeo)
		teclado.configurar()
	// self.configurarAcciones()
	}

	method configurarAcciones() {
		game.onTick(800, "cae", { china.perderAltura()})
		game.onTick(800, "cae", { dePaul.perderAltura()})
		game.onTick(800, "cae", { pelota.perderAltura()})
		game.onTick(800, "cae", { trofeo.perderAltura()})
	}

}

object teclado {

	method configurar() {
		// keyboard.any().onPressDo{ juegoPepita.chequearEstadoJuego()}
		keyboard.left().onPressDo{ messi.irA(messi.position().left(1))}
		keyboard.right().onPressDo{ messi.irA(messi.position().right(1))}
		keyboard.up().onPressDo{ messi.irA(messi.position().up(1))}
		keyboard.down().onPressDo{ messi.irA(messi.position().down(1))}
	// keyboard.c().onPressDo{ juegoPepita.atraparComida()}
	}

}

