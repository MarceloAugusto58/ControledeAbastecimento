import 'package:flutter/material.dart';
import '../widgets/custom_input_decoration.dart';
import '../widgets/custom_button.dart';

class FuelRegister extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _literController = TextEditingController();
  final _mileageController = TextEditingController();
  final _dateController = TextEditingController();

  FuelRegister({super.key});

  void _saveFuelRecord(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Abastecimento registrado!")),
      );
      Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Abastecimento"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _literController,
                keyboardType: TextInputType.number,
                decoration: customInputDecoration(
                  "Litros Abastecidos",
                  Icons.local_gas_station,
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Informe os litros abastecidos' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _mileageController,
                keyboardType: TextInputType.number,
                decoration: customInputDecoration(
                  "Quilometragem Atual",
                  Icons.speed,
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Informe a quilometragem' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _dateController,
                decoration: customInputDecoration(
                  "Data",
                  Icons.calendar_today,
                ),
                validator: (value) => value!.isEmpty ? 'Informe a data' : null,
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    _dateController.text =
                        "${picked.day}/${picked.month}/${picked.year}";
                  }
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Salvar Abastecimento",
                onPressed: () => _saveFuelRecord(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
