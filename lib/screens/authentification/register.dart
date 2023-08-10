import 'package:flutter/material.dart';
import '../../models/customTextField.dart';

class Register extends StatefulWidget {
  final Function visible;
  Register(this.visible);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    'Register',
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
                      'Register',
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
                          'Login',
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
    );
  }
}
