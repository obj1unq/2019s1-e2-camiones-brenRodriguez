object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() =  1
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto() =  2
}

object paqueteLadrillos {
	var pesoLadrilloUnidad = 2
	var property cantidad = 2

	method peso() { return self.cantidad(cantidad) * pesoLadrilloUnidad }
	method nivelPeligrosidad() { return 2 }
	method bulto(){
		return (self.cantidad() / 100).roundUp() 
	}
}

object arenaAGranel {
	var property peso = 3
	method nivelPeligrosidad() { return 1 }
	method bulto() =  1
}

object bateriaAntiaerea {
	var estaConMisiles = false
	method peso() { return if (estaConMisiles) { 300} else { 200  } }
	method nivelPeligrosidad() { return if (estaConMisiles) { 100} else { 0  } }
	method bulto(){ return if (!estaConMisiles) { 1} else { 2 } }
}

object contenedorPortuario {
	var property cosasDelContenedor = []
	method peso() { return 100 + cosasDelContenedor.map({unaCosa => unaCosa.peso()}).sum() }
	method cosaMasPeligrosa(){
		return cosasDelContenedor.max({unaCosa => unaCosa.nivelPeligrosidad()})
	}
	method nivelPeligrosidad() { return if (cosasDelContenedor.isEmpty()) { 0 } else { self.cosaMasPeligrosa().nivelPeligrosidad()} }
	method bulto(){
		return 1 + cosasDelContenedor.map({unaCosa => unaCosa.bulto()}).sum()
	}
}

object residuosRadioactivos {
	var property peso = 0
	method nivelPeligrosidad() { return 200 }
	method bulto() =  1
}

object embalajeDeSeguridad {
	const property cobertura = []

	method peso() { return cobertura.head().peso() }
	method nivelPeligrosidad() {return cobertura.head().nivelPeligrosidad() }
	method bulto() =  2
}