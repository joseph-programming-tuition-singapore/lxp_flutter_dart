import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lxp_flutter_dart/view_models/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Authentication'),
                  onTap: () => context.go('/auth'),
                ),
                ListTile(
                  leading: Icon(Icons.notifications_active),
                  title: Text('Notification'),
                  onTap: () => context.go('/notification'),
                ),
                ListTile(
                  leading: Icon(Icons.link),
                  title: Text('API'),
                  onTap: () => context.go('/api'),
                ),
                ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text('Firestore'),
                  onTap: () => context.go('/firestore'),
                ),
                ListTile(
                  key: const Key('testing_list_tile'),
                  leading: Icon(Icons.bug_report),
                  title: Text('Testing'),
                  onTap: () => context.go('/testing'),
                ),
              ],
            ));
      },
    );
  }
}
