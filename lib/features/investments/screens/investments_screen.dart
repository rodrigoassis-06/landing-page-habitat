import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/features/lead_capture/widgets/lead_form_widget.dart';
import 'package:uniqswims_lp/features/investments/widgets/investments_hero_section.dart';
import 'package:uniqswims_lp/features/investments/widgets/investments_opportunities_section.dart';
import 'package:uniqswims_lp/features/investments/widgets/investments_why_section.dart';
import 'package:uniqswims_lp/shared/app_bar_hide.dart';
import 'package:uniqswims_lp/shared/locale/language_selector.dart';
import 'package:uniqswims_lp/shared/footer.dart';

class InvestmentsScreen extends StatefulWidget {
  const InvestmentsScreen({super.key});

  @override
  State<InvestmentsScreen> createState() => _InvestmentsScreenState();
}

class _InvestmentsScreenState extends State<InvestmentsScreen> {
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
      appBar: HideableAppBar(
        scrollController: _scrollController,
        title: l10n.investmentsAppBar,
        actions: [LanguageSelector()],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const InvestmentsHeroSection(),
            const InvestmentsOpportunitiesSection(),
            const InvestmentsWhySection(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              child: LeadFormWidget(initialService: 'Investments'),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}