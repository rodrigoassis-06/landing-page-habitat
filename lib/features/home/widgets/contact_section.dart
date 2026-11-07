import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/features/lead_capture/widgets/lead_form_widget.dart';

class ContactSection extends StatefulWidget {
  final Key? sectionKey;

  const ContactSection({Key? key, this.sectionKey,}) : super(key: key);

  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final tt = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      final isMobile = maxWidth < 800;

      return Container(
        key: widget.sectionKey,
        width: double.infinity,
        color: cs.background,
        padding: EdgeInsets.symmetric(vertical: isMobile ? 28 : 72, horizontal: isMobile ? 20 : 48),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(width: 64, height: 4, color: cs.onSurface, margin: const EdgeInsets.only(bottom: 12)),
              ),
              Text(
                l10n.contactTitle,
                style: (tt.headlineMedium ?? const TextStyle(fontSize: 28, fontWeight: FontWeight.bold))
                    .copyWith(color: cs.onSurface),
              ),
              const SizedBox(height: 18),

              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(isMobile ? 18 : 28),
                // decoration: BoxDecoration(
                //   color: cs.surface,
                //   borderRadius: BorderRadius.circular(14),
                //   boxShadow: [BoxShadow(color: Colors.black, blurRadius: 18, offset: const Offset(0, 8))],
                //   border: Border.all(color: cs.onSurface.withOpacity(0.04)),
                // ),
                child: Column(
                  children: [
                    LeadFormWidget(
                      initialService: 'Contact',
                    ),
                    if (!isMobile) ...[
                      const SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: cs.background,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: cs.onSurface.withOpacity(0.04)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.contactOrCall, style: tt.labelLarge?.copyWith(color: cs.onSurface.withOpacity(0.9))),
                            const SizedBox(height: 6),
                            Text('(11) 98892-1999', style: tt.bodyMedium?.copyWith(color: cs.onSurface)),
                            const SizedBox(height: 8),
                            Text('contato@habitatmedia.com.br', style: tt.bodySmall?.copyWith(color: cs.onSurface.withOpacity(0.9))),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
