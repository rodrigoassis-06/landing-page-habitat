import 'package:flutter/material.dart';
import 'package:uniqswims_lp/features/home/widgets/about_section.dart';
import 'package:uniqswims_lp/features/home/widgets/contact_section.dart';
import 'package:uniqswims_lp/features/home/widgets/hero_section.dart';
import 'package:uniqswims_lp/features/home/widgets/services_section.dart';
import 'package:uniqswims_lp/features/home/widgets/why_choose_widget.dart';
import 'package:uniqswims_lp/habitat_theme.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/shared/footer.dart';
import 'package:uniqswims_lp/shared/habitat_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _processKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollToKey(GlobalKey? key) async {
    try {
      if (key == null) {
        await _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
        return;
      }
      final ctx = key.currentContext;
      if (ctx == null) {
        await _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
        return;
      }
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: 0.05,
      );
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final navMap = <String, GlobalKey?>{
      l10n.navHome: _heroKey,
      l10n.navServices: _servicesKey,
      l10n.navAbout: _aboutKey,
      l10n.navProcess: _processKey,
      l10n.navContact: _contactKey,
    };

    return Scaffold(
      backgroundColor: HabitatTheme.background,
      appBar: HabitatAppBar(
        scrollController: _scrollController,
        navMap: navMap,
        onNavigate: _scrollToKey,
        onCtaPressed: () => _scrollToKey(_contactKey),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              sectionKey: _heroKey,
              onContactPressed: () => _scrollToKey(_contactKey),
              onPortfolioPressed: () => _scrollToKey(_servicesKey),
            ),
            ServicesSection(sectionKey: _servicesKey),
            AboutSection(
              sectionKey: _aboutKey,
              backgroundImage: 'assets/images/about.jpeg',
              onContactPressed: () => _scrollToKey(_contactKey),
            ),
            WhyChooseWidget(sectionKey: _processKey),
            ContactSection(sectionKey: _contactKey),
            Footer(
              linkActions: {
                'contact': () => _scrollToKey(_contactKey),
              },
              socialLinksOverride: {
                'instagram': 'https://instagram.com/habitatmedia',
                'linkedin': 'https://linkedin.com/company/habitatmedia',
              },
            ),
          ],
        ),
      ),
    );
  }
}
