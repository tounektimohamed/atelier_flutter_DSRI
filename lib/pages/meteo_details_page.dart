import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MeteoDetailsPage extends StatefulWidget {
  final String ville;

  const MeteoDetailsPage(this.ville, {super.key});

  @override
  State<MeteoDetailsPage> createState() => MeteoDetailsPageState();
}

class MeteoDetailsPageState extends State<MeteoDetailsPage> {
  var meteoData;

  @override
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  void getMeteoData(String ville) {
    print("Météo de la ville de " + ville);
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$ville&appid=7b6ec5e9702790de1dfc2f85405c80fa&units=metric&lang=fr";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.meteoData = json.decode(resp.body);
      });
      print(this.meteoData);
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Météo Détails ${widget.ville}')),
      body: Center(
        child: meteoData == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: meteoData['list'].length,
                itemBuilder: (context, index) {
                  var forecast = meteoData['list'][index];
                  var date = DateTime.fromMillisecondsSinceEpoch(forecast['dt'] * 1000);
                  var temperature = forecast['main']['temp'];
                  var description = forecast['weather'][0]['description'];
                  var humidity = forecast['main']['humidity'];
                  var windSpeed = forecast['wind']['speed'];

                  return Card(
                    child: ListTile(
                      title: Text('${date.toLocal()}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Température: $temperature°C'),
                          Text('Description: $description'),
                          Text('Humidité: $humidity%'),
                          Text('Vitesse du vent: $windSpeed m/s'),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
