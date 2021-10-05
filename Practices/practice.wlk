object delfina {

	var jugabilidad
	var property nivelDeDiversion = 0
	var property consolaEnMano

	method agarrar(consola) {
		consolaEnMano = consola
	}

	method jugar(videojuego) {
		nivelDeDiversion = nivelDeDiversion + videojuego.otorga()
	}

}

object play {

	method jugabilidad() {
		return 10
	}

	method usar() {
	}

}

object portatil {

	var bateriaBaja = false

	method jugabilidad() {
		if (bateriaBaja) return 1 else return 8
	}

	method usar() {
		bateriaBaja = true
	}

}

object arkanoid {

	method otorga(consola) {
		return 50
	}

}

object mario {

	method otorga() {
		if (delfina.consolaEnMano().jugabilidad() > 5) return 100 else return 15
	}

}

object pokemon {

	method otorga() {
		return delfina.consolaEnMano().jugabilidad() * 10
	}

}

object carlosDuty {

	var cantidadDeLogros = 0

	method tiempoRestante() {
		return 30 - cantidadDeLogros * 0.5
	}

	method jugar(horas) {
		if (horas > 2) cantidadDeLogros = cantidadDeLogros + 1
	}

	method esViolento() {
		return true
	}

}

object timbaElLeon {

	var cantidadDeLogros = 0
	var tiempoRestante = 50

	method tiempoRestante() {
		return tiempoRestante
	}

	method jugar(horas) {
		tiempoRestante = tiempoRestante - horas
	}

	method esViolento() {
		return false
	}

}

object devilMayLaughVI {

	var nivelDeSangre = 3
	var cantidadDeLogros = 0

	method tiempoRestante() {
		return 100
	}

	method jugar(horas) {
		nivelDeSangre = nivelDeSangre + 1 + (horas * 0)
	}

	method esViolento() {
		return nivelDeSangre > 5
	}

}

//bibliotecaJuegos - Listas
object biblioteca {

	var property juegos = [ timbaElLeon, carlosDuty ]
	var property puntos = 0
	var juegosViolentos = juegos.filter({ unJuego => unJuego.esViolento() })

	method adquirirJuego(unJuego) {
		juegos.add(unJuego)
		puntos = puntos + 150
	}

	method borrarJuego(unJuego) {
		juegos.remove(unJuego)
	}

	method juegosViolentos() {
		return juegosViolentos
	}

	method esDeGamer() {
		return puntos > 1000 && juegos.size() > 5
	}

	method esJuegoRecomendable(unJuego) {
		return (not juegos.contains(unJuego)) && unJuego.esViolento()
	}

}

