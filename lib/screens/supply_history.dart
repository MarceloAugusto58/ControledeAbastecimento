import 'package:flutter/material.dart';

class SupplyHistory extends StatelessWidget {
  const SupplyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Abastecimento')),
      body: const Center(child: Text('Histórico vazio')),
    );
  }
}
