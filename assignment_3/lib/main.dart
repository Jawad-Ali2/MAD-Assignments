import 'package:flutter/material.dart';
import 'screens/registration_screen.dart';
import 'screens/location_notes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remember the Location',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/register',
      routes: {
        '/register': (context) => const RegistrationScreen(),
        '/notes': (context) => const LocationNotesScreen(),
      },
    );
  }
}
