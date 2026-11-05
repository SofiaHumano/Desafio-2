import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.purple,
        useMaterial3: true,
      ),
      home: const TarjetaScreen(),
    );
  }
}

// StatefulWidget porque el Switch necesita "recordar" si está
// encendido o apagado, y la pantalla tiene que redibujarse al cambiar.
class TarjetaScreen extends StatefulWidget {
  const TarjetaScreen({super.key});

  @override
  State<TarjetaScreen> createState() => _TarjetaScreenState();
}

class _TarjetaScreenState extends State<TarjetaScreen> {
  bool _fondoOscuro = false;

  @override
  Widget build(BuildContext context) {
    final Color colorFondo =
        _fondoOscuro ? Colors.grey.shade900 : Colors.purple.shade50;
    final Color colorNombre = _fondoOscuro ? Colors.white : Colors.black;
    final Color colorDescripcion =
        _fondoOscuro ? Colors.grey.shade400 : Colors.grey.shade700;

    return Scaffold(
      backgroundColor: colorFondo,
      appBar: AppBar(title: const Text('Mi tarjeta')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              const SizedBox(height: 20),
              Text(
                'Sofía Humano', // ← tu nombre
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colorNombre,
                ),
              ),
const SizedBox(height: 8),
              Text(
                'Estudiante de desarrollo móvil', // ← tu rol
                style: TextStyle(fontSize: 16, color: colorDescripcion),
              ),
              const SizedBox(height: 32),
              SwitchListTile(
                title: Text(
                  'Fondo oscuro',
                  style: TextStyle(color: colorNombre),
                ),
                value: _fondoOscuro,
                onChanged: (bool nuevoValor) {
                  setState(() {
                    _fondoOscuro = nuevoValor;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('¡Hola!')),
                  );
                },
                child: const Text('Saludar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}