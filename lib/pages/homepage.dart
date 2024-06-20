import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/global.params.dart';
import 'package:voyage/pages/drawer.dart';
import 'package:voyage/pages/home_page_item.widget.dart';


class HomePage extends StatelessWidget {
  final SharedPreferences prefs;

  // Ajoutez SharedPreferences comme paramètre au constructeur de HomePage
  const HomePage({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(prefs: prefs),
      appBar: AppBar(
        title: Text('Page Home'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            HomePageItem(
              imagePath: 'images/meteo.png',
              onTap: () => Navigator.pushNamed(context, "/meteo"),
            ),
            HomePageItem(
              imagePath: 'images/gallerie.png',
              onTap: () => Navigator.pushNamed(context, '/gallerie'),
            ),
            HomePageItem(
              imagePath: 'images/pays.png',
              onTap: () => Navigator.pushNamed(context, '/pays'),
            ),
            HomePageItem(
              imagePath: 'images/contact.png',
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
            HomePageItem(
              imagePath: 'images/parametres.png',
              onTap: () => Navigator.pushNamed(context, '/parametres'),
            ),
            HomePageItem(
              imagePath: 'images/Quit.png',
              onTap: () => deconnexion(context),
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
