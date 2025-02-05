import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lxp_flutter_dart/view_models/notification_view_model.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key, required this.viewModel});

  final NotificationViewModel viewModel;

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notification'),
          ),
          body: Center(
            child: TextButton(
              onPressed: () => widget.viewModel.triggerNotification(),
              child: Text('Set Notification'),
            ),
          ),
        );
      },
    );
  }
}
