class MaestroAgua {

	var property habilidad

	method esGroso() {
		return habilidad > 5
	}

	method poder() {
		return habilidad * 100
	}

}

class MaestroFuego {

	var property habilidad
	var property rabia
	var property locura

	method esGroso() {
		return habilidad > 5
	}

	method poder() {
		return rabia/locura
	}

}

class Bisonte{
	var peso
	method peso() = peso
	
	method comer(){
		peso += 2
	}
}

class BisonteVolador inherits Bisonte{
	
	method yipYip(){
		peso -= 1
	}
}

