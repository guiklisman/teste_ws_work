import 'package:flutter/material.dart';

import '../models/car.dart';
import 'lead_form_screen.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(car.nomeModelo)),
      body: Column(
        children: [
          Text('Modelo: ${car.nomeModelo}'),
          Text('Ano: ${car.ano}'),
          Text('Combustível: ${car.combustivel}'),
          Text('Número de portas: ${car.numPortas}'),
          Text('Cor: ${car.cor}'),
          Text('Valor: ${car.valor.toStringAsFixed(2)}'),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => LeadFormScreen(car: car),
                ),
              );
            },
            child: const Text('EU QUERO'),
          ),
        ],
      ),
    );
  }
}
