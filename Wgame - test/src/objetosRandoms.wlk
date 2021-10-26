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
	
	if(self.salioDelTablero()){
	position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9) }
  
}
	

	
	method salioDelTablero() {
		return self.position().y() == 0
	}

}

object pelota inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)){ // o game.at(1.randomUpTo(10).roundUp(), 5)))

	

	override method image() = "pelota.png"
	

	

}

object trofeo inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) {



	override method image() = "trofeo.png"

}

object china inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) {

	override method image() = "china.png"

}

object dePaul inherits Randoms(position = new Position(x = 1.randomUpTo(10).roundUp(), y = 9)) {

	override method image() = "depaul.png"

}

object auxiliarRandom {

const personajes = [ china, dePaul, trofeo, pelota ]

var property elegido = personajes.anyOne()

method image() = elegido.image()


}



