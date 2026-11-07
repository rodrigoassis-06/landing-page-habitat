import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/shared/locale/language_selector.dart';

class Footer extends StatelessWidget {
  final bool compact;

  final Map<String, VoidCallback>? linkActions;

  final Map<String, String>? socialLinksOverride;

  final String? madeByUrl;

  const Footer({
    Key? key,
    this.compact = false,
    this.linkActions,
    this.socialLinksOverride,
    this.madeByUrl,
  }) : super(key: key);

  static const Map<String, String> _defaultSocialLinks = {
    'linkedin': 'https://linkedin.com/company/habitatmedia',
    'instagram': 'https://instagram.com/habitatmedia',
  };

  Future<void> _openUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      if (!await canLaunchUrl(uri)) return;
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      // ignore errors silently
    }
  }

  Object _iconFor(String name) {
    switch (name.toLowerCase()) {
      case 'facebook':
        return FontAwesomeIcons.facebookF;
      case 'instagram':
        return FontAwesomeIcons.instagram;
      case 'linkedin':
        return FontAwesomeIcons.linkedinIn;
      case 'twitter':
        return FontAwesomeIcons.twitter;
      default:
        return FontAwesomeIcons.globe;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final tt = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    final padding = compact ? 12.0 : 24.0;
    final socialLinks = socialLinksOverride ?? _defaultSocialLinks;
    final madeUrl = madeByUrl ?? 'https://gabrielmoraisdev.com.br/';

    final linkEntries = <_FooterLink>[
      _FooterLink(key: 'about', label: l10n.footerAbout, route: '/about'),
      _FooterLink(key: 'services', label: l10n.footerServices, route: '/services'),
      _FooterLink(key: 'clients', label: l10n.footerClients, route: '/clients'),
      _FooterLink(key: 'mission', label: l10n.footerMission, route: '/mission'),
      _FooterLink(key: 'licensing', label: l10n.footerLicensing, route: '/licensing'),
      _FooterLink(key: 'contact', label: l10n.footerContact, route: '/contact'),
    ];

    return Container(
      color: cs.surface,
      padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding * 1.5),
      child: LayoutBuilder(builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 700;
        final textColor = cs.onSurface;
        final smallTextStyle = tt.bodySmall?.copyWith(color: textColor.withOpacity(0.85)) ??
            TextStyle(color: textColor.withOpacity(0.85), fontSize: compact ? 12 : 14);

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: isNarrow ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Flex(
              direction: isNarrow ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: isNarrow ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(right: isNarrow ? 0 : 24.0, bottom: isNarrow ? 12 : 0),
                    child: Text(
                      l10n.footerCompanyDesc,
                      style: smallTextStyle.copyWith(height: 1.5),
                      textAlign: isNarrow ? TextAlign.center : TextAlign.start,
                    ),
                  ),
                ),

                SizedBox(width: isNarrow ? 0 : 16, height: isNarrow ? 12 : 0),

                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: isNarrow ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: [
                      Text(l10n.footerCompany, style: smallTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: compact ? 13 : 16)),
                      SizedBox(height: 8),
                      Wrap(
                        alignment: isNarrow ? WrapAlignment.center : WrapAlignment.start,
                        spacing: 16,
                        runSpacing: 8,
                        children: linkEntries.map((entry) {
                          return InkWell(
                            onTap: () {
                              if (linkActions != null && linkActions!.containsKey(entry.key)) {
                                linkActions![entry.key]!();
                                return;
                              }
                              if (entry.route.startsWith('/')) {
                                try {
                                  Navigator.of(context).pushNamed(entry.route);
                                } catch (_) {}
                              }
                            },
                            child: Text(entry.label, style: smallTextStyle.copyWith(decoration: TextDecoration.underline)),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: isNarrow ? 0 : 24, height: isNarrow ? 12 : 0),

                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: isNarrow ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: [
                      Text(l10n.footerSocial, style: smallTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: compact ? 13 : 16)),
                      SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: socialLinks.entries.map((s) {
                          final rawIcon = _iconFor(s.key);
                          final Widget iconWidget;

                          if (rawIcon is IconData) {
                            iconWidget = Icon(rawIcon, color: textColor, size: compact ? 16 : 18);
                          } else {
                            iconWidget = FaIcon(rawIcon as dynamic, color: textColor, size: compact ? 16 : 18);
                          }

                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: IconButton(
                              onPressed: () => _openUrl(s.value),
                              icon: iconWidget,
                              tooltip: s.key,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
            Divider(color: textColor.withOpacity(0.12), height: 1),
            SizedBox(height: 12),

            Flex(
              direction: isNarrow ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: isNarrow ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  l10n.footerCopyright(DateTime.now().year.toString()),
                  style: smallTextStyle.copyWith(fontSize: compact ? 11 : 13),
                ),

                if (!isNarrow) const SizedBox(width: 12),

                Padding(
                  padding: EdgeInsets.only(top: isNarrow ? 8.0 : 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () => _openUrl(madeUrl),
                        child: Text(
                          l10n.footerMadeBy,
                          style: smallTextStyle.copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(l10n.footerTerms, style: smallTextStyle),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),
            Divider(color: textColor.withOpacity(0.12), height: 1),
            SizedBox(height: 8),
            LanguageSelector(compact: true),
          ],
        );
      }),
    );
  }

}

class _FooterLink {
  final String key;
  final String label;
  final String route;
  const _FooterLink({
    required this.key,
    required this.label,
    required this.route,
  });
}