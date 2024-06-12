import 'package:teste_ws_work/repositories/interfaces/car_repository_interface.dart';

import '../models/car.dart';
import '../services/interfaces/api_service_interface.dart';

class CarRepository implements ICarRepository {
  final IApiService apiService;

  CarRepository(this.apiService);

  @override
  Future<List<Car>> getCars() async {
    return await apiService.fetchCars();
  }
}
