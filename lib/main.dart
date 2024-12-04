import 'package:abastece_app_prova/screens/fuel_register.dart';
import 'package:abastece_app_prova/screens/home_page.dart';
import 'package:abastece_app_prova/screens/login_page.dart';
import 'package:abastece_app_prova/screens/my_veichules.dart';
import 'package:abastece_app_prova/screens/profile_page.dart';
import 'package:abastece_app_prova/screens/register_page.dart';
import 'package:abastece_app_prova/screens/supply_history.dart';
import 'package:abastece_app_prova/screens/veichule_details.dart';
import 'package:abastece_app_prova/screens/veichule_register.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const AbasteceProApp());
}

class AbasteceProApp extends StatelessWidget {
  const AbasteceProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AbastecePro',
      theme: ThemeData(
        primaryColor: const Color(0xFFB39DDB),
        brightness: Brightness.light,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/registerVeichule': (context) => const VehicleRegister(),
        '/myVeichules': (context) => const MyVehicles(),
        '/supplyHistory': (context) => const SupplyHistory(),
        '/profile': (context) => const ProfilePage(),
        '/fuelRegister': (context) => FuelRegister(),
        '/veichuleDetails': (context) {
          final userId = FirebaseAuth.instance.currentUser?.uid;
          final veichuleId =
              ModalRoute.of(context)?.settings.arguments as String;

          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .collection('veichules')
                .doc(veichuleId)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Erro ao carregar o veículo'));
              }
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return const Center(child: Text('Veículo não encontrado'));
              }

              final veichule = snapshot.data!.data() as Map<String, dynamic>;

              return VeichuleDetails(veichule: veichule);
            },
          );
        },
      },
    );
  }
}
