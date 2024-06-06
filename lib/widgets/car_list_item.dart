import 'package:flutter/material.dart';
import '../models/car.dart';
import '../screens/car_detail_screen.dart';

class CarListItem extends StatelessWidget {
  final Car car;

  CarListItem({required this.car});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(car.nomeModelo),
      subtitle: Text('Ano: ${car.ano} - Valor: ${car.valor.toStringAsFixed(2)}'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => CarDetailScreen(car: car),
          ),
        );
      },
    );
  }
}
