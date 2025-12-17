import 'package:chronograph/chronograph.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_constants.dart';

class TimerWidget extends StatefulWidget {
  final Duration duration;
  final VoidCallback? onTimerCompleted;

  const TimerWidget({super.key, required this.duration, this.onTimerCompleted});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late ChronoGraph timer;

  @override
  void initState() {
    super.initState();

    timer = ChronoGraph.timer(
      duration: widget.duration,
      // duration: Duration(seconds: 3), // Debug
      autostart: false,
      onCompleted: () {
        widget.onTimerCompleted?.call();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChronoView(
          graph: timer,
          builder: (context, info, _) {
            return Text('${info.paddedMinutes}:${info.paddedSeconds}');
          },
          child: Text('Debug: Este es el child'),
        ),
        SizedBox(height: AppConstants.spacingM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Start
            IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: () {
                timer.start();
              },
            ),
            SizedBox(height: AppConstants.spacingM),
            // Pause
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: () {
                timer.pause();
              },
            ),
            SizedBox(height: AppConstants.spacingM),
            // Reset
            IconButton(
              icon: Icon(Icons.restore),
              onPressed: () {
                timer.reset();
              },
            ),
          ],
        ),
      ],
    );
  }
}
