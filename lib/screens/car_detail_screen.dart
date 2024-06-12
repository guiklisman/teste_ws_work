import 'package:flutter/material.dart';

import '../models/car.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/row_item_detail_car.dart';
import 'lead_form_screen.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: car.nomeModelo,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (car.url.isNotEmpty)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      car.url,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car.nomeModelo,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Divider(height: 20, thickness: 2),
                      const SizedBox(height: 10),
                      RowItemDetailCar(
                          icon: Icons.calendar_today,
                          label: 'Ano',
                          value: car.ano.toString()),
                      RowItemDetailCar(
                          icon: Icons.local_gas_station,
                          label: 'Combustível',
                          value: car.combustivel),
                      RowItemDetailCar(
                          icon: Icons.door_sliding,
                          label: 'Número de portas',
                          value: car.numPortas.toString()),
                      RowItemDetailCar(
                          icon: Icons.color_lens, label: 'Cor', value: car.cor),
                      RowItemDetailCar(
                          icon: Icons.attach_money,
                          label: 'Valor',
                          value: car.valorFormatted()),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  title: "Eu Quero",
                  function: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => LeadFormScreen(car: car),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
