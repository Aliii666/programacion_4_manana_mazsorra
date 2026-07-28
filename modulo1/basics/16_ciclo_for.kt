fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo For")
    print("For con rango")
    for( i in 1..10){
        println(" 5 x $i  = ${5*i}")
    }
    
    println("For con until")
    for(i in 1 until 5){
        println(i)
    }
    
    println("For con pasos")
    for (i in 1..10 step 3){
        println(i)
    }
    
    println("For descendente")
    for( i in 10 downTo 1){
        println(i)
    }
    
    println("For con listas")
    val nombres = listOf("Juan", "Maria", "Jose")
    for(nombre in nombres){
        println(nombre)
    }
    
    println("For con listas invex valor")
    for((valor, index) in nombres.withIndex()){
        println("$index->$valor")
    }
    
    println("For con break")
    for ( i in 1..10){
        if(1==5){
            break;
        }
    }
    
    println("For con continue")
    for( i in 1..10){
        if(i==3){
            continue;
        }
        println("item: $i")
    }
    
    println("For con continue")
    for( i in 1..10){
     if(i==3) continue;
     if(i==7) break;
     println("item $i")
    }
    
    val pacientes = listOf(
    Triple("Garcia, M", 37.2, 98),
    Triple("Zambrano, L", 39.1, 94),
    Triple("Torres. R", 40.3, 91),
    )
    for ((posicion, paciente) in pacientes.withIndex()){
        val (nombre, temperatura, spo2) = paciente
        val alertaTemp = if(temperatura >= 38.0) "Fiebre" else "Normal"
        val alertaSpo2 = if(spo2 < 95.0) "Baja" else "Normal"
        println("Cama $posicion - $nombre - Temp: $temperatura Gdo.Cent. $alertaTemp - Spo2: $spo2 $alertaSpo2")
    }
}


