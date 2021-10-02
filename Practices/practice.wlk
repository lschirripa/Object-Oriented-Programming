object pepita {

	var energia = 100

	method energia() {
		return energia
	} // getter

	method energia(_energia) {
		energia = _energia
	} // setter  

	method volar() {
		energia = energia - 10
	}

	method comer(cantidad) {
		energia = energia + (2 * cantidad)
	}

}

object juan {

	var mascota

	method mascota(_mascota) {
		mascota = _mascota
	}

}

object firulais {

	var duenio

	method duenio(_duenio) {
		duenio = _duenio
	}

}

object pianoFamiliar {
var nivelDeAfinacion = 100
var porcentajeValidoAfinacion = 80*100/(nivelDeAfinacion) 

method nivelDeAfinacion() {
return nivelDeAfinacion
}

method bajarAfinacion() { 
nivelDeAfinacion = nivelDeAfinacion - 1
}

method estaAfinado() {
return (nivelDeAfinacion > porcentajeValidoAfinacion)
}

method subirAfinacion() {
nivelDeAfinacion = nivelDeAfinacion + 5
}

}

object jazmin {
method tocar() {
pianoFamiliar.bajarAfinacion()
}
}

object lucio {
method afinar() {
pianoFamiliar.subirAfinacion()
}
}

