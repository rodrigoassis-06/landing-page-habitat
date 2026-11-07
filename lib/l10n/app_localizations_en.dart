// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'HABITAT';

  @override
  String get navHome => 'Home';

  @override
  String get navAbout => 'About';

  @override
  String get navWhyChoose => 'Why Choose';

  @override
  String get navServices => 'Services';

  @override
  String get navProfessionals => 'Professionals';

  @override
  String get navTestimonials => 'Testimonials';

  @override
  String get navContact => 'Contact';

  @override
  String get heroTitle => 'A NEW CONCEPT\nFOR POOL CARE';

  @override
  String get heroSubtitle =>
      'At HABITAT, we transcend traditional maintenance by offering an unparalleled commitment to care and precision.';

  @override
  String get heroCta => 'Get In Touch';

  @override
  String get aboutTitle => 'Mais do que entregar soluções soltas. Entregamos estratégias reais e que realmente funcionam';

  @override
  String get aboutDesc1 => 'Entendemos que uma marca forte precisa de uma identidade visual que encante, processos internos ágeis que não gerem desperdício e tecnologia proprietária desenhada para as regras específicas do seu modelo de negócio.';

  @override
  String get aboutDesc2 => 'We don\'t use pre-made formulas. We develop custom software end-to-end — from initial discovery and UX to secure cloud deployment — backed by dedicated ongoing technical support.';

  @override
  String get aboutCta => 'Conhecer o nosso método';

  @override
  String get servicesTitle => 'O que podemos fazer por você';

  @override
  String get serviceMaintenance => 'Pool Maintenance';

  @override
  String get serviceMaintenanceDesc =>
      'Complete pool maintenance service — cleaning, chemistry, inspection, and preventive care.';

  @override
  String get serviceRepairs => 'Pool Repairs';

  @override
  String get serviceRepairsDesc =>
      'Specialized repairs: pumps, filters, leaks, and liners. Fast diagnosis and guaranteed fix.';

  @override
  String get serviceInvestment => 'Investment';

  @override
  String get serviceInvestmentDesc =>
      'Discover route options and franchise opportunities designed for investors seeking strong returns and great scalability.';

  @override
  String get whyChooseTitle => 'Why Build Your Project
With Habitat?';

  @override
  String get whyChooseSpecialized => 'Integrated Strategy & Identity';

  @override
  String get whyChooseSpecializedDesc => 'Your brand is never fragmented. Visual design aligns directly with technical architecture and user experience.';

  @override
  String get whyChooseInnovation => '100% Custom Software';

  @override
  String get whyChooseInnovationDesc => 'We build your business rules from the ground up, with no generic templates or rigid platform limits.';

  @override
  String get whyChooseLicensing => 'Active Support & Sustained Growth';

  @override
  String get whyChooseLicensingDesc => 'We don\'t leave after deploy. We maintain stability, security, and ongoing technical evolution for your platform.';

  @override
  String get whyCommitmentTitle => 'Commitment to
