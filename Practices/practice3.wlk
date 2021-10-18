object centralNuclear {

	var varillas = 200

	method esContaminante() {
		return varillas > 20
	}

	method produccionEnergetica() {
		return 0.1 * varillas
	}

}

object centralCarbon {

	var capacidad = 1000
	var riqueza = 0.9

	method esContaminante() {
		return true
	}

	method produccionEnergetica() {
		return 0.5 + capacidad * riqueza
	}

}

object centralEolica {

	var turbinas = 1

	method produccionEnergetica() {
		return turbinas * 0.2 * 10
	}

	method esContaminante() {
		return false
	}

}

object springfield {

	var property necesidadEnergetica = 1000000
	var centrales = [ centralEolica, centralCarbon, centralNuclear ]

	method centralesContaminantes() {
		return centrales.filter({ unaCentral => unaCentral.esContaminante() })
	}

	method sumaEnergetica() {
		return centrales.map({ unaCentral => unaCentral.produccionEnergetica() }).sum()
	}

	method cubreNecesidad() {
		return self.sumaEnergetica() > necesidadEnergetica
}

}


