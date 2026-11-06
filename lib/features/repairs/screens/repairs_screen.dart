import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/features/lead_capture/widgets/lead_form_widget.dart';
import 'package:uniqswims_lp/features/repairs/widgets/repairs_hero_section.dart';
import 'package:uniqswims_lp/features/repairs/widgets/repairs_services_section.dart';
import 'package:uniqswims_lp/features/repairs/widgets/repairs_why_section.dart';
import 'package:uniqswims_lp/shared/app_bar_hide.dart';
import 'package:uniqswims_lp/shared/locale/language_selector.dart';
import 'package:uniqswims_lp/shared/footer.dart';

class RepairsScreen extends StatefulWidget {
  const RepairsScreen({super.key});

  @override
  State<RepairsScreen> createState() => _RepairsScreenState();
}

class _RepairsScreenState extends State<RepairsScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HideableAppBar(
        scrollController: _scrollController,
        title: l10n.repairsAppBar,
        actions: [LanguageSelector()],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const RepairsHeroSection(),
            const RepairsServicesSection(),
            const RepairsWhySection(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              child: LeadFormWidget(initialService: 'Repairs'),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}