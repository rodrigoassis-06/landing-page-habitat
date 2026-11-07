// home_screen.dart
import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/shared/footer.dart';
import 'package:uniqswims_lp/features/home/widgets/services_section.dart';
import 'package:uniqswims_lp/features/home/widgets/hero_section.dart';
import 'package:uniqswims_lp/features/home/widgets/about_section.dart';
import 'package:uniqswims_lp/features/home/widgets/why_choose_widget.dart';
import 'package:uniqswims_lp/features/home/widgets/contact_section.dart';
import 'package:uniqswims_lp/shared/app_bar_hide.dart';
import 'package:uniqswims_lp/shared/locale/language_selector.dart';
import 'package:uniqswims_lp/features/home/widgets/testimonials_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _whyChooseKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Rola para a chave fornecida (se for null, rola ao topo)
  Future<void> _scrollToKey(GlobalKey? key) async {
    try {
      if (key == null) {
        await _scrollController.animateTo(0,
            duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        return;
      }
      final ctx = key.currentContext;
      if (ctx == null) {
        // fallback: rola ao topo
        await _scrollController.animateTo(0,
            duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        return;
      }
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    } catch (_) {
      // ignore errors silently (e.g., durante hot reload)
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final textStyle = theme.textTheme.labelLarge?.copyWith(color: cs.onSurface, fontWeight: FontWeight.w600, fontSize: 12);

    final navMap = <String, GlobalKey?>{
      l10n.navHome: _heroKey,
      l10n.navAbout: _aboutKey,
      l10n.navServices: _servicesKey,
      l10n.navWhyChoose: _whyChooseKey,
      l10n.navTestimonials: _testimonialsKey,
      l10n.navContact: _contactKey,
    };

    return Scaffold(
      appBar: HideableAppBar(
        scrollController: _scrollController,
        title: l10n.appTitle,
        // actions: usamos um LayoutBuilder para trocar entre menu popup (mobile) e botões (desktop)
        actions: [
          const LanguageSelector(),
          LayoutBuilder(builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 700;
            if (isNarrow) {
              // Mobile: popup menu
              return PopupMenuButton<String>(
                icon: Icon(Icons.menu, color: cs.onSurface),
                onSelected: (label) {
                  final key = navMap[label];
                  _scrollToKey(key);
                },
                itemBuilder: (ctx) => navMap.keys
                    .map((label) => PopupMenuItem<String>(value: label, child: Text(label)))
                    .toList(),
              );
            } else {
              // Desktop: show as TextButtons
              return Row(
                children: navMap.entries.map((entry) {
                  final label = entry.key;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: TextButton(
                      onPressed: () => _scrollToKey(entry.value),
                      style: TextButton.styleFrom(
                        foregroundColor: cs.onSurface,
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      ),
                      child: Text(label, style: textStyle),
                    ),
                  );
                }).toList(),
              );
            }
          }),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(sectionKey: _heroKey, onContactPressed: () => _scrollToKey(_contactKey)),
                AboutSection(backgroundImage: 'assets/images/about.jpeg', sectionKey: _aboutKey, onContactPressed: () => _scrollToKey(_contactKey)),
                ServicesSection(sectionKey: _servicesKey, onContactPressed: () => _scrollToKey(_contactKey)),
                WhyChooseWidget(sectionKey: _whyChooseKey),
                TestimonialsSection(sectionKey: _testimonialsKey),
                ContactSection(sectionKey: _contactKey,),
              ],
            ),
          );
        },
      ),
    );
  }
}