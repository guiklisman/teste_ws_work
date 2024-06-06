import '../../models/car.dart';

abstract class IApiService {
  Future<List<Car>> fetchCars();
}
