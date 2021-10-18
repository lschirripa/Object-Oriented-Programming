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
	const centrales = [ centralEolica, centralCarbon, centralNuclear ]

	method centralesContaminantes() {
		return centrales.filter({ unaCentral => unaCentral.esContaminante() })
	}

	method sumaEnergetica() {
		return centrales.map({ unaCentral => unaCentral.produccionEnergetica() }).sum()
	}

	method cubreNecesidad() {
		return self.sumaEnergetica() > necesidadEnergetica
	}

	method sumaEnergeticaDeContaminantes() {
		return self.centralesContaminantes().map({ unaCentral => unaCentral.produccionEnergetica() }).sum()
	}

	method estaAlHorno() {
		return (self.sumaEnergeticaDeContaminantes() > necesidadEnergetica / 2) || (centrales.all({ unaCentral => unaCentral.esContaminante() }))
	}

}

object albuquerque {

	const caudal = 150

	method produccionEnergetica() {
		return 2 * caudal
	}

	method sumaEnergetica() {
		return self.produccionEnergetica()
	}

}

object laRegion {

	const ciudades = []

	method agregarCiudad(ciudad) {
		ciudades.add(ciudad)
	}

	method principalCiudadProductora() {
		if (springfield.sumaEnergetica() > albuquerque.sumaEnergetica()) return springfield else return albuquerque
	}

	method principalesCentrales() {
	}

}

object pepita {
  var property energia = 50

  method comerAlpiste(cantidad) {
    if (cantidad <= 0) {
      self.error("La cantidad de comida debe ser positiva")
    }
    energia += cantidad * 2
  }

  method volarEnCirculos() {
    if (energia < 20) {
      self.error("pepita no tiene suficiente energía para volar")      
    }
    energia -= 20
  }

}

object carlos{
	
	method estudiarPepita(){
		pepita.comerAlpiste(10)
		pepita.volarEnCirculos()
		pepita.volarEnCirculos()
		pepita.comerAlpiste(10)		
	}
}



