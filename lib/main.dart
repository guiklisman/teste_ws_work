import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/car_provider.dart';
import 'providers/lead_provider.dart';
import 'repositories/car_repository.dart';
import 'repositories/lead_repository.dart';
import 'screens/car_list_screen.dart';
import 'services/api_service.dart';
import 'services/lead_service.dart';

void main() {
  void backgroundFetchHeadlessTask(HeadlessTask task) async {
    LeadService leadService = LeadService();
    await leadService.postLeads();
    BackgroundFetch.finish(task.taskId);
  }

  WidgetsFlutterBinding.ensureInitialized();
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CarProvider(CarRepository(ApiService())),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LeadProvider(LeadRepository()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste WS Works',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarListScreen(),
    );
  }
}
