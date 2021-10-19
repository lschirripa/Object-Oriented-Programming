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

}

class MaestroFuego inherits Maestro {

	var property rabia
	var property locura

	override method poder() {
		return rabia / locura
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

