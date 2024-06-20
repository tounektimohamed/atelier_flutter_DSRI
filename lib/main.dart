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
  // Récupérer les préférences partagées
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs)); // Passer les préférences partagées à MyApp
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs; // Déclarer prefs comme variable de classe

  MyApp({required this.prefs}); // Ajouter prefs comme paramètre de constructeur

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voyage',
      initialRoute: '/inscription',
      routes: {
        '/connexion': (context) => LoginPage(),
        '/inscription': (context) => InscriptionPage(),
        '/accueil': (context) => HomePage(prefs: prefs), // Passer les préférences partagées à HomePage
        '/meteo': (context) => MeteoPage(),
        '/gallerie': (context) => GalleriePage(),
        '/pays': (context) => PaysPage(),
        '/contact': (context) => ContactPage(),
        '/parametres': (context) => ParametresPage(),
      },
    );
  }
}
