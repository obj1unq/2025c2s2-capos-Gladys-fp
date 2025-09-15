object rolando {
    var tamañoMochila = 2
    const hogar = castilloDePiedras
    const historialDeArtefactosEncontrados = [] 

    method historialDeArtefactosEncontrados() {
      return historialDeArtefactosEncontrados
    }

    method tamañoMochila(_tamañoMochila){
        tamañoMochila = _tamañoMochila
    }

    const artefactosRecolectados = #{}
    
    method recolectarArtefacto(artefacto){
        historialDeArtefactosEncontrados.add(artefacto) 
        if(tamañoMochila > artefactosRecolectados.size()){      
            artefactosRecolectados.add(artefacto)  
        }
    }

    method artefactosRecolectadosPorRolando() {
      return artefactosRecolectados
    }


    method almacenarArtefactosEnHogar() {
        hogar.artefactosRecolectados().addAll(artefactosRecolectados)
        artefactosRecolectados.clear()
    }

    method artefactosRecolectadosEnHogar() {
      return hogar
    }

 


    method cantidadTotalDeArtefactosRecolectados() {
     return self.artefactosRecolectadosPorRolando() + hogar.artefactosRecolectados()
    }

    
    method buscarArtefacto(artefactoABuscar) {
      return self.cantidadTotalDeArtefactosRecolectados().contains(artefactoABuscar)
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
