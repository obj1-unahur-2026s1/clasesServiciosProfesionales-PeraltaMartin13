import profesionales.*
import provincias.*
import universidad.*

class Persona {
  const provinciaDeResidencia
  method puedeSerAtendidaPor(unProfesional) = unProfesional.provinciasHabilitadas().any({e => e == provinciaDeResidencia})
}

class Institucion {
  const universidadesReconocidas
  method puedeSerAtendidaPor(unProfesional) = universidadesReconocidas.any({e => e == unProfesional.estudioEn()})  
}

class Club {
  const ubicacionDeSedes
  method puedeSerAtendidaPor(unProfesional) = unProfesional.provinciasHabilitadas().any({e => ubicacionDeSedes.contains(e)}) 
}