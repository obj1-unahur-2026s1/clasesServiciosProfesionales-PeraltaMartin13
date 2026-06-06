import universidad.*
import provincias.*

class ProfesionalVinculado {
    const estudioEn

    method estudioEn() = estudioEn
    method honorarios() = estudioEn.honorariosSugeridos() 
    method provinciasHabilitadas() = #{estudioEn.getProvinciaUbicada()}

    // etapa 3
    method consecuenciaDeCobro(unValor) {
    estudioEn.recibirDonacionDe(unValor / 2)
    }

  }
class ProfesionalAsociado { 
    const estudioEn

    method estudioEn() = estudioEn
    method honorarios() = 3000
    method provinciasHabilitadas() = #{entreRios, santaFe, corrientes}
    // etapa 3
    method consecuenciaDeCobro(unValor) {
    asociacionProfesionalesDeLitoral.recibirDinero(unValor)
    }
      
 }
class ProfesionalLibre { 
    const estudioEn
    const susHonorarios
    const susProvinciasHabilitadas
    var dineroAcumulado = 0 //etapa 3

    method estudioEn() = estudioEn
    method honorarios() = susHonorarios 
    method provinciasHabilitadas() = susProvinciasHabilitadas 

    method agregarProvincia(unaProvicia) {
    susProvinciasHabilitadas.add(unaProvicia)}
    // etapa 3
    method getDineroAcumulado() = dineroAcumulado
    method consecuenciaDeCobro(unValor) {
    dineroAcumulado += unValor
    }

    method pasarDinero(unProfesional, monto) {
      dineroAcumulado = (dineroAcumulado - monto).max(0)
      unProfesional.consecuenciaDeCobro(monto)
    }
 }

object asociacionProfesionalesDeLitoral {
  var dineroAcumuladoDeProfesionales = 0

  method getDineroAcumulado() = dineroAcumuladoDeProfesionales 

  method recibirDinero(unValor) {
    dineroAcumuladoDeProfesionales += unValor
  }
}
