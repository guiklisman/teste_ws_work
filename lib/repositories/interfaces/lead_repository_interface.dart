import '../../models/lead.dart';

abstract class ILeadRepository {
  Future<void> addLead(Lead lead);
  Future<List<Lead>> getLeads();
}
