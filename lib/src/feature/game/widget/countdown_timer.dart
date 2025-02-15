import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({required this.timeRemaining, this.onEnd, super.key});

  final Duration timeRemaining;
  final VoidCallback? onEnd;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  late int _timeRemaining;

  @override
  void initState() {
    super.initState();
    const oneSecond = Duration(seconds: 1);
    _timeRemaining = widget.timeRemaining.inSeconds;
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_timeRemaining == 0) {
        setState(() {
          timer.cancel();
          widget.onEnd?.call();
        });
      } else {
        setState(() {
          _timeRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Text(
    durationToStringDate(Duration(seconds: _timeRemaining)),
    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
  );
}

String durationToStringDate(Duration duration) {
  final twoDigitMinutes = _twoDigits(duration.inMinutes.remainder(60));
  final twoDigitSeconds = _twoDigits(duration.inSeconds.remainder(60));
  final twoDigitHours = _twoDigits(duration.inHours);
  return '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
}

String _twoDigits(int n) => n.toString().padLeft(2, '0');
