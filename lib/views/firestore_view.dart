import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lxp_flutter_dart/models/profile_models.dart';
import 'package:lxp_flutter_dart/view_models/api_view_model.dart';
import 'package:lxp_flutter_dart/view_models/firestore_view_model.dart';

class FirestoreView extends StatefulWidget {
  const FirestoreView({super.key, required this.viewModel});

  final FirestoreViewModel viewModel;

  @override
  State<FirestoreView> createState() => _FirestoreViewState();
}

class _FirestoreViewState extends State<FirestoreView> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('API'),
            ),
            body: Center(
              child: Column(
                children: [
                  Spacer(),
                  // Text('Latitude: ${widget.viewModel.weatherResult.lat}'),
                  // Text('Longitude: ${widget.viewModel.weatherResult.lng}'),
                  Spacer(),
                  TextButton(
                    onPressed: () => widget.viewModel.addUserDetails(
                        UserDetails('0', 'Tester A', 'test@example.com', '')),
                    child:
                        Text('Add Dummy Data', style: TextStyle(fontSize: 16)),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () => widget.viewModel
                        .readUserDetails('UwsUBEsm5ojdPawsvWoq'),
                    child: Text('Read Profile', style: TextStyle(fontSize: 16)),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () => widget.viewModel
                        .updateUserDetails('Tester C', 'UwsUBEsm5ojdPawsvWoq'),
                    child:
                        Text('Update Profile', style: TextStyle(fontSize: 16)),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () => widget.viewModel
                        .deleteUserDetails('UwsUBEsm5ojdPawsvWoq'),
                    child:
                        Text('Delete Profile', style: TextStyle(fontSize: 16)),
                  ),
                  Spacer(flex: 20),
                ],
              ),
            ));
      },
    );
  }
}
