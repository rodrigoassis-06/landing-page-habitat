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
  double _offset = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final newScrollPosition = Scrollable.maybeOf(context)?.position;

    // Evita adicionar o mesmo listener mais de uma vez quando as
    // dependências do widget forem atualizadas.
    if (identical(_scrollPosition, newScrollPosition)) {
      return;
    }

    // Se o widget mudou de Scrollable, remove o listener anterior.
    _scrollPosition?.removeListener(_onScroll);

    _scrollPosition = newScrollPosition;
    _scrollPosition?.addListener(_onScroll);
  }

  @override
  void dispose() {
    // Não usa context aqui.
    _scrollPosition?.removeListener(_onScroll);
    _scrollPosition = null;

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

    setState(() {
      _offset = (percent - 0.5) * widget.movement;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      key: _key,
      offset: Offset(0, _offset),
      child: widget.child,
    );
  }
}