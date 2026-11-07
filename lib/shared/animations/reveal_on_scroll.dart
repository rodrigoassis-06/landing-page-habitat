import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RevealOnScroll extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset beginOffset;
  final Curve curve;

  const RevealOnScroll({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 700),
    this.beginOffset = const Offset(0, 0.15),
    this.curve = Curves.easeOutCubic,
  });

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Key _detectorKey;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _detectorKey = widget.key ?? UniqueKey();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
    _slideAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_visible && info.visibleFraction > 0.15) {
      setState(() => _visible = true);
      if (widget.delay > Duration.zero) {
        Future.delayed(widget.delay, () {
          if (mounted) _controller.forward();
        });
      } else {
        _controller.forward();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_visible) {
      return RepaintBoundary(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: widget.child,
          ),
        ),
      );
    }

    return VisibilityDetector(
      key: _detectorKey,
      onVisibilityChanged: _onVisibilityChanged,
      child: Opacity(
        opacity: 0,
        child: widget.child,
      ),
    );
  }
}