import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart'; // Assure-toi que le fichier homepage.dart est bien importé

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mdpController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                  _connexion(context);
                },
                child: const Text('Se connecter'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _connexion(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      
      if (_emailController.text.isNotEmpty && _emailController.text.contains('@') &&
          _mdpController.text.isNotEmpty) {
    
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', _emailController.text);

        // Puis on navigue vers la page d'accueil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(prefs: prefs,)),
        );
      } else {
        // Afficher un message d'erreur si les champs sont vides ou l'email est invalide
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: const Text('Veuillez remplir tous les champs et saisir un email valide.'),
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
