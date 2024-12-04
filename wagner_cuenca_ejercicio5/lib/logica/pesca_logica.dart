class PescaLogica {
  int total = 0; // Total de kg acumulados
  int? limite;   // Límite permitido

  /// Establece el límite de pesca permitido
  void establecerLimite(int nuevoLimite) {
    limite = nuevoLimite;
  }

  /// Agrega los kg pescados y devuelve un mensaje o detiene la ejecución si se supera el límite
  String agregarPesca(int peso) {
    if (peso == 0) {
      return 'El programa ha finalizado.\n ***** THE END *****';
    }

    total += peso;

    if (limite != null && total >= limite!) {
      int excedido = total - limite!;

      // Lógica del ciclo for para detener la ejecución
      for (int i = 1200; i > 500; i -= 100) {
        print('Simulando proceso de finalización con valor $i');
      }

      return '¡Límite superado! Has excedido el límite por $excedido Kg.\n ***** THE END *****';
    }

    return 'Total pescado por ahora: $total Kg.';
  }
}
