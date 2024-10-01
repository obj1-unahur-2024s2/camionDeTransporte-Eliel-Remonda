object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bulto() = 1
    method consecuencias(){}
}

object bumblebee {
    var estado = auto
    method peso() = 800
    method peligrosidad() = estado.peligrosidad()
    method transformar(unEstado){ //Falto poner transformar
        estado = unEstado
    }
    method bulto() = 2
    method consecuencias(){
        estado = robot
    }
}
object auto{
    method peligrosidad() = 15
}

object robot {
    method peligrosidad() = 30
}

object paqueteLadrillos {
    var property peso = 0
    var property cantidad = 0 //Falto poner property
    method peligrosidad() = 2
    method peso() = 2 * cantidad 
    method bulto(){
        if (cantidad.between(1, 100)){
            return 1
        }else if (cantidad.between(101, 300)){
            return 2
        }else{
            return 3
        } 
    }
    method consecuencias(){
        cantidad += 12
    }
}

object arena {
    var peso = 0 
    method peligrosidad() = 1
    method bulto() = 1
    method consecuencias(){
        peso -= 0.max(peso - 10) // falto poner el max
    }
}

object bateriaAntiaerea{
    var property estaCargada = false
    method peso() = if (estaCargada) 300 else 200
    method peligrosidad() = if (estaCargada) 100 else 0
    method cargarBateriaAntiaerea(){
        estaCargada = true
    }
    method descargarBateriaAntiaerea(){
        estaCargada = false
    }
    method bulto(){
        if (estaCargada) 2 else 1
    }
    method consecuencias(){
        self.cargarBateriaAntiaerea()
    }
}

object contenedor {
    const cosas = []
    method peso() = 100 + self.pesoDeCosas()

    method pesoDeCosas(){
        return cosas.sum({cosas => cosas.peso()})
    }
    method peligrosidad(){
        if (cosas.isEmpty()){
            return 0
        } else{
            cosas.max({cosas => cosas.peligrosidad()})
        }
    }
    method bulto(){
        return 1 + cosas.sum({cosas => cosas.bulto()}) // habia que poner sum, yo habia pueso size()
    }
    method consecuencias(){
        cosas.forEach({cosas => cosas.consecuencias()})
    }
}

object residuosRadioactivos {
    var peso = 0
    method peligrosidad() = 200
    method bulto() = 1
    method consecuencias(){
        peso += 15
    }
}

object embalajeSeguridad {
    var property cosaEnvuelta = arena // se pone de ejemplo arena, puede ser cualqueir cosa
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2
    method bulto() = 2
    method consecuencias(){}
}