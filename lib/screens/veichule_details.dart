import 'package:flutter/material.dart';
import '../widgets/custom_input_decoration.dart';
import '../widgets/custom_button.dart';

class VeichuleDetails extends StatelessWidget {
  final Map<String, dynamic> veichule;

  const VeichuleDetails({super.key, required this.veichule});

  void _showEditDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: veichule['name']);
    final plateController = TextEditingController(text: veichule['plate']);
    final modelController = TextEditingController(text: veichule['model']);
    final yearController = TextEditingController(text: veichule['year']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Veículo'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: customInputDecoration('Nome', Icons.person),
                  validator: (value) =>
                      value!.isEmpty ? 'Informe o nome' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: plateController,
                  decoration:
                      customInputDecoration('Placa', Icons.directions_car),
                  validator: (value) =>
                      value!.isEmpty ? 'Informe a placa' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: modelController,
                  decoration: customInputDecoration('Modelo', Icons.build),
                  validator: (value) =>
                      value!.isEmpty ? 'Informe o modelo' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: yearController,
                  decoration:
                      customInputDecoration('Ano', Icons.calendar_today),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Informe o ano' : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Simulação de salvamento
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Veículo atualizado!')),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Veículo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  veichule['name'],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Placa: ${veichule['plate']}\n"
                  "Modelo: ${veichule['model']}\n"
                  "Ano: ${veichule['year']}",
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showEditDialog(context),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Adicionar Abastecimento",
              onPressed: () {
                Navigator.of(context).pushNamed('/fuelRegister');
              },
            ),
          ],
        ),
      ),
    );
  }
}
