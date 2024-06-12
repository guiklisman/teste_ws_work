import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/lead.dart';
import '../repositories/lead_repository.dart';

class LeadService {
  final Dio _dio = Dio();
  final LeadRepository _leadRepository = LeadRepository();
  static const String _leadUrl = 'https://www.wswork.com.br/cars/leads';

  Future<void> postLeads() async {
    print('foi post');
    List<Lead> leads = await _leadRepository.getLeads();
    for (var lead in leads) {
      try {
        await _dio.post(
          _leadUrl,
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: json.encode(lead.toJson()),
        );
      } catch (e) {
        print('Failed to post lead: $e');
      }
    }
  }
}
