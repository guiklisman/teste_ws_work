import 'package:flutter/material.dart';

import '../models/car.dart';
import '../repositories/car_repository.dart';

class CarProvider with ChangeNotifier {
  List<Car> _cars = [];
  final CarRepository carRepository;

  CarProvider(this.carRepository);

  List<Car> get cars => _cars;

  Future<void> fetchCars() async {
    _cars = await carRepository.getCars();
    notifyListeners();
  }
}
