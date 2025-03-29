// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

class SoundWaveAnimation extends StatefulWidget {
  const SoundWaveAnimation({
    super.key,
    this.width,
    this.height,
    required this.isRecording,
    this.barColor = Colors.blue,
    this.numberOfBars = 7,
  });

  final double? width;
  final double? height;
  final bool isRecording;
  final Color barColor;
  final int numberOfBars;

  @override
  State<SoundWaveAnimation> createState() => _SoundWaveAnimationState();
}

class _SoundWaveAnimationState extends State<SoundWaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _createAnimations();

    if (widget.isRecording) {
      _controller.repeat(reverse: true);
    }
  }

  void _createAnimations() {
    _animations = List.generate(widget.numberOfBars, (index) {
      final double start = (index / widget.numberOfBars) * 0.5;
      final double end = start + 0.5;
      return Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void didUpdateWidget(SoundWaveAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isRecording != oldWidget.isRecording) {
      if (widget.isRecording) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
        _controller.value = 0.0;
      }
    }

    if (widget.numberOfBars != oldWidget.numberOfBars) {
      _createAnimations();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBar(int index, double height) {
    return Container(
      width: 8,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color:
            widget.barColor.withOpacity(0.6 + (0.4 * _animations[index].value)),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final containerHeight = widget.height ?? 40.0;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: widget.width ?? 200,
          height: containerHeight,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.numberOfBars, (index) {
                final animatedHeight =
                    containerHeight * _animations[index].value;
                return _buildBar(index, animatedHeight);
              }),
            ),
          ),
        );
      },
    );
  }
}
