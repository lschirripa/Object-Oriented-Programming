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

// TOM Y JERRY 
 
object tom{
   var posicionActual = 0
   var energia = 80
   
   method velocidad(){
   return 5+energia/10
   }
   
   method correrA(raton){
   energia = energia - (tom.velocidad()/2*(tom.distancia(raton)))
   posicionActual = raton.posicionActual()
   }
   method esMasVeloz(raton){
   return tom.velocidad() > raton.velocidad()
   }
   method distancia(raton){
   return (posicionActual - raton.posicionActual()).abs()
   }
}

object jerry {
   var posicionActual = 10
   var peso = 3
  
   method posicionActual(){
   return posicionActual
   }
   
   method velocidad(){
   return 10 - peso
   }
}

object robotRaton{
    var posicionActual = 12
    
   method posicionActual(){
   return posicionActual
   }

   method velocidad(){
   return 8
   }
}

// SUSTANCIAS

object logan{
  var rendimiento
  const peso = 70
  
  method fuerza(){
  return rendimiento*5*peso
  }
  
  method rendimiento(){
  return rendimiento
  }
  method consumir(cantidad, sustancia){
  rendimiento = sustancia.consumo(cantidad)
  }
  
  
}

object clo2{

  method consumo(cantidad){
  return 0.9**cantidad
  }
  
}

object terere{
  method consumo(cantidad){
  return (0.1*(cantidad)).max(1)
  }
}

object cianuro{
   method consumo(cantidad){
   return cantidad*0
   }
}

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
		nivelDeSangre = nivelDeSangre + 1 + (horas*0)
	}

	method esViolento() {
		return nivelDeSangre > 5
	}

}



