import 'package:dio/dio.dart';

import '../models/car.dart';
import 'interfaces/api_service_interface.dart';

class ApiService implements IApiService {
  final Dio _dio = Dio();

  @override
  Future<List<Car>> fetchCars() async {
    try {
      final response = await _dio.get('https://wswork.com.br/cars.json');
      List<dynamic> data = response.data['cars'];
      return data.map((json) => Car.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Falha ao carregar carros: $e');
    }
  }
}
