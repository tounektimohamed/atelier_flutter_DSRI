import 'package:flutter/material.dart';
import 'meteo_details_page.dart';

class MeteoPage extends StatelessWidget {
  final TextEditingController txtVille = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Météo')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txtVille,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_city),
                hintText: "Ville",
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
                onGetMeteoDetails(context);
              },
              child: Text('Chercher', style: TextStyle(fontSize: 22)),
            ),
          ),
        ],
      ),
    );
  }

  void onGetMeteoDetails(BuildContext context) {
    String ville = txtVille.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MeteoDetailsPage(ville),
      ),
    );
    txtVille.text = "";
  }
}
