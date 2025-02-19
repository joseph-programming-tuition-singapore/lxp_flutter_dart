import 'package:flutter/material.dart';
import 'package:lxp_flutter_dart/view_models/testing_view_model.dart';

class TestingView extends StatefulWidget {
  const TestingView({super.key, required this.viewModel});

  final TestingViewModel viewModel;
  @override
  State<TestingView> createState() => _TestingViewState();
}

class _TestingViewState extends State<TestingView> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Testing'),
          ),
          body: Column(
            children: [
              Center(
                child: TextButton(
                  key: const Key('add_count_button'),
                  onPressed: () => widget.viewModel.addCount(),
                  child: Text(
                    '${widget.viewModel.count}',
                    key: const Key('count_text'),
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text('Press the number to increment the count'),
            ],
          ),
        );
      },
    );
  }
}
