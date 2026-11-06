import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/shared/animations/reveal_on_scroll.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onContactPressed;
  final Key? sectionKey;

  const HeroSection({
    super.key,
    required this.onContactPressed,
    this.sectionKey,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  VideoPlayerController? _controller;
  bool _videoReady = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    final controller = VideoPlayerController.asset(
      'assets/videos/pool_web.mp4',
    );

    try {
      await controller.initialize();

      // Previne vazamento de memória se o widget for desmontado durante a inicialização
      if (!mounted) {
        await controller.dispose();
        return;
      }

      _controller = controller;
      await _controller!.setVolume(0.0);
      await _controller!.setLooping(true);
      await _controller!.play();

      if (mounted) {
        setState(() {
          _videoReady = true;
        });
      }
    } catch (e, st) {
      debugPrint('Video init failed: $e\n$st');
      await controller.dispose();

      if (mounted) {
        setState(() {
          _videoReady = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  Widget _buildVideoOrFallback() {
    if (_videoReady &&
        _controller != null &&
        _controller!.value.isInitialized) {
      return SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            width: _controller!.value.size.width,
            height: _controller!.value.size.height,
            child: VideoPlayer(_controller!),
          ),
        ),
      );
    }

    return Image.asset(
      'assets/images/pool_placeholder.jpg',
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        final double sectionHeight = isMobile
            ? 640.0
            : (MediaQuery.sizeOf(context).height * 0.85).clamp(560.0, 900.0);

        return SizedBox(
          key: widget.sectionKey,
          width: double.infinity,
          height: sectionHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Background Video ou Imagem de Fallback
              Positioned.fill(
                child: _buildVideoOrFallback(),
              ),

              // 2. Overlay com Gradiente
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: isMobile
                          ? Alignment.topCenter
                          : Alignment.centerLeft,
                      end: isMobile
                          ? Alignment.bottomCenter
                          : Alignment.centerRight,
                      colors: [
                        Colors.black.withValues(alpha: 0.20),
                        Colors.black.withValues(alpha: 0.75),
                      ],
                    ),
                  ),
                ),
              ),

              // 3. Conteúdo Central (Textos e Botão)
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 40 : 80,
                  horizontal: isMobile ? 24 : 48,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Row(
                      children: [
                        if (!isMobile)
                          const Expanded(flex: 5, child: SizedBox()),

                        Expanded(
                          flex: isMobile ? 1 : 6,
                          child: Align(
                            alignment: isMobile
                                ? Alignment.center
                                : Alignment.centerRight,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: isMobile
                                  ? CrossAxisAlignment.center
                                  : CrossAxisAlignment.end,
                              children: [
                                RevealOnScroll(
                                  child: Text(
                                    l10n.heroTitle,
                                    textAlign: isMobile
                                        ? TextAlign.center
                                        : TextAlign.right,
                                    style: (textTheme.displayLarge ??
                                            const TextStyle(
                                              fontSize: 48,
                                              fontWeight: FontWeight.w900,
                                            ))
                                        .copyWith(
                                      color: Colors.white,
                                      height: 1.05,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                RevealOnScroll(
                                  delay: const Duration(milliseconds: 200),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: isMobile ? 560 : 520,
                                    ),
                                    child: Text(
                                      l10n.heroSubtitle,
                                      textAlign: isMobile
                                          ? TextAlign.center
                                          : TextAlign.right,
                                      style: (textTheme.bodyLarge ??
                                              const TextStyle(fontSize: 18))
                                          .copyWith(
                                        color: Colors.white,
                                        height: 1.6,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 28),

                                RevealOnScroll(
                                  delay: const Duration(milliseconds: 400),
                                  child: OutlinedButton(
                                    onPressed: widget.onContactPressed,
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      side: const BorderSide(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 28,
                                        vertical: 16,
                                      ),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(l10n.heroCta),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          Icons.arrow_forward,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}