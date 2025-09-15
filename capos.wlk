object rolando {
    var tamañoMochila = 3
    var poderBase = 5
    const hogar = castilloDePiedras
    const historialDeArtefactosEncontrados = [] 
    const artefactosRecolectados = #{espadaDelDestino, collarDivino}
    var libroDeHechizos = []

    method poderBase(){
      return poderBase
    }

    method artefactosRecolectadosPorRolando() {
      return artefactosRecolectados
    }    

    method historialDeArtefactosEncontrados() {
      return historialDeArtefactosEncontrados
    }

    method recolectarArtefacto(artefacto){
        historialDeArtefactosEncontrados.add(artefacto) 
        if(tamañoMochila > artefactosRecolectados.size()){      
            artefactosRecolectados.add(artefacto)  
        }
    }

    method esconderArtefactosEnHogar() {
        hogar.esconderArtefactos(artefactosRecolectados)
        artefactosRecolectados.clear()
    }

    method llegarAHogar() { //siempre que llega a su hogar guarda todos los artefactos que tiene.
    self.esconderArtefactosEnHogar()
  }

    method buscarArtefacto(artefactoABuscar) {
      return self.poseciones().contains(artefactoABuscar)
    }

    method poseciones() {
     return artefactosRecolectados.union(hogar.artefactosRecolectados()) 
    }

    method tamañoMochila(_tamañoMochila){
        tamañoMochila = _tamañoMochila
    }

    method poderDePelea() {
        return poderBase 
            + artefactosRecolectados.sum({artefacto => artefacto.poderQueAportaA(self)})
    }

    method aumentarPoderBase() {
      poderBase += 1
      
    }

    method batallar() {
      self.aumentarPoderBase()
      artefactosRecolectados.forEach({artefacto => artefacto.pelearUnaBatalla()})
      
    }

  method artefactoMasPoderosoEnMorada(){
    return hogar.artefactoMasPoderoso(self)
  }

}
//---------------------HECHIZOS------------------------
object bendicion {
  method poderDePelea(personaje) {
    return 4  
  }

  
}
object invisibilidad {

  method poderDePelea(personaje) {
    return personaje.poderPelea()
  }

}

object invocacion {
  method poderDePelea(personaje) {
    return personaje.artefactoMasPoderosoEnMorada()
  }
  
}



//-------------CASTILLO------------------
object castilloDePiedras {

  const artefactosRecolectados = #{} 

  method artefactosRecolectados() {
    return artefactosRecolectados
  }

  method esconderArtefactos(artefactos) {
    artefactosRecolectados.addAll(artefactos)
    
  }

      method artefactoMasPoderoso(personaje){
      return self.artefactosRecolectados().max({ artefacto => artefacto.poderQueAportaA(personaje)})
    }
}
//espadaDelCastillo.usosEnBatalla()
//
//// ----------------------------ARTEFACTOS--------------------------------

object espadaDelDestino {
  const poder = 0
  var usosEnBatalla = 0

  method poder() {
    return poder
  }

  method pelearUnaBatalla() {
    usosEnBatalla += 1
  }
  method usosEnBatalla() {
    return usosEnBatalla
  }
  method poderQueAportaA(personaje) {
    if (usosEnBatalla == 0){
            return personaje.poderBase() 
        } else {
            return personaje.poderBase() / 2     
    }
  }

}


object collarDivino {
  var poder = 3 
  var usosEnBatalla = 0

  method poder() {
    return poder
  }

  method usosEnBatalla() {
    return usosEnBatalla
  }

  method pelearUnaBatalla() {
    usosEnBatalla += 1
  
  }

  method poderQueAportaA(personaje) {
    if (personaje. poderBase() > 6){
            return poder + usosEnBatalla
        } else {
            return poder     
    }
  }



}

object armaduraDeAcero {
  const poder = 6
  method pelearUnaBatalla(){}

  method poderQueAportaA(personaje) {// PENDIENTE
  return poder
  }




}


object libroDeHechizos {
  const poder = 20 

  method pelearUnaBatalla(){}

  method poderQueAportaA(personaje) { // PENDIENTE
  return poder
  }

}


