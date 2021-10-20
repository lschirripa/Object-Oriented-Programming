object spa {

	method atender(persona) {
		persona.recibirMasajes()
		persona.darseUnBanioDeVapor()
	}

}

object olivia {

	var property gradoDeConcentracion = 4
	var property cantMasajes = 0

	method recibirMasajes() {
		if (cantMasajes >= 2) {
			gradoDeConcentracion += 3
		}
		gradoDeConcentracion += 2
		cantMasajes += 1
	}

	method darseUnBanioDeVapor() {
		gradoDeConcentracion += 1
	}

	method esFeliz() {
		return self.gradoDeConcentracion() >= 7
	}

	method discutir() {
		gradoDeConcentracion = 5.min(self.gradoDeConcentracion())
	}

}

