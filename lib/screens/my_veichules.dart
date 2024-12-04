import 'package:flutter/material.dart';

class MyVehicles extends StatelessWidget {
  const MyVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Veículos')),
      body: const Center(child: Text('Lista de Veículos')),
    );
  }
}
