import 'package:flutter/material.dart';

import '../models/lead.dart';
import '../repositories/interfaces/lead_repository_interface.dart';

class LeadProvider with ChangeNotifier {
  final ILeadRepository leadRepository;

  LeadProvider(this.leadRepository);

  Future<void> addLead(Lead lead) async {
    await leadRepository.addLead(lead);
    notifyListeners();
  }

  Future<List<Lead>> getLeads() async {
    return await leadRepository.getLeads();
  }
}
