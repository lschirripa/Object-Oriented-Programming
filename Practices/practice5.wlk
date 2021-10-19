class Maestro {

	var property habilidad

	method esGroso() {
		return habilidad > 5 && self.poder() > 1000
	}
	
	method poder()

}

class MaestroAgua inherits Maestro {

	override method poder() {
		return habilidad * 100
	}
	
	method esPeligroso(){
		return self.poder()>3000
	}

}

class MaestroFuego inherits Maestro {

	var property rabia
	var property locura

	override method poder() {
		return rabia / locura
	}

}

class MaestroSangre inherits MaestroAgua{
	
	override method esPeligroso(){
		return true
	}
}

class Bisonte {

	var peso

	method peso() = peso

	method comer() {
		peso += 2
	}

}

class BisonteVolador inherits Bisonte {

	method yipYip() {
		peso -= 1
	}

}

