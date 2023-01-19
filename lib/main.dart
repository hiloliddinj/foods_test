import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/helpers/notification_helper.dart';
import 'app/globals/global_methods.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  await initAwesomeNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    initStateNotifications();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('Main, appState: $state');
    if (state == AppLifecycleState.paused) {
      NotificationHelper.createSimpleNotification(
          title: 'Hello',
          body: 'We miss you',
        delaySeconds: 2,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foods Test',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

