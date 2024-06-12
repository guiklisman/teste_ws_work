import 'package:flutter/material.dart';

import '../models/car.dart';
import '../repositories/interfaces/car_repository_interface.dart';

class CarProvider with ChangeNotifier {
  List<Car> _cars = [];
  final ICarRepository carRepository;

  CarProvider(this.carRepository);

  List<Car> get cars => _cars;

  Future<void> fetchCars() async {
    _cars = await carRepository.getCars();
    notifyListeners();
  }
}
