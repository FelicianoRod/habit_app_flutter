import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habits_app/core/providers/habits_provider.dart';

import '../../../domain/models/habit.dart';
import 'habit_card.dart';
import 'header.dart';
import 'period_selector_widget.dart';

class HomeTab extends ConsumerWidget {
  String selectedPeriod = 'All Day';
  final periods = ['All Day', 'Morning', 'Evening', 'Afternoon'];

  HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitsAsync = ref.watch(habitsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: habitsAsync.when(
        data: (habits) => _buildContent(context, ref, habits),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    List<Habit> habits,
  ) {
    final sortedAsync = ref.watch(filteredHabitsProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          // Calendar
          Header(),
          const SizedBox(height: 16),
          // Filter
          PeriodSelectorWidget(),
          // Habit section
          sortedAsync.when(
            data: (sorted) {
              return _buildHabitsList(context, ref, sorted);
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Algo salio mal')),
            // error: (err, stack) => Center(child: Text('Error: $err')), // debug
          ),
        ],
      ),
    );
  }

  Widget _buildHabitsList(
    BuildContext context,
    WidgetRef ref,
    List<Habit> habits,
  ) {
    if (habits.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text(
            'No hay hábitos registrados',
            style: Theme.of(context).textTheme.bodyMedium ?? TextStyle(),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: habits.map((h) => HabitCard(habit: h)).toList()),
    );
  }
}
