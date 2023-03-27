import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/flutter_logo');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: (int id, String? title, String? body,
                String? payload) async {});

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          'channelId',
          'channelName',
          'Main channel notifications',
          importance: Importance.max,
          // priority: Priority.max,
          // icon: '@drawable/flutter_logo',
        ),
        iOS: IOSNotificationDetails());
  }
  
  Future scheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
    required DateTime scheduleNotificationDateTime,
  }) async {
    return flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduleNotificationDateTime, tz.local),
        await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
  Future<void> showNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payLoad,
      required int seconds}) async {
    return flutterLocalNotificationsPlugin.show(
        id, title, body, await notificationDetails());
        }
    // await flutterLocalNotificationsPlugin.zonedSchedule(
    // id,
    // title,
    // body,
    // tz.TZDateTime.now(tz.local).add(
    //   Duration(seconds: seconds),
    // ),
    //   const NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       'main_channel',
    //       'Main Channel',
    //       'Main channel notifications',
    //       importance: Importance.max,
    //       priority: Priority.max,
    //       icon: '@drawable/flutter_logo',
    //     ),
    //     iOS: IOSNotificationDetails(
    //       sound: 'default.wav',
    //       presentAlert: true,
    //       presentBadge: true,
    //       presentSound: true,
    //     ),
    //   ),
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime,
    //   androidAllowWhileIdle: true,
    // );
  }



