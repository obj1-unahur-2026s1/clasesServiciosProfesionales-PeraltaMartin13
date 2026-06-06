import universidad.*
import profesionales.*
class Empresa{
    const honorarioReferencia
    const empleados = #{}
    const clientes = #{} // etapa 4

    method getHonorarioReferencia() = honorarioReferencia

    method cuantosEmpleadosEstudiaronEn(unaUniversidad) {
       return empleados.count({e => e.estudioEn() == unaUniversidad})
    }

    method contratarEmpleado(unEmpleado) {
      empleados.add(unEmpleado)
    }

    method conjuntoProfesionalesCaros() {
        return empleados.filter({e => e.honorarios() > honorarioReferencia})
    }

    method universidadesQueFormaronAEmpleados() {
        return empleados.map({e => e.estudioEn()}).asSet()
    }

    method profesionalMasBarato() {
        return empleados.min({e => e.honorarios()})
    }

    method esDeGenteAcotada() {
        return empleados.all({e => e.provinciasHabilitadas().size() <= 3})
    }

//Etapa2
    method puedeSatisfacerA(unSolicitante) = empleados.any({e => unSolicitante.puedeSerAtendidaPor(e)})
//etapa 4
    method darServicioA(unSolicitante) {
      if (self.puedeSatisfacerA(unSolicitante)){
        const empleadoATrabajar = empleados.find({e => unSolicitante.puedeSerAtendidaPor(e)})
        empleadoATrabajar.consecuenciaDeCobro(empleadoATrabajar.honorarios())
        clientes.add(unSolicitante)
      }
    }

    method cantidadClientes() = clientes.size()
    method esCliente(unSolicitante) = clientes.contains(unSolicitante)

// desafio final
    method profesionalPocoAtractivo(unProfesional) {
        return unProfesional.provinciasHabilitadas().all({r => empleados.any({
            e => e.provinciasHabilitadas().contains(r)
            and 
            e.honorarios() < unProfesional.honorarios()
            and
            e != unProfesional
            })})
    }

}