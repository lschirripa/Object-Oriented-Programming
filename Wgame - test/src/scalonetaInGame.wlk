import wollok.game.*
import messi.*

object scalonetaInGame {

	method configurar() {
		game.addVisual(messi)
		game.showAttributes(messi) // Debug
		teclado.configurar()
	// self.configurarAcciones()
	}

}

object teclado {

	method configurar() {
		// keyboard.any().onPressDo{ juegoPepita.chequearEstadoJuego()}
		keyboard.left().onPressDo{ messi.irA(messi.position().left(1))}
		keyboard.right().onPressDo{ messi.irA(messi.position().right(1))}
		keyboard.up().onPressDo{ messi.irA(messi.position().up(1))}
		keyboard.down().onPressDo{ messi.irA(messi.position().down(1))}
	//	keyboard.c().onPressDo{ juegoPepita.atraparComida()}
	}

}

