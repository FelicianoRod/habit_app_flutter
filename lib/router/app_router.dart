import 'package:go_router/go_router.dart';
import 'package:habits_app/ui/create_habit/widgets/habit_form_screen.dart';
import 'package:habits_app/ui/create_habit/widgets/measure_screen.dart';
import 'package:habits_app/ui/create_habit/widgets/reminder_screen.dart';
import 'package:habits_app/ui/edit_habit/widgets/edit_habit_screen.dart';
import 'package:habits_app/ui/habit/widgets/habit_tab.dart';
import 'package:habits_app/ui/home/widgets/home_tab.dart';
import 'package:habits_app/ui/stats/widgets/stats_tab.dart';

import '../ui/main/main_screen.dart';

// class RouteNames {
//   static const editHabit = 'edit-habit';
// }

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => NoTransitionPage(child: HomeTab()),
        ),
        GoRoute(
          path: '/habits',
          pageBuilder: (context, state) => NoTransitionPage(child: HabitTab()),
          routes: [
            GoRoute(
              path: '/measure',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: MeasureScreen()),
              routes: [
                GoRoute(
                  path: '/form',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: HabitFormScreen()),
                  routes: [
                    GoRoute(
                      path: '/reminder',
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: ReminderScreen()),
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              // name: RouteNames.editHabit,
              path: '/edit-habit/:habitId',
              builder: (context, state) {
                final habitId = state.pathParameters["habitId"]!;
                final id = int.parse(habitId);
                return EditHabitScreen(habitId: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/stats',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: StatsTab()),
        ),
      ],
    ),

    // GoRoute(
    //   path: '/edit-habit',
    //   builder: (context, state) {
    //     final habit = state.extra as Habit;
    //     return CreateHabitScreen(habitToEdit: habit);
    //   },
    // ),
  ],
);
