import 'package:flutter/material.dart';
import 'package:uniqswims_lp/shared/animations/stagger_reveal.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  final Color color;

  const SectionTitle({
    super.key,
    required this.title,
    required this.color,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = textAlign == TextAlign.left
        ? Alignment.centerLeft
        : Alignment.center;

    final crossAxis = textAlign == TextAlign.left
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;

    return StaggerReveal(
      crossAxisAlignment: crossAxis,
      children: [
        Align(
          alignment: alignment,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 64),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            builder: (_, width, __) {
              return Container(
                width: width,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(50),
                ),
              );
            },
          ),
        ),
        Text(
          title,
          textAlign: textAlign,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                height: 1.05,
              ),
        ),
      ],
    );
  }
}