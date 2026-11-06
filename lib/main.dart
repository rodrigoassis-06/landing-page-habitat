import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uniqswims_lp/features/home/screens/home_screen.dart';
import 'package:uniqswims_lp/firebase_options.dart';
import 'package:uniqswims_lp/habitat_theme.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/shared/di/injection.dart';
import 'package:uniqswims_lp/shared/locale/locale_provider.dart';
import 'package:uniqswims_shared/uniqswims_shared.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase init fallback: $e');
  }

  SharedInject.init();
  setupDependencies();
  runApp(const ProviderScope(child: HabitatApp()));
}

class HabitatApp extends ConsumerWidget {
  const HabitatApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Habitat Media — Agência 360°',
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      theme: HabitatTheme.darkTheme,
      routerConfig: _router,
    );
  }
}
