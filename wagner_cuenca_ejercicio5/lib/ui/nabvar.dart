import 'package:flutter/material.dart';

class BarraNavegacion extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  const BarraNavegacion({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titulo,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      backgroundColor: Colors.blueAccent,
      elevation: 4,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
