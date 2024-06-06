import '../models/car.dart';
import '../services/interfaces/api_service_interface.dart';

class CarRepository {
  final IApiService apiService;

  CarRepository(this.apiService);

  Future<List<Car>> getCars() async {
    return await apiService.fetchCars();
  }
}
