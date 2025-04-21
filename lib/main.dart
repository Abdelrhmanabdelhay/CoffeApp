import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Screens/SplashScreen.dart';
import 'package:untitled1/models/Cart-Provide.dart';
import 'package:untitled1/models/FacoouriteProvider.dart';
import 'package:untitled1/models/NotficationProvider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';


void main() {
  runApp( DevicePreview(
    enabled: true,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (context) => const CoffeApp(),
  ),);
}

class CoffeApp extends StatelessWidget {
  const CoffeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CartProvider()),
        ChangeNotifierProvider(create: (_)=>FavouriteProvider()),
        ChangeNotifierProvider(create: (_)=>NotificationProvider())
      ],
      child:  MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
      ),
    );
  }
}

