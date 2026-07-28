import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario Taller MP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const FormularioTallerScreen(),
    );
  }
}

class FormularioTallerScreen extends StatefulWidget {
  const FormularioTallerScreen({super.key});

  @override
  State<FormularioTallerScreen> createState() => _FormularioTallerScreenState();
}

class _FormularioTallerScreenState extends State<FormularioTallerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _clienteController = TextEditingController();
  final _vehiculoController = TextEditingController();
  final _costoController = TextEditingController();
  String _tipoServicio = 'Mantenimiento';

  @override
  void dispose() {
    _clienteController.dispose();
    _vehiculoController.dispose();
    _costoController.dispose();
    super.dispose();
  }

  void _guardarOrden() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Orden guardada: ${_clienteController.text} - ${_vehiculoController.text} - $_tipoServicio - \$${_costoController.text}',
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro Orden de Servicio MP'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Datos de Ingreso Taller MP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _clienteController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del Cliente',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese el nombre del cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _vehiculoController,
                decoration: const InputDecoration(
                  labelText: 'Vehiculo (Marca y Modelo)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.directions_car),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese los datos del vehiculo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _tipoServicio,
                decoration: const InputDecoration(
                  labelText: 'Tipo de Servicio',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.build),
                ),
                items: const [
                  DropdownMenuItem(value: 'Mantenimiento', child: Text('Mantenimiento General')),
                  DropdownMenuItem(value: 'Frenos', child: Text('Reparacion de Frenos')),
                  DropdownMenuItem(value: 'Motor', child: Text('Diagnostico de Motor')),
                  DropdownMenuItem(value: 'Alineacion', child: Text('Alineacion y Balanceo')),
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() => _tipoServicio = val);
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _costoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Costo Estimado (\$)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese el costo estimado';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingrese un monto valido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _guardarOrden,
                  icon: const Icon(Icons.save),
                  label: const Text('Registrar Orden MP', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
