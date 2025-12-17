import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/habits_provider.dart';
import '../../../theme/app_constants.dart';

class PeriodSelectorWidget extends StatelessWidget {
  const PeriodSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final measures = ref.watch(measureValuesProvider);
        final selectedMeasure = ref.watch(habitCurrentFilterProvider);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: measures.map((m) {
                  final selected = m.name == selectedMeasure.name;
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(habitCurrentFilterProvider.notifier)
                          .setCurrentFilter(m);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _filterName(m.name),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  String _filterName(String name) {
    final String filterName;
    if (name == 'all') {
      filterName = 'Todos';
    } else if (name == 'quantity') {
      filterName = 'Cantidad';
    } else if (name == 'time') {
      filterName = 'Tiempo';
    } else if (name == 'repetitions') {
      filterName = 'Repeticiones';
    } else {
      filterName = name;
    }
    return filterName;
  }
}
