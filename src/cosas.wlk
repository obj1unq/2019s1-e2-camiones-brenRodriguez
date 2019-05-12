object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() =  1
	method reaccionar(){}
}

object bumblebee {
	var property transformadoEnAuto = true
	
	method peso() = 800 
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto() =  2
	method reaccionar(){
		transformadoEnAuto = false
	}
}

object paqueteLadrillos {
	var pesoLadrilloUnidad = 2
	var property cantidad = 2

	method peso() { return self.cantidad() * pesoLadrilloUnidad }
	method nivelPeligrosidad() { return 2 }
	method bulto(){
		return (self.cantidad() / 100).roundUp() 
	}
	method reaccionar(){
		self.cantidad(12)
	}
}

object arenaAGranel {
	var property peso = 10
	method nivelPeligrosidad() { return 1 }
	method bulto() =  1
	method reaccionar(){
		self.peso(20)
	}
}

object bateriaAntiaerea {
	var estaConMisiles = false
	method peso() { return if (estaConMisiles) { 300} else { 200  } }
	method nivelPeligrosidad() { return if (estaConMisiles) { 100} else { 0  } }
	method bulto(){ return if (!estaConMisiles) { 1} else { 2 } }
	method reaccionar(){
		estaConMisiles = true
	}
}

object contenedorPortuario {
	var property cosasDelContenedor = [bumblebee, arenaAGranel]
	method peso() { return 100 + cosasDelContenedor.map({unaCosa => unaCosa.peso()}).sum() }
	method cosaMasPeligrosa(){
		return cosasDelContenedor.max({unaCosa => unaCosa.nivelPeligrosidad()})
	}
	method nivelPeligrosidad() { return if (cosasDelContenedor.isEmpty()) { 0 } else { self.cosaMasPeligrosa().nivelPeligrosidad()} }
	method bulto(){
		return 1 + cosasDelContenedor.map({unaCosa => unaCosa.bulto()}).sum()
	}
	method reaccionar(){
		return cosasDelContenedor.forEach({unaCosa => unaCosa.reaccionar()})
	}
}

object residuosRadioactivos {
	var property peso = 4
	method nivelPeligrosidad() { return 200 }
	method bulto() =  1
	method reaccionar(){
		self.peso(15)
	}
}

object embalajeDeSeguridad {
	var property cobertura = bateriaAntiaerea
	//var propert cobertura = [bateriaAntiaerea]
	//method peso() { return cobertura.head().peso() }
	method peso() { return cobertura.peso() }
	//method nivelPeligrosidad() {return cobertura.head().nivelPeligrosidad() }
	method nivelPeligrosidad() {return cobertura.nivelPeligrosidad() }
	method bulto() =  2
	method reaccionar(){}
}