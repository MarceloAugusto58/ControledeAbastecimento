import 'package:flutter/material.dart';

class VehicleRegister extends StatelessWidget {
  const VehicleRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Veículo')),
      body: const Center(child: Text('Registro de Veículo')),
    );
  }
}
