import 'package:flutter/material.dart';

class ParallaxWidget extends StatefulWidget {
  final Widget child;
  final double movement;

  const ParallaxWidget({
    super.key,
    required this.child,
    this.movement = 30,
  });

  @override
  State<ParallaxWidget> createState() => _ParallaxWidgetState();
}

class _ParallaxWidgetState extends State<ParallaxWidget> {
  final GlobalKey _key = GlobalKey();

  ScrollPosition? _scrollPosition;
  late final ValueNotifier<double> _offsetNotifier;

  @override
  void initState() {
    super.initState();
    _offsetNotifier = ValueNotifier<double>(0.0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final newScrollPosition = Scrollable.maybeOf(context)?.position;

    if (identical(_scrollPosition, newScrollPosition)) {
      return;
    }

    _scrollPosition?.removeListener(_onScroll);
    _scrollPosition = newScrollPosition;
    _scrollPosition?.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_onScroll);
    _scrollPosition = null;
    _offsetNotifier.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!mounted) return;

    final renderObject =
        _key.currentContext?.findRenderObject() as RenderBox?;

    if (renderObject == null) return;

    final position = renderObject.localToGlobal(Offset.zero).dy;
    final screenHeight = MediaQuery.of(context).size.height;

    final percent = (position / screenHeight).clamp(0.0, 1.0);
    _offsetNotifier.value = (percent - 0.5) * widget.movement;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: ValueListenableBuilder<double>(
        valueListenable: _offsetNotifier,
        child: widget.child,
        builder: (_, offset, child) {
          return Transform.translate(
            offset: Offset(0, offset),
            child: child,
          );
        },
      ),
    );
  }
}