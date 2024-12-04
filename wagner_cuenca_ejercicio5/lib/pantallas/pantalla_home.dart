import 'package:flutter/material.dart';
import '../logica/pesca_logica.dart';
import '../ui/degradado.dart';
import 'pantalla_bienvenida.dart';

class PantallaHome extends StatefulWidget {
  const PantallaHome({Key? key}) : super(key: key);

  @override
  State<PantallaHome> createState() => _PantallaHomeState();
}

class _PantallaHomeState extends State<PantallaHome> {
  final PescaLogica pescaLogica = PescaLogica();
  int total = 0;
  final TextEditingController pescaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pesca CEE',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: DegradadoPersonalizado(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Gestión de recursos marinos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Total pescado: $total Kg',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: pescaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Introduce los Kg pescados',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  int? peso = int.tryParse(pescaController.text);
                  if (peso != null) {
                    String mensaje = pescaLogica.agregarPesca(peso);
                    setState(() {
                      total = pescaLogica.total; // Actualizamos el total
                    });

                    // Mostrar mensaje de alerta cuando se supere el límite o finalice el programa
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Mensaje del Sistema'),
                        content: Text(mensaje),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();

                              // Finaliza el programa si el mensaje indica que se superó el límite
                              if (mensaje.contains('Límite superado')) {
                                Navigator.of(context).pop(); // Regresa a la pantalla anterior
                              }
                            },
                            child: const Text('Aceptar'),
                          ),
                        ],
                      ),
                    );
                  }
                  pescaController.clear(); // Limpia el campo de entrada
                },
                child: const Text('Añadir'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PantallaBienvenida(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 40),
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text(
                  'Regresar al inicio',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}