class Zombi {

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

class Sobreviviente {

	var property energia = 100

	method danio() = energia * 10 / 100

	method atacar(zombi) {
		zombi.recibirDanio(self.danio())
	}

	method ataqueMasivo(invasion) {
     invasion.zombis().map({unZombie => unZombie.recibirDanio(self.danio())})
	}

}

const bouba = new Zombi()

const kiki = new Zombi()

const juliana = new Sobreviviente(energia = 100)

const anastasia = new Sobreviviente(energia = 150)

object invasion {

	const property zombis = [ new Zombi() ]

	method tamanio() {
		return zombis.count({ zombi => zombi.vivo() })
	}

	method incrementar() {
		self.tamanio().times{ foo => zombis.add(new Zombi())}
	}

}

