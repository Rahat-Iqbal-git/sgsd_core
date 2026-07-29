import 'package:flutter/material.dart';
import 'package:sgsd_core/features/dispatch/presentation/view/dispatch_list_page.dart';
import 'package:sgsd_core/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.black,
      dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
    );

    return MaterialApp(
      theme: ThemeData(
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const DispatchListPage(),
    );
  }
}
