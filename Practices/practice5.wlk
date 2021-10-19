class Maestro {

	var property habilidad = 100

	method esGroso() {
		return habilidad > 5 && self.poder() > 1000
	}

	method poder()

}

class MaestroAgua inherits Maestro {

	override method poder() {
		return habilidad * 100
	}

	method esPeligroso() {
		return self.poder() > 3000
	}

}

class MaestroFuego inherits Maestro {

	var property rabia
	var property locura

	override method poder() {
		return rabia / locura
	}

}

class MaestroSangre inherits MaestroAgua {

	override method esPeligroso() {
		return true
	}

	override method poder() {
		return super() * 2
	}

}

object aang inherits Maestro {
	

	override method poder() {
		return 1
	}

}

object appa{
	
}

object momo{
	
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

