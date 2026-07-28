
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
fun Paso01SumaScreen() {
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
    var numero1     by remember { mutableStateOf("") }
    var numero2      by remember { mutableStateOf("") }
    var resultado      by remember { mutableStateOf("") }

    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text("Formulario nuevo contacto",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary)

        // numero1 — validación básica de longitud
        OutlinedTextField(
            value           = numero1,
            onValueChange   = { numero1 = it },
            label           = { Text(" numero1") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )

        // numero1 — validación básica de longitud
        OutlinedTextField(
            value           = numero2,
            onValueChange   = { numero2 = it },
            label           = { Text("numero2 ") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )


        Button(
            onClick  = { val numero1Int=numero1.toIntOrNull()?:0
                         val numero2Int=numero2.toIntOrNull()?:0
                resultado = (numero1Int + numero2Int).toString()
                       },

            modifier = Modifier.fillMaxWidth()
        ) {
           Text(text="sumar")
        }

        Text(text=resultado)
    }
}

@Preview(showBackground = true)
@Composable
fun Paso01SumaPreview() {
    MaterialTheme { Paso01SumaScreen() }
}