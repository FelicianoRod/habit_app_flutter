import 'package:flutter_test/flutter_test.dart';
import 'package:habits_app/core/providers/create_habit_provider.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  test('Selected Duration', () {
    final container = ProviderContainer.test();
    addTearDown(container.dispose);

    final value = container.read(selectedDurationProvider);
    expect(value, equals(Duration(minutes: 10)));

    container
        .read(selectedDurationProvider.notifier)
        .changeDuration(Duration(minutes: 15));

    final valueChanged = container.read(selectedDurationProvider);
    expect(valueChanged, Duration(minutes: 15));
  });
}
