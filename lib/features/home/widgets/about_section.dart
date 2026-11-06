import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/shared/animations/floating_animation.dart';
import 'package:uniqswims_lp/shared/animations/hover_scale.dart';
import 'package:uniqswims_lp/shared/animations/parallax_widget.dart';
import 'package:uniqswims_lp/shared/animations/reveal_on_scroll.dart';
import 'package:uniqswims_lp/shared/animations/stagger_reveal.dart';

class AboutSection extends StatelessWidget {
  final String? backgroundImage;
  final Key? sectionKey;
  final VoidCallback? onContactPressed;

  const AboutSection({
    super.key,
    this.backgroundImage,
    this.sectionKey,
    this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          key: sectionKey,
          width: double.infinity,
          color: colorScheme.background,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 80,
            horizontal: isMobile ? 20 : 48,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: isMobile
                ? _buildColumn(context, colorScheme, textTheme, l10n)
                : _buildRow(context, colorScheme, textTheme, l10n),
          ),
        );
      },
    );
  }

  Widget _buildRow(
    BuildContext context,
    ColorScheme colorScheme,
    TextTheme textTheme,
    AppLocalizations l10n,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: RevealOnScroll(
            child: ParallaxWidget(
              movement: 22,
              child: FloatingAnimation(
                offset: 8,
                duration: const Duration(seconds: 5),
                child: HoverScale(
                  scale: 1.04,
                  child: _buildImageCard(context, colorScheme),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 1,
          child: _buildTextContent(
            context,
            colorScheme,
            textTheme,
            TextAlign.left,
            l10n,
          ),
        ),
      ],
    );
  }

  Widget _buildColumn(
    BuildContext context,
    ColorScheme colorScheme,
    TextTheme textTheme,
    AppLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RevealOnScroll(
          child: ParallaxWidget(
            movement: 22,
            child: FloatingAnimation(
              offset: 8,
              duration: const Duration(seconds: 5),
              child: HoverScale(
                scale: 1.04,
                child: _buildImageCard(context, colorScheme),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _buildTextContent(context, colorScheme, textTheme, TextAlign.center, l10n),
      ],
    );
  }

  Widget _buildImageCard(BuildContext context, ColorScheme colorScheme) {
    final hasImage = backgroundImage != null && backgroundImage!.isNotEmpty;

    return AspectRatio(
      aspectRatio: 9 / 12,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: colorScheme.surface,
          child: hasImage
              ? DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: backgroundImage!.startsWith('http')
                          ? NetworkImage(backgroundImage!)
                          : AssetImage(backgroundImage!) as ImageProvider,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.55),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Icon(
                    Icons.pool,
                    size: 56,
                    color: colorScheme.onSurface.withOpacity(0.9),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildTextContent(
    BuildContext context,
    ColorScheme colorScheme,
    TextTheme textTheme,
    TextAlign align,
    AppLocalizations l10n,
  ) {
    final crossAxisAlignment = align == TextAlign.left
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;

    final alignment = align == TextAlign.left
        ? Alignment.centerLeft
        : Alignment.center;

    return StaggerReveal(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Align(
          alignment: alignment,
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            tween: Tween(begin: 0, end: 64),
            builder: (context, width, child) {
              return Container(
                width: width,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(50),
                ),
              );
            },
          ),
        ),
        Text(
          l10n.aboutTitle,
          textAlign: align,
          style:
              (textTheme.headlineMedium ??
                      const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ))
                  .copyWith(color: colorScheme.onSurface, height: 1.05),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.aboutDesc1,
          textAlign: align,
          style: (textTheme.bodyLarge ?? const TextStyle(fontSize: 16))
              .copyWith(
                color: colorScheme.onSurface.withOpacity(.95),
                height: 1.6,
              ),
        ),
        const SizedBox(height: 18),
        Text(
          l10n.aboutDesc2,
          textAlign: align,
          style: (textTheme.bodyMedium ?? const TextStyle(fontSize: 15))
              .copyWith(
                color: colorScheme.onSurface.withOpacity(.8),
                height: 1.6,
              ),
        ),
        const SizedBox(height: 22),
        Align(
          alignment: alignment,
          child: HoverScale(
            scale: 1.02,
            child: OutlinedButton.icon(
              onPressed: onContactPressed,
              icon: const Icon(Icons.arrow_forward, size: 18),
              label: Text(l10n.aboutCta),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
