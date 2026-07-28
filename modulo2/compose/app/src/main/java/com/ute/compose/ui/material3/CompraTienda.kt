package com.ute.compose.ui.material3

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction

import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun Paso01TiendaScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text("Paso 1 · TextField y OutlinedTextField",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()
        SumaNumeros()
    }
}

// ── Demo 2: formulario con validación completa ───────────────────────────────
@Composable
private fun SumaNumeros() {
    var nombre     by remember { mutableStateOf("") }
    var cantidad      by remember { mutableStateOf("") }
    var precioUnitario      by remember { mutableStateOf("") }
    var subTotal      by remember { mutableStateOf("") }
    var descuento      by remember { mutableStateOf("") }
    var total      by remember { mutableStateOf("") }



    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text("compra de producto",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary)

        // numero1 — validación básica de longitud
        OutlinedTextField(
            value           = nombre,
            onValueChange   = { nombre = it },
            label           = { Text(" nombre") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )

        // numero1 — validación básica de longitud
        OutlinedTextField(
            value           = cantidad,
            onValueChange   = { cantidad = it },
            label           = { Text("cantidad ") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )

        // numero1 — validación básica de longitud
        OutlinedTextField(
            value           = precioUnitario,
            onValueChange   = { precioUnitario = it },
            label           = { Text("precioUnitario ") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )


        Button(
            onClick  = {
                val cantidadInt=cantidad.toIntOrNull()?:0
                val precioUnitarioDouble=precioUnitario.toDoubleOrNull()?:0.0
                val subTotalDouble = (cantidadInt * precioUnitarioDouble)
                var porcentaje = 0.0
                if(subTotalDouble > 50){
                    porcentaje= 0.1
                } else if (subTotalDouble >20 ){
                    porcentaje = 0.05
                }

                val totalDouble =  subTotalDouble - (subTotalDouble * porcentaje)


                subTotal= subTotalDouble.toString()
                descuento=porcentaje.toString()
                total = totalDouble.toString()


            },

            modifier = Modifier.fillMaxWidth()
        ) {

            Text(text="calcular")
        }

        Text(text="nombre del producto: $nombre")
        Text(text="subtotal  : $subTotal")
        Text(text=" descuento : $descuento")
        Text(text="total a pagar  : $total")
    }
}

@Preview(showBackground = true)
@Composable
fun Paso01TiendaPreview() {
    MaterialTheme { Paso01TiendaScreen()}
}