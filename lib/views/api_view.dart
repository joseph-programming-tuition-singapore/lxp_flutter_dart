import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lxp_flutter_dart/view_models/api_view_model.dart';

class ApiView extends StatefulWidget {
  const ApiView({super.key, required this.viewModel});

  final ApiViewModel viewModel;

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
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
                  Text('Latitude: ${widget.viewModel.weatherResult.lat}'),
                  Text('Longitude: ${widget.viewModel.weatherResult.lng}'),
                  Spacer(),
                  TextButton(
                    onPressed: () => widget.viewModel.getWeatherSync(),
                    child: Text('Get Data', style: TextStyle(fontSize: 16)),
                  ),
                  Spacer(flex: 20),
                ],
              ),
            ));
      },
    );
  }
}
