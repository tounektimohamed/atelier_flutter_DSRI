import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/ContactPage.dart';
import 'package:voyage/pages/GalleriePage.dart';
import 'package:voyage/pages/MeteoPage.dart';
import 'package:voyage/pages/ParametresPage.dart';
import 'package:voyage/pages/PaysPage.dart';
import 'package:voyage/pages/authentification.dart';
import 'package:voyage/pages/homepage.dart';
import 'package:voyage/pages/inscripton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  MyApp({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voyage',
      initialRoute: '/inscription',
      routes: {
        '/connexion': (context) => const LoginPage(),
        '/inscription': (context) => const InscriptionPage(),
        '/accueil': (context) => HomePage(prefs: prefs),
        '/meteo': (context) => MeteoPage(),
        '/gallerie': (context) => GalleriePage(prefs: prefs), // Pass prefs here
        '/pays': (context) => const PaysPage(),
        '/contact': (context) => const ContactPage(),
        '/parametres': (context) => const ParametresPage(),
      },
    );
  }
}
