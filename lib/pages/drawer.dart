import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/global.params.dart';

class MyDrawer extends StatelessWidget {
  final SharedPreferences prefs;

  const MyDrawer({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blue],
              ),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/profil.png"),
                radius: 80,
              ),
            ),
          ),
          ...(GlobalParams.menus as List).map((item) {
            return Column(
              children: [
                const Divider(height: 4, color: Colors.blue),
                ListTile(
                  title: Text(
                    '${item['title']}',
                    style: const TextStyle(fontSize: 22),
                  ),
                  leading: item['icon'],
                  trailing: const Icon(Icons.arrow_right, color: Colors.blue),
                  onTap: () async {
                    if ('${item['title']}' != "Déconnexion") {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "${item['route']}");
                    } else {
                      prefs.setBool("connecte", false);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/authentification', (route) => false);
                    }
                  },
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
