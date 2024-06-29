import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/GallerieDetailsPage.dart';

class GalleriePage extends StatelessWidget {
  final SharedPreferences prefs;
  final TextEditingController txtGallery = TextEditingController();

  GalleriePage({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Gallery')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txtGallery,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.photo_library),
                hintText: "Keyword",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                onGetGallerieDetails(context);
              },
              child: Text('Chercher', style: TextStyle(fontSize: 22)),
            ),
          ),
        ],
      ),
    );
  }

  void onGetGallerieDetails(BuildContext context) {
    String keyword = txtGallery.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GallerieDetailsPage(keyword),
      ),
    );
    txtGallery.clear();
  }
}
