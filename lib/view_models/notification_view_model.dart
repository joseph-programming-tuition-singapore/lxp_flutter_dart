import 'package:flutter/material.dart';
import 'package:lxp_flutter_dart/repositories/notification_repo.dart';

class NotificationViewModel extends ChangeNotifier {
  NotificationViewModel({required NotificationRepo notificationRepo})
      : _notificationRepo = notificationRepo;

  final NotificationRepo _notificationRepo;

  void triggerNotification() {
    _notificationRepo.triggerNotification();
  }
}
