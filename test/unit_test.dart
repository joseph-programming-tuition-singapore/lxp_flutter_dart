import 'package:lxp_flutter_dart/view_models/testing_view_model.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented', () {
    final viewModel = TestingViewModel();

    viewModel.addCount();

    expect(viewModel.count, 1);
  });
}
