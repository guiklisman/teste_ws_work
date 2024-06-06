import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/car_provider.dart';
import '../widgets/car_list_item.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carros'),
      ),
      body: FutureBuilder(
        future: Provider.of<CarProvider>(context, listen: false).fetchCars(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return const Center(child: Text('Ocorreu um erro!'));
          } else {
            return Consumer<CarProvider>(
              builder: (ctx, carProvider, child) => ListView.builder(
                itemCount: carProvider.cars.length,
                itemBuilder: (ctx, i) => CarListItem(car: carProvider.cars[i]),
              ),
            );
          }
        },
      ),
    );
  }
}
