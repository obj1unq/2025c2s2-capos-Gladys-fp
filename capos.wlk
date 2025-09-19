
object rolando {
  var tamañoMochila = 2
  const  hogar = castilloDePiedras
  var property poderBase = 5
  const property historialDeArtefactosEncontrados = [] 
  const property artefactosRecolectados = #{}

  method tamañoMochila(_tamañoMochila){
    tamañoMochila = _tamañoMochila
  }

  method recolectarArtefacto(artefacto){
    historialDeArtefactosEncontrados.add(artefacto) 
    if( artefactosRecolectados.size() >= tamañoMochila){      
         self.error("supera el maximo de artefactos en la mochila")
    }else {
      artefactosRecolectados.add(artefacto) 
    }
  }

  method esconderArtefactosEnhogar() {
    hogar.esconderArtefactos(artefactosRecolectados)
    artefactosRecolectados.clear()
  }

  method llegarAHogar() { 
    self.esconderArtefactosEnhogar()
  }

  method tieneEsteArtefacto(artefacto) {
    return self.poseciones().contains(artefacto)
  }

  method poseciones() {
    return artefactosRecolectados.union(hogar.artefactosRecolectados()) 
  }

  method aumentarPoderBase() {
    poderBase += 1  
  }

  method batallar() {
    self.aumentarPoderBase()
    artefactosRecolectados.forEach({artefacto => artefacto.aunmentarUsoEnBatalla()})
  }

  method poderDePelea() {
    return poderBase+ artefactosRecolectados.sum({artefacto => artefacto.poderQueAportaA(self)})
  }

  method artefactoMasPoderosoEnMorada(){
    return hogar.poderDelArtefactoMasPoderoso(self)
  }

  method puedeVencerA(enemigo) {
    return self.poderDePelea() > enemigo.poderDePelea()
  }

  method personajesQuePuedeVencerEn(tierra) {
    return tierra.habitantesEnLaTierra().filter({ enemigo => self.puedeVencerA(enemigo) })
  }

  method reinosAConquistarEn(tierra) {
    return self.personajesQuePuedeVencerEn(tierra).map({ enemigo => enemigo.hogar()})           
  }
  
  method esPoderosoEn (tierra){
    return tierra.habitantesEnLaTierra().all({enemigo => self.puedeVencerA(enemigo)})
  }

  method esFatalContra(artefacto, enemigo) {
    return artefacto.poderQueAportaA(self) > enemigo.poderDePelea()
  } 

  method artefactoFatalPara(enemigo) {
    return artefactosRecolectados.findOrElse(
      { artefacto => self.esFatalContra(artefacto, enemigo) }, { => null }
    )
  }

}


//---------------------MORADAS------------------------
object castilloDePiedras {
  const artefactosRecolectados = #{} 

  method artefactosRecolectados() {
    return artefactosRecolectados
  }

  method esconderArtefactos(artefactos) {
    artefactosRecolectados.addAll(artefactos)
  }

  method poderDelArtefactoMasPoderoso(personaje){
    return self.artefactosRecolectados()
      .max({ artefacto => artefacto.poderQueAportaA(personaje)})
      .poderQueAportaA(personaje)
    }
}

object fortalezaDeAcero {}

object palacioDeMarmol {}

object torreDeMarfil {}


//// ----------------------------ARTEFACTOS--------------------------------

//ESPADA DEL DESTINO
object espadaDelDestino {
  const property poderDePelea = 0
  var property usosEnBatalla = 0


  method aunmentarUsoEnBatalla() {
    usosEnBatalla += 1
  }

  method poderQueAportaA(personaje) {
    if (usosEnBatalla == 0){
        return personaje.poderBase() 
      } else {
        return personaje.poderBase() / 2     
    }
  }
}

//------COLLAR DIVINO
object collarDivino {
  const property poderDePelea = 3 
  var property usosEnBatalla = 0

  method aunmentarUsoEnBatalla() {
    usosEnBatalla += 1
  }

  method poderQueAportaA(personaje) {
    if (personaje. poderBase() > 6){
        return poderDePelea + usosEnBatalla
      } else {
        return poderDePelea     
    }
  }
}


// ARMADURA DE ACERO 
object armaduraDeAcero {
  const property poderDePelea = 6

  method aunmentarUsoEnBatalla(){}

  method poderQueAportaA(personaje) {// PENDIENTE
  return poderDePelea
  }
}


// LIBRO DE HECHIZOS
object libroDeHechizos {
  var hechizos = [bendicion, invisibilidad, invocacion]
  method aunmentarUsoEnBatalla(){}

  method hechizos() {
    return hechizos
  }

  method poderQueAportaA(personaje) { 
    if (hechizos.isEmpty()) {
      return 0
    }
    var primerHechizo = hechizos.first()
    hechizos = hechizos.drop(1) 
    return primerHechizo.poderDePelea(personaje)
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
    return personaje.poderBase()
  }
}


object invocacion {
  method poderDePelea(personaje) {
    return personaje.artefactoMasPoderosoEnMorada()
  }
}
//------------------------- TIERRA DE ARETHIA --------------------------

object erethia {
  var property  habitantes = #{caterina, astra, archibaldo}

  method habitantesEnLaTierra() {
    return habitantes
  }


}

//------------------------------ENEMIGOS--------------------------------

object caterina {
  const poderDePelea = 28
  var property hogar = fortalezaDeAcero

  method poderDePelea() {
    return poderDePelea 
  }  
}


object archibaldo {
  const poderDePelea = 16
  var property hogar = palacioDeMarmol

  method poderDePelea() {
    return poderDePelea 
  }  
}


object astra {
  const poderDePelea = 14
  var property hogar = torreDeMarfil

  method poderDePelea() {
    return poderDePelea 
  } 
}
