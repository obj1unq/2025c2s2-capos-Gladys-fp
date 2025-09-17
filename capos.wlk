object rolando {
    var tamañoMochila = 2
    var poderBase = 5
    const hogar = castilloDePiedras
    const historialDeArtefactosEncontrados = [] 
    const artefactosRecolectados = #{}

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
            + artefactosRecolectados.sum({artefactosRecolectados => artefactosRecolectados.poder()})
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
}

//// ----------------------------ARTEFACTOS--------------------------------

object espadaDelDestino {
  const poder = 20 

  method poder() {
    return poder
  }
}



object libroDeHechizos {
  const poder = 20 

  method poder() {
    return poder
  }
}




object collarDivino {
  var poder = 3 
  var usosEnBatalla = 0

  method usosEnBatallaPor(personaja) {
    usosEnBatalla += 1
  }

  method poderQueAportaA(personaje) {
    if (personaje. poderBase() > 6){
            return poder + usosEnBatalla
        } else {
            return poder     
    }
  }

  method poder() {
    return poder
  }

}



object armaduraDeAcero {
  const poder = 20 

  method poder() {
    return poder
  }
}
