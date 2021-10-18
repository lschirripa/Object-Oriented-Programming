object bouba {

	var salud = 100

	method salud(nuevaSalud) {
		salud = nuevaSalud
	}

	method salud() {
		return salud
	}

	method sabeCorrer() {
		return false
	}

	method recibirDanio(danio) {
		self.salud((salud - danio * 2).max(0))
	}

	method vivo() = salud > 0

}

object juliana {

	var property energia = 100

	method danio() = energia * 10 / 100

	method atacar(zombie) {
		zombie.recibirDanio(self.danio())
	}

}

object kiki {

	var salud = 100

	method salud(nuevaSalud) {
		salud = nuevaSalud
	}

	method salud() {
		return salud
	}

	method sabeCorrer() {
		return false
	}

	method recibirDanio(danio) {
		self.salud((salud - danio * 2).max(0))
	}

	method vivo() = salud > 0

}

