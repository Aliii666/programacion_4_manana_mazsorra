fun main() {
    println("Comparación de costos en el taller mecánico")
    
    val costoRevision = 15
    val costoAceite = 10
    
    println("¿El costo de revisión es igual al de aceite? $costoRevision == $costoAceite = ${costoRevision == costoAceite}")
    println("¿El costo de revisión es igual al de aceite? $costoRevision .equals $costoAceite = ${costoRevision.equals(costoAceite)}")
    println("¿El costo de revisión es diferente al de aceite? $costoRevision != $costoAceite = ${costoRevision != costoAceite}")
    println("¿La revisión es más cara que el aceite? $costoRevision > $costoAceite = ${costoRevision > costoAceite}")
    println("¿La revisión es más cara o igual al aceite? $costoRevision >= $costoAceite = ${costoRevision >= costoAceite}")
    println("¿La revisión es más barata que el aceite? $costoRevision < $costoAceite = ${costoRevision < costoAceite}")
    println("¿La revisión es más barata o igual al aceite? $costoRevision <= $costoAceite = ${costoRevision <= costoAceite}")
}