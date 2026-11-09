import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
    Locale('pt', 'BR'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'HABITAT'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navWhyChoose.
  ///
  /// In en, this message translates to:
  /// **'Why Choose'**
  String get navWhyChoose;

  /// No description provided for @navServices.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get navServices;

  /// No description provided for @navProfessionals.
  ///
  /// In en, this message translates to:
  /// **'Professionals'**
  String get navProfessionals;

  /// No description provided for @navTestimonials.
  ///
  /// In en, this message translates to:
  /// **'Testimonials'**
  String get navTestimonials;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'A NEW CONCEPT\nFOR POOL CARE'**
  String get heroTitle;

  /// No description provided for @heroEyebrow.
  ///
  /// In en, this message translates to:
  /// **'360° AGENCY · IDENTITY · WEBSITES · SYSTEMS'**
  String get heroEyebrow;

  /// No description provided for @heroTitleLine1.
  ///
  /// In en, this message translates to:
  /// **'A NEW CONCEPT'**
  String get heroTitleLine1;

  /// No description provided for @heroTitleLine3.
  ///
  /// In en, this message translates to:
  /// **'IN 360°'**
  String get heroTitleLine3;

  /// No description provided for @heroCtaPrimary.
  ///
  /// In en, this message translates to:
  /// **'START PROJECT'**
  String get heroCtaPrimary;

  /// No description provided for @heroCtaSecondary.
  ///
  /// In en, this message translates to:
  /// **'VIEW PORTFOLIO'**
  String get heroCtaSecondary;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'At HABITAT, we transcend traditional maintenance by offering an unparalleled commitment to care and precision.'**
  String get heroSubtitle;

  /// No description provided for @heroCta.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get heroCta;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Trusted\nPartner in Pool Care'**
  String get aboutTitle;

  /// No description provided for @aboutDesc1.
  ///
  /// In en, this message translates to:
  /// **'At HABITAT, we believe your pool should be a haven of relaxation, not a source of concern. Our mission is to deliver exceptional pool and spa maintenance services, ensuring your aquatic spaces remain immaculate and inviting.'**
  String get aboutDesc1;

  /// No description provided for @aboutDesc2.
  ///
  /// In en, this message translates to:
  /// **'From routine upkeep to expert repairs, our team provides dependable, professional care, ensuring your pool stays crystal clear and hassle-free so you can focus on enjoying the tranquility it brings.'**
  String get aboutDesc2;

  /// No description provided for @aboutCta.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get aboutCta;

  /// No description provided for @servicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Services'**
  String get servicesTitle;

  /// No description provided for @serviceMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Pool Maintenance'**
  String get serviceMaintenance;

  /// No description provided for @serviceMaintenanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete pool maintenance service — cleaning, chemistry, inspection, and preventive care.'**
  String get serviceMaintenanceDesc;

  /// No description provided for @serviceRepairs.
  ///
  /// In en, this message translates to:
  /// **'Pool Repairs'**
  String get serviceRepairs;

  /// No description provided for @serviceRepairsDesc.
  ///
  /// In en, this message translates to:
  /// **'Specialized repairs: pumps, filters, leaks, and liners. Fast diagnosis and guaranteed fix.'**
  String get serviceRepairsDesc;

  /// No description provided for @serviceInvestment.
  ///
  /// In en, this message translates to:
  /// **'Investment'**
  String get serviceInvestment;

  /// No description provided for @serviceInvestmentDesc.
  ///
  /// In en, this message translates to:
  /// **'Discover route options and franchise opportunities designed for investors seeking strong returns and great scalability.'**
  String get serviceInvestmentDesc;

  /// No description provided for @whyChooseTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Choose\nHABITAT?'**
  String get whyChooseTitle;

  /// No description provided for @whyChooseSpecialized.
  ///
  /// In en, this message translates to:
  /// **'Specialized Maintenance'**
  String get whyChooseSpecialized;

  /// No description provided for @whyChooseSpecializedDesc.
  ///
  /// In en, this message translates to:
  /// **'We meticulously manage every aspect of your pool or spa, ensuring unparalleled attention to detail.'**
  String get whyChooseSpecializedDesc;

  /// No description provided for @whyChooseInnovation.
  ///
  /// In en, this message translates to:
  /// **'Innovation and Exclusivity'**
  String get whyChooseInnovation;

  /// No description provided for @whyChooseInnovationDesc.
  ///
  /// In en, this message translates to:
  /// **'As pioneers of this business model in the Orlando area, we offer a distinctive solution tailored for both pool owners and aspiring professionals.'**
  String get whyChooseInnovationDesc;

  /// No description provided for @whyChooseLicensing.
  ///
  /// In en, this message translates to:
  /// **'Professional Licensing'**
  String get whyChooseLicensing;

  /// No description provided for @whyChooseLicensingDesc.
  ///
  /// In en, this message translates to:
  /// **'Our comprehensive certification and training programs empower you to build a successful career in a promising industry.'**
  String get whyChooseLicensingDesc;

  /// No description provided for @whyCommitmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Commitment\nto Excellence'**
  String get whyCommitmentTitle;

  /// No description provided for @whyCommitmentDesc.
  ///
  /// In en, this message translates to:
  /// **'At HABITAT, we are dedicated to delivering unparalleled excellence, trust, and innovation in every aspect of our services. Whether maintaining your pool or assisting you in embarking on a new career path, our mission is to provide exceptional solutions that meet your unique needs.'**
  String get whyCommitmentDesc;

  /// No description provided for @professionalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Meet Our Professionals'**
  String get professionalsTitle;

  /// No description provided for @professionalsCta.
  ///
  /// In en, this message translates to:
  /// **'Professional Licensing'**
  String get professionalsCta;

  /// No description provided for @professionalsQuestion.
  ///
  /// In en, this message translates to:
  /// **'Do you want to be next?'**
  String get professionalsQuestion;

  /// No description provided for @professionalsRoleManager.
  ///
  /// In en, this message translates to:
  /// **'Regional Manager'**
  String get professionalsRoleManager;

  /// No description provided for @professionalsRoleLicensee.
  ///
  /// In en, this message translates to:
  /// **'Licensee Holder'**
  String get professionalsRoleLicensee;

  /// No description provided for @testimonialsTitle.
  ///
  /// In en, this message translates to:
  /// **'What Our Clients Say'**
  String get testimonialsTitle;

  /// No description provided for @testimonial1Text.
  ///
  /// In en, this message translates to:
  /// **'Excellent service! Highly recommend.'**
  String get testimonial1Text;

  /// No description provided for @testimonial1Name.
  ///
  /// In en, this message translates to:
  /// **'João Silva'**
  String get testimonial1Name;

  /// No description provided for @testimonial2Text.
  ///
  /// In en, this message translates to:
  /// **'Fast and professional service.'**
  String get testimonial2Text;

  /// No description provided for @testimonial2Name.
  ///
  /// In en, this message translates to:
  /// **'Maria Oliveira'**
  String get testimonial2Name;

  /// No description provided for @testimonial3Text.
  ///
  /// In en, this message translates to:
  /// **'High quality product!'**
  String get testimonial3Text;

  /// No description provided for @testimonial3Name.
  ///
  /// In en, this message translates to:
  /// **'Carlos Souza'**
  String get testimonial3Name;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get contactTitle;

  /// No description provided for @contactOrCall.
  ///
  /// In en, this message translates to:
  /// **'Or call us'**
  String get contactOrCall;

  /// No description provided for @footerCompanyDesc.
  ///
  /// In en, this message translates to:
  /// **'We are committed to delivering exceptional services, prioritizing customer satisfaction and upholding the highest safety standards.'**
  String get footerCompanyDesc;

  /// No description provided for @footerCompany.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get footerCompany;

  /// No description provided for @footerSocial.
  ///
  /// In en, this message translates to:
  /// **'Social Media'**
  String get footerSocial;

  /// No description provided for @footerAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get footerAbout;

  /// No description provided for @footerServices.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get footerServices;

  /// No description provided for @footerClients.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get footerClients;

  /// No description provided for @footerMission.
  ///
  /// In en, this message translates to:
  /// **'Mission'**
  String get footerMission;

  /// No description provided for @footerLicensing.
  ///
  /// In en, this message translates to:
  /// **'Licensing'**
  String get footerLicensing;

  /// No description provided for @footerContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get footerContact;

  /// No description provided for @footerCopyright.
  ///
  /// In en, this message translates to:
  /// **'© {year} HABITAT. All rights reserved.'**
  String footerCopyright(Object year);

  /// No description provided for @footerMadeBy.
  ///
  /// In en, this message translates to:
  /// **'Made with Flutter • Gabriel Morais'**
  String get footerMadeBy;

  /// No description provided for @footerTerms.
  ///
  /// In en, this message translates to:
  /// **'• Terms and Conditions'**
  String get footerTerms;

  /// No description provided for @leadTitle.
  ///
  /// In en, this message translates to:
  /// **'Request a Quote'**
  String get leadTitle;

  /// No description provided for @leadName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get leadName;

  /// No description provided for @leadEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get leadEmail;

  /// No description provided for @leadPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone / WhatsApp'**
  String get leadPhone;

  /// No description provided for @leadInterest.
  ///
  /// In en, this message translates to:
  /// **'Interest'**
  String get leadInterest;

  /// No description provided for @leadMessage.
  ///
  /// In en, this message translates to:
  /// **'Message (Optional)'**
  String get leadMessage;

  /// No description provided for @leadServiceMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get leadServiceMaintenance;

  /// No description provided for @leadServiceRepairs.
  ///
  /// In en, this message translates to:
  /// **'Repairs'**
  String get leadServiceRepairs;

  /// No description provided for @leadServiceInvestments.
  ///
  /// In en, this message translates to:
  /// **'Investments'**
  String get leadServiceInvestments;

  /// No description provided for @leadButton.
  ///
  /// In en, this message translates to:
  /// **'SEND INTEREST TO WHATSAPP'**
  String get leadButton;

  /// No description provided for @leadSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Thank you, {name}!'**
  String leadSuccessTitle(Object name);

  /// No description provided for @leadSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'We have received your request. Our team will contact you shortly.'**
  String get leadSuccessMessage;

  /// No description provided for @leadWhatsappError.
  ///
  /// In en, this message translates to:
  /// **'We could not open WhatsApp automatically. If you prefer, you can call us directly at (12) 98892-1999.'**
  String get leadWhatsappError;

  /// No description provided for @leadSubmitAnother.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT ANOTHER REQUEST'**
  String get leadSubmitAnother;

  /// No description provided for @leadError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while sending your request. Please try again.'**
  String get leadError;

  /// No description provided for @leadWhatsappMsg.
  ///
  /// In en, this message translates to:
  /// **'Hello HABITAT!\nMy name is {name}.\nI am interested in: {service}.\nMessage: {message}'**
  String leadWhatsappMsg(Object name, Object service, Object message);

  /// No description provided for @maintenanceAppBar.
  ///
  /// In en, this message translates to:
  /// **'HABITAT Maintenance'**
  String get maintenanceAppBar;

  /// No description provided for @maintenanceBadge.
  ///
  /// In en, this message translates to:
  /// **'POOL MAINTENANCE'**
  String get maintenanceBadge;

  /// No description provided for @maintenanceHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Crystal Clear,\nEvery Week.'**
  String get maintenanceHeroTitle;

  /// No description provided for @maintenanceHeroDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete recurring maintenance to keep your pool impeccable — chemistry, cleaning, filters, and quality report.'**
  String get maintenanceHeroDesc;

  /// No description provided for @maintenanceWhatIncluded.
  ///
  /// In en, this message translates to:
  /// **'What\'s Included'**
  String get maintenanceWhatIncluded;

  /// No description provided for @maintenanceWhatIncludedDesc.
  ///
  /// In en, this message translates to:
  /// **'Each visit covers all essential points for a healthy pool.'**
  String get maintenanceWhatIncludedDesc;

  /// No description provided for @maintenanceFeatureChemBalance.
  ///
  /// In en, this message translates to:
  /// **'Chemical Balance'**
  String get maintenanceFeatureChemBalance;

  /// No description provided for @maintenanceFeatureChemBalanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Analysis and adjustment of pH, chlorine, alkalinity and other parameters for safe and crystal clear water.'**
  String get maintenanceFeatureChemBalanceDesc;

  /// No description provided for @maintenanceFeatureDeepCleaning.
  ///
  /// In en, this message translates to:
  /// **'Deep Cleaning'**
  String get maintenanceFeatureDeepCleaning;

  /// No description provided for @maintenanceFeatureDeepCleaningDesc.
  ///
  /// In en, this message translates to:
  /// **'Wall brushing, floor vacuuming and waterline cleaning with premium products.'**
  String get maintenanceFeatureDeepCleaningDesc;

  /// No description provided for @maintenanceFeatureFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter & Equipment'**
  String get maintenanceFeatureFilter;

  /// No description provided for @maintenanceFeatureFilterDesc.
  ///
  /// In en, this message translates to:
  /// **'Cleaning and inspection of filters, pumps, and circulation systems for maximum efficiency.'**
  String get maintenanceFeatureFilterDesc;

  /// No description provided for @maintenanceFeatureQualityReport.
  ///
  /// In en, this message translates to:
  /// **'Quality Report'**
  String get maintenanceFeatureQualityReport;

  /// No description provided for @maintenanceFeatureQualityReportDesc.
  ///
  /// In en, this message translates to:
  /// **'Digital report after each visit with photos, measured parameters and recommendations.'**
  String get maintenanceFeatureQualityReportDesc;

  /// No description provided for @maintenanceFeatureScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled Visits'**
  String get maintenanceFeatureScheduled;

  /// No description provided for @maintenanceFeatureScheduledDesc.
  ///
  /// In en, this message translates to:
  /// **'Weekly, biweekly or monthly plans with certified technicians and fixed schedules.'**
  String get maintenanceFeatureScheduledDesc;

  /// No description provided for @maintenanceFeaturePreventive.
  ///
  /// In en, this message translates to:
  /// **'Preventive Care'**
  String get maintenanceFeaturePreventive;

  /// No description provided for @maintenanceFeaturePreventiveDesc.
  ///
  /// In en, this message translates to:
  /// **'Early identification of problems before they become costly repairs.'**
  String get maintenanceFeaturePreventiveDesc;

  /// No description provided for @maintenanceWhyTitle.
  ///
  /// In en, this message translates to:
  /// **'Why HABITAT Maintenance?'**
  String get maintenanceWhyTitle;

  /// No description provided for @maintenanceWhyDesc1.
  ///
  /// In en, this message translates to:
  /// **'We are not just a cleaning service. We are partners in your pool\'s health — with technology, consistency, and certified professionals.'**
  String get maintenanceWhyDesc1;

  /// No description provided for @maintenanceWhyDesc2.
  ///
  /// In en, this message translates to:
  /// **'Each visit is digitally documented. You receive a report with photos, parameters, and full history — total transparency.'**
  String get maintenanceWhyDesc2;

  /// No description provided for @maintenanceStatPools.
  ///
  /// In en, this message translates to:
  /// **'Pools served'**
  String get maintenanceStatPools;

  /// No description provided for @maintenanceStatSatisfaction.
  ///
  /// In en, this message translates to:
  /// **'Satisfaction rate'**
  String get maintenanceStatSatisfaction;

  /// No description provided for @maintenanceStatRating.
  ///
  /// In en, this message translates to:
  /// **'Average rating'**
  String get maintenanceStatRating;

  /// No description provided for @maintenanceStatSupport.
  ///
  /// In en, this message translates to:
  /// **'Emergency support'**
  String get maintenanceStatSupport;

  /// No description provided for @repairsAppBar.
  ///
  /// In en, this message translates to:
  /// **'HABITAT Repairs'**
  String get repairsAppBar;

  /// No description provided for @repairsBadge.
  ///
  /// In en, this message translates to:
  /// **'POOL REPAIRS'**
  String get repairsBadge;

  /// No description provided for @repairsHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Fast Diagnosis.\nGuaranteed Fix.'**
  String get repairsHeroTitle;

  /// No description provided for @repairsHeroDesc.
  ///
  /// In en, this message translates to:
  /// **'Fast diagnosis and specialized repairs on pumps, filters, leaks, and liners — with guaranteed solution.'**
  String get repairsHeroDesc;

  /// No description provided for @repairsWhatWeFix.
  ///
  /// In en, this message translates to:
  /// **'What We Fix'**
  String get repairsWhatWeFix;

  /// No description provided for @repairsWhatWeFixDesc.
  ///
  /// In en, this message translates to:
  /// **'From leaks to motors — we solve any problem quickly and with guarantee.'**
  String get repairsWhatWeFixDesc;

  /// No description provided for @repairsFeatureLeak.
  ///
  /// In en, this message translates to:
  /// **'Leak Detection'**
  String get repairsFeatureLeak;

  /// No description provided for @repairsFeatureLeakDesc.
  ///
  /// In en, this message translates to:
  /// **'Precise location of structural and pipe leaks with pressure technology and visual inspection.'**
  String get repairsFeatureLeakDesc;

  /// No description provided for @repairsFeaturePump.
  ///
  /// In en, this message translates to:
  /// **'Pump & Motor Repair'**
  String get repairsFeaturePump;

  /// No description provided for @repairsFeaturePumpDesc.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis and repair of pumps, motors, and circulation systems with original parts and warranty.'**
  String get repairsFeaturePumpDesc;

  /// No description provided for @repairsFeatureFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter Replacement'**
  String get repairsFeatureFilter;

  /// No description provided for @repairsFeatureFilterDesc.
  ///
  /// In en, this message translates to:
  /// **'Replacement and reconditioning of sand, cartridge, and diatomaceous earth filters for maximum filtration.'**
  String get repairsFeatureFilterDesc;

  /// No description provided for @repairsFeatureTile.
  ///
  /// In en, this message translates to:
  /// **'Tile & Surface Repair'**
  String get repairsFeatureTile;

  /// No description provided for @repairsFeatureTileDesc.
  ///
  /// In en, this message translates to:
  /// **'Repairs of liners, loose tiles, cracks, and finishes to restore your pool\'s aesthetics.'**
  String get repairsFeatureTileDesc;

  /// No description provided for @repairsFeatureElectrical.
  ///
  /// In en, this message translates to:
  /// **'Electrical & Lighting'**
  String get repairsFeatureElectrical;

  /// No description provided for @repairsFeatureElectricalDesc.
  ///
  /// In en, this message translates to:
  /// **'Repair and replacement of underwater lighting, electrical panels, and automation systems.'**
  String get repairsFeatureElectricalDesc;

  /// No description provided for @repairsFeatureHeater.
  ///
  /// In en, this message translates to:
  /// **'Heater Service'**
  String get repairsFeatureHeater;

  /// No description provided for @repairsFeatureHeaterDesc.
  ///
  /// In en, this message translates to:
  /// **'Corrective maintenance on gas, electric, and solar heaters for year-round comfort.'**
  String get repairsFeatureHeaterDesc;

  /// No description provided for @repairsWhyTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Trust HABITAT Repairs?'**
  String get repairsWhyTitle;

  /// No description provided for @repairsWhyDesc1.
  ///
  /// In en, this message translates to:
  /// **'Every repair starts with an honest diagnosis. No unnecessary charges — just the right fix, done the right way.'**
  String get repairsWhyDesc1;

  /// No description provided for @repairsWhyDesc2.
  ///
  /// In en, this message translates to:
  /// **'Our technicians are certified and arrive equipped to fix it on the first visit. Warranty on all parts and labor.'**
  String get repairsWhyDesc2;

  /// No description provided for @repairsStatFirstVisit.
  ///
  /// In en, this message translates to:
  /// **'Resolved on 1st visit'**
  String get repairsStatFirstVisit;

  /// No description provided for @repairsStatResponse.
  ///
  /// In en, this message translates to:
  /// **'Average response time'**
  String get repairsStatResponse;

  /// No description provided for @repairsStatWarranty.
  ///
  /// In en, this message translates to:
  /// **'Labor warranty'**
  String get repairsStatWarranty;

  /// No description provided for @repairsStatExperience.
  ///
  /// In en, this message translates to:
  /// **'Years of experience'**
  String get repairsStatExperience;

  /// No description provided for @investmentsAppBar.
  ///
  /// In en, this message translates to:
  /// **'HABITAT Investments'**
  String get investmentsAppBar;

  /// No description provided for @investmentsBadge.
  ///
  /// In en, this message translates to:
  /// **'BUSINESS OPPORTUNITIES'**
  String get investmentsBadge;

  /// No description provided for @investmentsHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Scale Your Future.\nInvest in HABITAT.'**
  String get investmentsHeroTitle;

  /// No description provided for @investmentsHeroDesc.
  ///
  /// In en, this message translates to:
  /// **'Discover high-return investment models with scalability in the premium pool services market.'**
  String get investmentsHeroDesc;

  /// No description provided for @investmentsModelsTitle.
  ///
  /// In en, this message translates to:
  /// **'Investment Models'**
  String get investmentsModelsTitle;

  /// No description provided for @investmentsRouteOwnership.
  ///
  /// In en, this message translates to:
  /// **'Route Ownership'**
  String get investmentsRouteOwnership;

  /// No description provided for @investmentsRouteOwnershipDesc.
  ///
  /// In en, this message translates to:
  /// **'Acquire established service routes with guaranteed recurring revenue from day one.'**
  String get investmentsRouteOwnershipDesc;

  /// No description provided for @investmentsRouteOwnershipBadge.
  ///
  /// In en, this message translates to:
  /// **'Low Risk'**
  String get investmentsRouteOwnershipBadge;

  /// No description provided for @investmentsRegionalFranchise.
  ///
  /// In en, this message translates to:
  /// **'Regional Franchise'**
  String get investmentsRegionalFranchise;

  /// No description provided for @investmentsRegionalFranchiseDesc.
  ///
  /// In en, this message translates to:
  /// **'Own the brand in an exclusive region with full support and proprietary technology.'**
  String get investmentsRegionalFranchiseDesc;

  /// No description provided for @investmentsRegionalFranchiseBadge.
  ///
  /// In en, this message translates to:
  /// **'High Growth'**
  String get investmentsRegionalFranchiseBadge;

  /// No description provided for @investmentsWhyTitle.
  ///
  /// In en, this message translates to:
  /// **'The Resilient Market'**
  String get investmentsWhyTitle;

  /// No description provided for @investmentsWhyRecurringRevenue.
  ///
  /// In en, this message translates to:
  /// **'Recurring Revenue'**
  String get investmentsWhyRecurringRevenue;

  /// No description provided for @investmentsWhyRecurringRevenueDesc.
  ///
  /// In en, this message translates to:
  /// **'Monthly maintenance contracts generate predictable and stable cash flow.'**
  String get investmentsWhyRecurringRevenueDesc;

  /// No description provided for @investmentsWhyProprietaryTech.
  ///
  /// In en, this message translates to:
  /// **'Proprietary Technology'**
  String get investmentsWhyProprietaryTech;

  /// No description provided for @investmentsWhyProprietaryTechDesc.
  ///
  /// In en, this message translates to:
  /// **'Management via exclusive CMS for total operation control.'**
  String get investmentsWhyProprietaryTechDesc;

  /// No description provided for @investmentsWhyInelasticDemand.
  ///
  /// In en, this message translates to:
  /// **'Inelastic Demand'**
  String get investmentsWhyInelasticDemand;

  /// No description provided for @investmentsWhyInelasticDemandDesc.
  ///
  /// In en, this message translates to:
  /// **'A pool is an asset that requires constant care, regardless of economic cycles.'**
  String get investmentsWhyInelasticDemandDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