Your Growth';

  @override
  String get whyCommitmentDesc => 'Our goal is transforming operational complexity into fluid growth: brands that command authority, frictionless workflows, and scalable systems.';

  @override
  String get professionalsTitle => 'Meet Our Professionals';

  @override
  String get professionalsCta => 'Professional Licensing';

  @override
  String get professionalsQuestion => 'Do you want to be next?';

  @override
  String get professionalsRoleManager => 'Regional Manager';

  @override
  String get professionalsRoleLicensee => 'Licensee Holder';

  @override
  String get testimonialsTitle => 'What Our Clients Say';

  @override
  String get testimonial1Text => 'The custom system built by Habitat replaced manual spreadsheets and reduced our operational time by 60%. Their post-launch technical support is unmatched.';

  @override
  String get testimonial1Name => 'Roberto Faria · VP of Operations';

  @override
  String get testimonial2Text => 'The complete overhaul of our identity and new digital experience positioned our brand as an industry reference. Habitat understood our essence from day one.';

  @override
  String get testimonial2Name => 'Camila Duarte · Head of Marketing';

  @override
  String get testimonial3Text => 'Having branding, workflow optimization, and software engineering under one roof saved us months of work. Habitat is our growth partner.';

  @override
  String get testimonial3Name => 'Thiago Meirelles · CEO & Founder';

  @override
  String get contactTitle => 'Ready to Build Your Project\'s Habitat?';

  @override
  String get contactOrCall => 'Direct Support & WhatsApp';

  @override
  String get footerCompanyDesc => 'HABITAT · Brand Identity, Process Optimization, and Custom End-to-End Software with Continuous Support.';

  @override
  String get footerCompany => 'Company';

  @override
  String get footerSocial => 'Social Media';

  @override
  String get footerAbout => 'About Us';

  @override
  String get footerServices => 'Services';

  @override
  String get footerClients => 'Success Stories';

  @override
  String get footerMission => 'Methodology';

  @override
  String get footerLicensing => 'Systems & Support';

  @override
  String get footerContact => 'Contact';

  @override
  String footerCopyright(Object year) { return '© $year Habitat. All rights reserved.'; }

  @override
  String get footerMadeBy => 'Made with Flutter • Gabriel Morais';

  @override
  String get footerTerms => '• Terms and Conditions';

  @override
  String get leadTitle => 'Request a Tailored Proposal';

  @override
  String get leadName => 'Full Name';

  @override
  String get leadEmail => 'Email';

  @override
  String get leadPhone => 'Phone / WhatsApp';

  @override
  String get leadInterest => 'Interest';

  @override
  String get leadMessage => 'Message (Optional)';

  @override
  String get leadServiceMaintenance => 'Brand Identity & Strategy';

  @override
  String get leadServiceRepairs => 'Process & Workflow Optimization';

  @override
  String get leadServiceInvestments => 'Custom Systems & Ongoing Support';

  @override
  String get leadButton => 'REQUEST DIAGNOSTIC';

  @override
  String leadSuccessTitle(Object name) {
    return 'Thank you, $name!';
  }

  @override
  String get leadSuccessMessage => 'We received your message! Our team will reach out to evaluate your identity, process, or custom software requirements.';

  @override
  String get leadWhatsappError =>
      'We could not open WhatsApp automatically. If you prefer, you can call us directly at (12) 98892-1999.';

  @override
  String get leadSubmitAnother => 'SUBMIT ANOTHER REQUEST';

  @override
  String get leadError =>
      'An error occurred while sending your request. Please try again.';

  @override
  String leadWhatsappMsg(Object name, Object service, Object message) {
    return 'Hello HABITAT!\nMy name is $name.\nI am interested in: $service.\nMessage: $message';
  }

  @override
  String get maintenanceAppBar => 'HABITAT Maintenance';

  @override
  String get maintenanceBadge => 'POOL MAINTENANCE';

  @override
  String get maintenanceHeroTitle => 'Crystal Clear,\nEvery Week.';

  @override
  String get maintenanceHeroDesc =>
      'Complete recurring maintenance to keep your pool impeccable — chemistry, cleaning, filters, and quality report.';

  @override
  String get maintenanceWhatIncluded => 'What\'s Included';

  @override
  String get maintenanceWhatIncludedDesc =>
      'Each visit covers all essential points for a healthy pool.';

  @override
  String get maintenanceFeatureChemBalance => 'Chemical Balance';

  @override
  String get maintenanceFeatureChemBalanceDesc =>
      'Analysis and adjustment of pH, chlorine, alkalinity and other parameters for safe and crystal clear water.';

  @override
  String get maintenanceFeatureDeepCleaning => 'Deep Cleaning';

  @override
  String get maintenanceFeatureDeepCleaningDesc =>
      'Wall brushing, floor vacuuming and waterline cleaning with premium products.';

  @override
  String get maintenanceFeatureFilter => 'Filter & Equipment';

  @override
  String get maintenanceFeatureFilterDesc =>
      'Cleaning and inspection of filters, pumps, and circulation systems for maximum efficiency.';

  @override
  String get maintenanceFeatureQualityReport => 'Quality Report';

  @override
  String get maintenanceFeatureQualityReportDesc =>
      'Digital report after each visit with photos, measured parameters and recommendations.';

  @override
  String get maintenanceFeatureScheduled => 'Scheduled Visits';

  @override
  String get maintenanceFeatureScheduledDesc =>
      'Weekly, biweekly or monthly plans with certified technicians and fixed schedules.';

  @override
  String get maintenanceFeaturePreventive => 'Preventive Care';

  @override
  String get maintenanceFeaturePreventiveDesc =>
      'Early identification of problems before they become costly repairs.';

  @override
  String get maintenanceWhyTitle => 'Why HABITAT Maintenance?';

  @override
  String get maintenanceWhyDesc1 =>
      'We are not just a cleaning service. We are partners in your pool\'s health — with technology, consistency, and certified professionals.';

  @override
  String get maintenanceWhyDesc2 =>
      'Each visit is digitally documented. You receive a report with photos, parameters, and full history — total transparency.';

  @override
  String get maintenanceStatPools => 'Pools served';

  @override
  String get maintenanceStatSatisfaction => 'Satisfaction rate';

  @override
  String get maintenanceStatRating => 'Average rating';

  @override
  String get maintenanceStatSupport => 'Emergency support';

  @override
  String get repairsAppBar => 'HABITAT Repairs';

  @override
  String get repairsBadge => 'POOL REPAIRS';

  @override
  String get repairsHeroTitle => 'Fast Diagnosis.\nGuaranteed Fix.';

  @override
  String get repairsHeroDesc =>
      'Fast diagnosis and specialized repairs on pumps, filters, leaks, and liners — with guaranteed solution.';

  @override
  String get repairsWhatWeFix => 'What We Fix';

  @override
  String get repairsWhatWeFixDesc =>
      'From leaks to motors — we solve any problem quickly and with guarantee.';

  @override
  String get repairsFeatureLeak => 'Leak Detection';

  @override
  String get repairsFeatureLeakDesc =>
      'Precise location of structural and pipe leaks with pressure technology and visual inspection.';

  @override
  String get repairsFeaturePump => 'Pump & Motor Repair';

  @override
  String get repairsFeaturePumpDesc =>
      'Diagnosis and repair of pumps, motors, and circulation systems with original parts and warranty.';

  @override
  String get repairsFeatureFilter => 'Filter Replacement';

  @override
  String get repairsFeatureFilterDesc =>
      'Replacement and reconditioning of sand, cartridge, and diatomaceous earth filters for maximum filtration.';

  @override
  String get repairsFeatureTile => 'Tile & Surface Repair';

  @override
  String get repairsFeatureTileDesc =>
      'Repairs of liners, loose tiles, cracks, and finishes to restore your pool\'s aesthetics.';

  @override
  String get repairsFeatureElectrical => 'Electrical & Lighting';

  @override
  String get repairsFeatureElectricalDesc =>
      'Repair and replacement of underwater lighting, electrical panels, and automation systems.';

  @override
  String get repairsFeatureHeater => 'Heater Service';

  @override
  String get repairsFeatureHeaterDesc =>
      'Corrective maintenance on gas, electric, and solar heaters for year-round comfort.';

  @override
  String get repairsWhyTitle => 'Why Trust HABITAT Repairs?';

  @override
  String get repairsWhyDesc1 =>
      'Every repair starts with an honest diagnosis. No unnecessary charges — just the right fix, done the right way.';

  @override
  String get repairsWhyDesc2 =>
      'Our technicians are certified and arrive equipped to fix it on the first visit. Warranty on all parts and labor.';

  @override
  String get repairsStatFirstVisit => 'Resolved on 1st visit';

  @override
  String get repairsStatResponse => 'Average response time';

  @override
  String get repairsStatWarranty => 'Labor warranty';

  @override
  String get repairsStatExperience => 'Years of experience';

  @override
  String get investmentsAppBar => 'HABITAT Investments';

  @override
  String get investmentsBadge => 'BUSINESS OPPORTUNITIES';

  @override
  String get investmentsHeroTitle => 'Scale Your Future.\nInvest in HABITAT.';

  @override
  String get investmentsHeroDesc =>
      'Discover high-return investment models with scalability in the premium pool services market.';

  @override
  String get investmentsModelsTitle => 'Investment Models';

  @override
  String get investmentsRouteOwnership => 'Route Ownership';

  @override
  String get investmentsRouteOwnershipDesc =>
      'Acquire established service routes with guaranteed recurring revenue from day one.';

  @override
  String get investmentsRouteOwnershipBadge => 'Low Risk';

  @override
  String get investmentsRegionalFranchise => 'Regional Franchise';

  @override
  String get investmentsRegionalFranchiseDesc =>
      'Own the brand in an exclusive region with full support and proprietary technology.';

  @override
  String get investmentsRegionalFranchiseBadge => 'High Growth';

  @override
  String get investmentsWhyTitle => 'The Resilient Market';

  @override
  String get investmentsWhyRecurringRevenue => 'Recurring Revenue';

  @override
  String get investmentsWhyRecurringRevenueDesc =>
      'Monthly maintenance contracts generate predictable and stable cash flow.';

  @override
  String get investmentsWhyProprietaryTech => 'Proprietary Technology';

  @override
  String get investmentsWhyProprietaryTechDesc =>
      'Management via exclusive CMS for total operation control.';

  @override
  String get investmentsWhyInelasticDemand => 'Inelastic Demand';

  @override
  String get investmentsWhyInelasticDemandDesc =>
      'A pool is an asset that requires constant care, regardless of economic cycles.';
}
