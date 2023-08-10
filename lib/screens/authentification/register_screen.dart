import 'package:flutter/material.dart';
import '../../models/customTextField.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  CustomTextField emailText =
      CustomTextField(title: 'Email', placeholder: 'Enter your email');
  CustomTextField passText =
      CustomTextField(title: 'Password', placeholder: '*****', ispass: true);
  CustomTextField confirmPassText = CustomTextField(
      title: 'Confirm Password', placeholder: '*****', ispass: true);
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.error = "Enter email";
    passText.error = "Enter password";
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'RegisterScreen',
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
                  confirmPassText.textFormField(),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_key.currentState?.validate() ?? false) {
                        print(emailText.value);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent.withOpacity(.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'RegisterScreen',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
