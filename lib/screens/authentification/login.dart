import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestion_de_soutenance/models/customTextField.dart';
import '../../main.dart';
import '../../services/auth_service.dart';
import '../../utils/navigation.dart';

class Login extends StatefulWidget {

  final Function visible;
  Login(this.visible);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _authService = AuthService();
  CustomTextField emailText = CustomTextField(title: 'Email', placeholder: 'Enter your email');
  CustomTextField passText = CustomTextField(title: 'Password', placeholder: '*****', ispass: true);

  final _key = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    emailText.error = "Enter email";
    passText.error = "Enter password";

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        emailText.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        passText.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            String email = emailText.value; // Déplacer la définition de la variable email ici
                            String password = passText.value;

                            if (_key.currentState?.validate() ?? false) {
                              User? user = await _authService.signInWithEmail(email, password);
                              handleLoggedInUser(true, context);
                            }
                          },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent.withOpacity(.7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Avez-vous un compte?'),
                            TextButton(
                              onPressed: widget.visible as void Function()?,
                              child: const Text(
                                'Register',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.orange,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
              child: const Text('Return in Homepage '),
            ),
          ],
        ),
      ),
    );
  }
}
