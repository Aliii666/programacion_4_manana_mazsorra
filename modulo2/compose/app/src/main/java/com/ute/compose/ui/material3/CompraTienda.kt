
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
fun CompraTiendaScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text("Calculo de Subtotal",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()
        SumaNumeros()
    }
}

// ── Demo 2: formulario con validación completa ───────────────────────────────
@Composable
private fun SumaNumeros() {
    var nombre     by remember { mutableStateOf("") }
    var numero1     by remember { mutableStateOf("") }
    var numero2      by remember { mutableStateOf("") }
    var resultadoF      by remember { mutableStateOf("") }
    var descuentoF      by remember { mutableStateOf("") }
    var totalAPagarF      by remember { mutableStateOf("") }

    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text("Compra de productos",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary)
        OutlinedTextField(
            value           = nombre,
            onValueChange   = { nombre = it },
            label           = { Text("Nombre del Producto") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )

        // numero1 — validación básica de longitud
        OutlinedTextField(
            value           = numero1,
            onValueChange   = { numero1 = it },
            label           = { Text("Cantidad") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )

        // numero1 — validación básica de longitud
        OutlinedTextField(
            value           = numero2,
            onValueChange   = { numero2 = it },
            label           = { Text("Precio ") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )


        Button(
            onClick  = { val numero1Int=numero1.toIntOrNull()?:0
                         val numero2Int=numero2.toDoubleOrNull()?:0.0
                 val resultado = (numero1Int * numero2Int)
                var porcentaje = 0.0;
                if (resultado>50){
                    porcentaje = 0.1
                } else if(resultado>20){
                    porcentaje = 0.5
                }

                var descuento = resultado - (resultado*porcentaje)
                var totalAPagar = resultado - descuento

                resultadoF = resultado.toString()
                descuentoF = descuento.toString()
                totalAPagarF = totalAPagar.toString()
                       },

            modifier = Modifier.fillMaxWidth()
        ) {
           Text(text="Calcular")
        }
        Text(text="Nombre del Producto : $nombre")
        Text(text="Subtotal a Pagar : $resultadoF")
        Text(text="Descuento : $descuentoF")
        Text(text="Total a Pagar : $totalAPagarF")

    }
}

@Preview(showBackground = true)
@Composable
fun CompraTiendaPreview() {
    MaterialTheme { CompraTiendaScreen() }
}