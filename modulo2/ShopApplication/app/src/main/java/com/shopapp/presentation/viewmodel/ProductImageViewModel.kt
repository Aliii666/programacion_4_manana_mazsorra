package com.shopapp.presentation.viewmodel

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.shopapp.domain.repository.ProductRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ProductImageViewModel @Inject constructor(
    private val repository: ProductRepository
) : ViewModel() {

    private val _isUploading = MutableStateFlow(false)
    val isUploading: StateFlow<Boolean> = _isUploading.asStateFlow()

    private val _uploadResult = MutableStateFlow<Result<Unit>?>(null)
    val uploadResult: StateFlow<Result<Unit>?> = _uploadResult.asStateFlow()

    fun uploadImage(productId: Int, uri: Uri) {
        if (_isUploading.value) return
        _isUploading.update { true }
        _uploadResult.update { null }

        viewModelScope.launch {
            repository.uploadProductImage(productId, uri)
                .onSuccess {
                    _isUploading.update { false }
                    _uploadResult.update { Result.success(Unit) }
                }
                .onFailure { e ->
                    _isUploading.update { false }
                    _uploadResult.update { Result.failure(e) }
                }
        }
    }

    fun clearResult() {
        _uploadResult.update { null }
    }
}
