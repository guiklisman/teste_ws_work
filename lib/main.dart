import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/car_provider.dart';
import 'providers/lead_provider.dart';
import 'repositories/car_repository.dart';
import 'repositories/lead_repository.dart';
import 'screens/car_list_screen.dart';
import 'services/api_service.dart';
import 'services/background_service.dart';
import 'services/lead_service.dart';
import 'utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BackgroundFetch.registerHeadlessTask(
      BackgroundService.backgroundFetchHeadlessTask);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CarProvider(CarRepository(ApiService())),
        ),
        ChangeNotifierProvider(
          create: (context) => LeadProvider(LeadRepository()),
        ),
      ],
      child: const MyApp(),
    ),
  );

  initBackgroundFetch();
}

void initBackgroundFetch() {
  print('Iniciou');
  BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 1,
        stopOnTerminate: false,
        enableHeadless: true,
        startOnBoot: true,
      ), (String taskId) async {
    LeadService leadService = LeadService();
    await leadService.postLeads();
    BackgroundFetch.finish(taskId);
  }).then((int status) {
    print('[BackgroundFetch] configure success: $status');
  }).catchError((e) {
    print('[BackgroundFetch] configure ERROR: $e');
  });

  // Agendar a primeira tarefa
  BackgroundFetch.scheduleTask(TaskConfig(
    taskId: "com.company.app.task",
    delay: 10000, // 10 segundos
    periodic: true,
    stopOnTerminate: false,
    enableHeadless: true,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste WS Works',
      theme: GlobalThemeData.lightThemeData,
      home: const CarListScreen(),
    );
  }
}
