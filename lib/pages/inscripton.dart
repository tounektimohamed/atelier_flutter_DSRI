import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart'; 

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nom invalide';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Email invalide';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _mdpController,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mot de passe invalide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _inscription(context);
                },
                child: const Text('S\'inscrire'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _inscription(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Les données saisies sont valides
      // Vérifie d'abord que les contrôleurs ne sont pas null avant d'accéder à leur valeur
      if (_nomController.text.isNotEmpty && _emailController.text.isNotEmpty && _mdpController.text.isNotEmpty) {
        // Ici tu mettrais ta logique d'inscription, par exemple enregistrer les informations
        // d'utilisateur auprès d'un serveur ou dans un fichier local

        // Pour l'exemple, on suppose que l'inscription est réussie
        // On enregistre simplement l'email dans SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', _emailController.text);

        // Puis on navigue vers la page d'accueil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(prefs: prefs,)),
        );
      } else {
        // Afficher un message d'erreur si les champs sont vides
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: const Text('Veuillez remplir tous les champs.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
