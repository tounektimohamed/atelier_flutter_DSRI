import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/drawer.dart';

class HomePage extends StatelessWidget {
  final SharedPreferences prefs;

  const HomePage({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(prefs: prefs),
      appBar: AppBar(
        title: const Text('Page Home'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/meteo'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/meteo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const Text('Météo'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/gallerie'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/gallerie.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const Text('Gallerie'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/pays'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/pays.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const Text('Pays'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/contact'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/contact.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const Text('Contact'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/parametres'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/parametres.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const Text('Paramètres'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => deconnexion(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/Quit.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const Text('Déconnexion'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deconnexion(BuildContext context) async {
    await prefs.setBool("connecte", false);
    Navigator.pushNamedAndRemoveUntil(context, '/authentification', (route) => false);
  }
}
