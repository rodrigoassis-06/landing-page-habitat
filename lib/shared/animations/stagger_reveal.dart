import 'package:flutter/material.dart';
import 'package:uniqswims_lp/shared/animations/reveal_on_scroll.dart';

class StaggerReveal extends StatelessWidget {
  final List<Widget> children;

  final Duration initialDelay;
  final Duration staggerDelay;

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  const StaggerReveal({
    super.key,
    required this.children,
    this.initialDelay = const Duration(milliseconds: 150),
    this.staggerDelay = const Duration(milliseconds: 150),
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: List.generate(
        children.length,
        (index) {
          return RevealOnScroll(
            delay: Duration(
              milliseconds:
                  initialDelay.inMilliseconds +
                  index * staggerDelay.inMilliseconds,
            ),
            child: children[index],
          );
        },
      ),
    );
  }
}