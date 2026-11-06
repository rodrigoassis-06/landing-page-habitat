import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uniqswims_lp/features/investments/screens/investments_screen.dart';
import 'package:uniqswims_lp/features/repairs/screens/repairs_screen.dart';
import 'package:uniqswims_lp/firebase_options.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/shared/di/injection.dart';
import 'package:uniqswims_lp/shared/locale/locale_provider.dart';
import 'package:uniqswims_shared/uniqswims_shared.dart';
import 'package:uniqswims_lp/uniqswims_theme.dart';
import 'package:uniqswims_lp/features/home/screens/home_screen.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/maintenance',
      builder: (context, state) => const MaintenanceScreen(),
    ),
    GoRoute(
      path: '/repairs',
      builder: (context, state) => const RepairsScreen(),
    ),
    GoRoute(
      path: '/investments',
      builder: (context, state) => const InvestmentsScreen(),
    ),
  ],
);

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Maintenance Screen')));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SharedInject.init();
  setupDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'UniqSwims Landing',
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      theme: UniqSwimsTheme.darkTheme,
      routerConfig: _router,
    );
  }
}
