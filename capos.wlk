object rolando {
    var tamañoMochila = 2
    const depositoCastillo = castilloDePiedras

    method tamañoMochila(_tamañoMochila){
        tamañoMochila = _tamañoMochila
    }

    const artefactosRecolectados = #{espadadeldestino,librodehechizos}
    
    method recolectarArtefacto(artefacto){
        if(tamañoMochila > artefactosRecolectados.size()){      
            artefactosRecolectados.add(artefacto)  
        }
    }

    method artefactosRecolectadosPorRolando() {
      return artefactosRecolectados
    }


    method almacenarArtefactosEnCastillo() {
        depositoCastillo.artefactosRecolectados().addAll(artefactosRecolectados)
        artefactosRecolectados.clear()
    }

    method artefactosRecolectadosEnCastillo() {
      return depositoCastillo
    }

    method llegarACastillo() {
      self.almacenarArtefactosEnCastillo()
    }


}

object castilloDePiedras {

  const artefactosRecolectados = #{} 

  method artefactosRecolectados() {
    return artefactosRecolectados
  }
}




object espadadeldestino {
  
}

object librodehechizos {
  
}

object collarDivino {
  
}
object armaduradeacero {
  
}
