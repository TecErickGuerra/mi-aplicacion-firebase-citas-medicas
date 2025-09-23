import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/appointment_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Citas Médicas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// HomePage sirve como pantalla inicial
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // para simplificarlo, usemos datos de ejemplo
    const exampleUserId = 'user123';
    const exampleAppointmentId = 'appointment456';

    return Scaffold(
      appBar: AppBar(title: const Text('Inicio - Citas Médicas')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AppointmentDetailPage(
                  userId: exampleUserId,
                  appointmentId: exampleAppointmentId,
                ),
              ),
            );
          },
          child: const Text('Ir a Detalles de Cita'),
        ),
      ),
    );
  }
}