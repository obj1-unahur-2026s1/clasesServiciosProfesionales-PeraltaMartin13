import provincias.*
class Universidad {
   const provinciaUbicada 
   const honorariosPorHoraSugeridos
   var dineroDonaciones = 0 //etapa 3



   method getProvinciaUbicada() = provinciaUbicada
   method honorariosSugeridos() = honorariosPorHoraSugeridos

   // etapa 3
   method getDineroDonaciones() = dineroDonaciones 
   method recibirDonacionDe(unValor) {
     dineroDonaciones += unValor
   }
}

