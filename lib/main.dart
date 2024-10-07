import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'localization_service.dart'; // Import the service

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => LocalizationService(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationService>(
      builder: (context, state, child) {
        return MaterialApp(
          title: 'Multilanguage App',
          locale: state.currentLocale,
          supportedLocales: [
            Locale('en', ''), // English
            Locale('es', ''), // Spanish
          ],
          localizationsDelegates: [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)?.hello ?? ''), // No need for context
        actions: [
          IconButton(
              onPressed: () {
                context.read<LocalizationService>().changeLanguage('en');
              },
              icon: Icon(Icons.language))
        ],
      ),
      body: Center(
        child: Text(
            AppLocalizations.of(context)?.welcome ?? ''), // No need for context
      ),
    );
  }
}
