import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationHelper {
  static void createSimpleNotification({required String title, required String body, int? delaySeconds}) {

    Future.delayed(Duration(seconds: delaySeconds ?? 0), () {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: 'basic_channel',
              title: title,
              body: body,
              actionType: ActionType.Default
          )
      );
    });
  }
}