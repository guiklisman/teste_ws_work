import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/car_provider.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/car_list_item.dart';
import '../widgets/states/no_content_widget.dart';
import '../widgets/states/states_widget.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Carros - Ws Work",
      ),
      body: FutureBuilder(
        future: Provider.of<CarProvider>(context, listen: false).fetchCars(),
        builder: (context, snapshot) {
          return StatesWidget<CarProvider>(
            snapshot: snapshot,
            consumerBuilder: (ctx, carProvider, child) {
              if (carProvider.cars.isEmpty) {
                return const NoContentWidget();
              }
              return ListView.builder(
                itemCount: carProvider.cars.length,
                itemBuilder: (ctx, i) => CarListItem(
                  car: carProvider.cars[i],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
