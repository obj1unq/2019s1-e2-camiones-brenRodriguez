import cosas.*

object camion {
	const property cosas = []
	var property carga = 500
	
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	
	method pesoTotal(){
		return 1000 + cosas.sum({unaCosa => unaCosa.peso()})
	}

	method excedidoDePeso(){
		return self.pesoTotal() > 25000
	}
	method objetosPeligrosos(nivel){
		return cosas.filter({ unaCosa => unaCosa.nivelPeligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.all({unaCosa => unaCosa.nivelPeligrosidad() < nivelMaximoPeligrosidad })
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({ unaCosa  => unaCosa.peso().between(min, max)})
	}
	method cosaMasPesada(){
		return cosas.max({unaCosa => unaCosa.peso()})
	}
	
	method totalBultos(){
		return cosas.map({unaCosa => unaCosa.bulto()}).sum()
	}
	
	method pesos(){
		return cosas.map({unaCosa => unaCosa.peso()})
	}
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.reaccionar()
	}
}
