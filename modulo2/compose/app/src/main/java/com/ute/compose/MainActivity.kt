// MainActivity.kt
package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.ute.compose.ui.material3.*

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // ◀ CAMBIA AQUÍ para probar cada paso:
                Paso01_TextFieldScreen()
                // Paso02_CardScreen()
                // Paso03_LazyColumnScreen()
                // Paso04_ScaffoldScreen()
                // Paso05_NavBarScreen()
                // Paso06_DialogosScreen()   // ← paso activo
            }
        }
    }
}