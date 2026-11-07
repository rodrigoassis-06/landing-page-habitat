import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uniqswims_shared/uniqswims_shared.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/features/lead_capture/domain/usecases/save_lead_usecase.dart';

enum _FormStatus { idle, loading, success, whatsappError }

class LeadFormWidget extends StatefulWidget {
  final String initialService; // 'Maintenance', 'Repairs', 'Investments', 'Contact'

  const LeadFormWidget({
    super.key,
    required this.initialService,
  });

  @override
  State<LeadFormWidget> createState() => _LeadFormWidgetState();
}

class _LeadFormWidgetState extends State<LeadFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  late String _selectedService;
  _FormStatus _status = _FormStatus.idle;

  List<String> _services(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.leadServiceMaintenance,
      l10n.leadServiceRepairs,
      l10n.leadServiceInvestments,
    ];
  }

  @override
  void initState() {
    super.initState();
    _selectedService = widget.initialService;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _status = _FormStatus.loading);

    final l10n = AppLocalizations.of(context)!;

    try {
      final lead = LeadModel(
        id: '', 
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        message: _messageController.text.trim(),
        interest: _selectedService,
        createdAt: DateTime.now(),
      );

      final leadId = await GetIt.I<SaveLeadUseCase>().call(lead);
      final savedLead = LeadModel(
        id: leadId,
        name: lead.name,
        email: lead.email,
        phone: lead.phone,
        message: lead.message,
        interest: lead.interest,
        status: lead.status,
        createdAt: lead.createdAt,
      );

      debugPrint('Lead salvo com ID: $leadId // Nome: ${savedLead.name} // Email: ${savedLead.email}');

      final whatsappMsg = l10n.leadWhatsappMsg(
        _nameController.text.trim(),
        _selectedService,
        _messageController.text.trim(),
      );

      final whatsappUrl = Uri.parse(
        "https://wa.me/5512988921999?text=${Uri.encodeComponent(whatsappMsg)}",
      );

      bool opened = false;
      if (await canLaunchUrl(whatsappUrl)) {
        opened = await launchUrl(
          whatsappUrl,
          mode: LaunchMode.externalApplication,
        );
      }

      if (mounted) {
        setState(() {
          _status = opened ? _FormStatus.success : _FormStatus.whatsappError;
        });
      }
    } catch (e) {
      String userMessage = l10n.leadError;
      
      if (e is AppException) {
        userMessage = e.message;
      }
      
      debugPrint('Erro técnico ao salvar lead: $e');

      if (mounted) {
        setState(() => _status = _FormStatus.idle);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(userMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_status == _FormStatus.success || _status == _FormStatus.whatsappError) {
      return _buildSuccessView();
    }

    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final services = _services(context);
    if (!services.contains(_selectedService)) {
      _selectedService = services.first;
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.leadTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            _buildField(
              label: l10n.leadName,
              controller: _nameController,
              validator: FormBuilderValidators.required(),
            ),
            const SizedBox(height: 16),
            _buildField(
              label: l10n.leadEmail,
              controller: _emailController,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            const SizedBox(height: 16),
            _buildField(
              label: l10n.leadPhone,
              controller: _phoneController,
              validator: FormBuilderValidators.required(),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedService,
              dropdownColor: theme.colorScheme.surface,
              items: services
                  .map(
                    (service) => DropdownMenuItem<String>(
                      value: service,
                      child: Text(service),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _selectedService = value;
                });
              },
              decoration: InputDecoration(
                labelText: l10n.leadInterest,
              ),
              validator: FormBuilderValidators.required(),
            ),
            const SizedBox(height: 16),
            _buildField(
              label: l10n.leadMessage,
              controller: _messageController,
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            _status == _FormStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      l10n.leadButton,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessView() {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 64),
          const SizedBox(height: 16),
          Text(
            l10n.leadSuccessTitle(_nameController.text.split(' ').first),
            style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.leadSuccessMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70),
          ),
          if (_status == _FormStatus.whatsappError) ...[
            const SizedBox(height: 24),
            const Divider(color: Colors.white24),
            const SizedBox(height: 16),
            Text(
              l10n.leadWhatsappError,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.orangeAccent, fontSize: 12),
            ),
          ],
          const SizedBox(height: 32),
          TextButton(
            onPressed: () {
              setState(() {
                _status = _FormStatus.idle;
                _formKey.currentState?.reset();
                _nameController.clear();
                _emailController.clear();
                _phoneController.clear();
                _messageController.clear();
                _selectedService = widget.initialService;
              });
            },
            child: Text(l10n.leadSubmitAnother, style: const TextStyle(color: Colors.blueAccent)),
          ),
        ],
      ),
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
      ),
    );
  }
}