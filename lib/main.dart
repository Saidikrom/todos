import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/logic/cubit/todo_cubit.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/screens/onboarding.dart';
import 'package:todo/services/notification_services.dart';

import 'package:timezone/data/latest.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoarding(),
        routes: AppPages.pages,
      ),
    );
  }
}
