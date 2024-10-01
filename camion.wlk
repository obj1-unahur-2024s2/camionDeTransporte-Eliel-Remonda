object camion {
    // Se pide que se le pueda cargar y descargar cosas (de 1 a vez) 
    // y también cual es el peso total del camión, incluyendo su tara que es de 1000 kg.
    const carga = []
    method cargar(unaCosa){
        carga.add(unaCosa)
    }
    method descargar(unaCosa){
        carga.remove(unaCosa)
    }
    method pesoTotal(){
        return 1000 + carga.sum({cosas => cosas.peso()})
    }
// También se necesita conocer si los pesos de todas las 
// cosas cargadas en el camión son números impares.
    method pesoCargaEsImpar(){
        return carga.all({cosas => cosas.peso()}).odd()
    }
// Debemos poder consultar si hay alguna 
// cosa que pesa un determinado valor.
    method cosaConPeso(unPeso){
        return carga.any({cosas => cosas.peso()})
    }
// Para un mejor control del tipo de peligro que puede representar la carga, 
// se debe poder obtener la primer cosa cargada que tenga un determinado nivel de peligrosidad
    method cargaConNivelDePeligrosidad(nivelPeligrosidad){
        return carga.find({carga => carga.peligrosidad() == nivelPeligrosidad})
    }
// Obtener todas las cosas que superan un determinado nivel de peligrosidad.
    method cosasConNivelDePeligrosidadSuperiorA(nivelPeligrosidad){
        return carga.filter({carga => carga.peligrosidad() > nivelPeligrosidad})
    }
// Para facilitar los controles, también nos piden que se pueda consultar la 
// lista de cosas que superan el nivel de peligrosidad de una cosa dada.
    method cosasConNivelSuperiorA(unaCosa){
        return carga.filter({carga => carga.peligrosidad() > unaCosa.peligrosidad()})
    }
// Conocer si el camión está excedido del peso máximo permitido,que es de 2500 kg.
    method camionExcedidoPeso(){
        return self.pesoTotal() > 2500
    }
// Saber si el camión puede circular en ruta. Eso depende de que no exceda el peso 
// máximo permitido y ninguno de los objetos cargados supere un nivel máximo de peligrosidad 
// que depende del viaje, por eso para este caso el valor del nivel se pasará como argumento.
    method puedeCircularEnRutaConPeligrosidad(unValor){
        return not self.camionExcedidoPeso() and self.hayCosasConPeligrosidadMenorA(unValor)
    }
    method hayCosasConPeligrosidadMenorA(unValor){
        return carga.all({carga => carga.peligrosidad() < unValor})
    }
// Se pide además, que se le pueda consultar al camión si tiene alguna cosa que pesa entre un valor mínimo
    method cosaQuePenseEntre(min, max){
        return carga.any({carga => carga.peso().between(min, max)})
    }
// Se pide que se pueda consultar la cosa más pesada que tiene cargada.
    method cosaMasPesada(){
        carga.max({carga => carga.peso()})
    }
// la información sobre la cantidad total de bultos que el camión tiene cargados
    method cantidadDeBueltosCargados(){
        return carga.sum({cosas => cosas.bultos()})
    }



}
















