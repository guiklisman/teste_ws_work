import 'package:background_fetch/background_fetch.dart';

import 'lead_service.dart';

class BackgroundService {
  static void backgroundFetchHeadlessTask(HeadlessTask task) async {
    LeadService leadService = LeadService();
    await leadService.postLeads();
    BackgroundFetch.finish(task.taskId);
  }
}
