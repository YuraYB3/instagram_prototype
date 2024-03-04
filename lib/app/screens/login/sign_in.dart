import 'package:flutter/material.dart';
import 'package:instagram_prototype/app/screens/login/login_view_model.dart';

import '../../common/Constants.dart';

class LoginView extends StatefulWidget {
  final LoginViewModel model;

  const LoginView({super.key, required this.model});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: const Color.fromARGB(251, 220, 230, 230),
        // ignore: prefer_const_constructors
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  const Text('English (US)'),
                  const Padding(padding: EdgeInsets.only(top: 90)),
                  SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        'assets/instagram.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(padding: EdgeInsets.only(top: 70)),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: "Username, email or mobile number"),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter an email' : null,
                    style: const TextStyle(),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: "Password"),
                    obscureText: true,
                    validator: (value) => value!.length < 8
                        ? 'Enter a password 8+ characters'
                        : null,
                    style: const TextStyle(),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  SizedBox(
                    height: 50,
                    width: 380,
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          /*dynamic result =
                              await _auth.signInWithPassword(email, password);*/
                          /*  if (result == null) {
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          }*/
                        }
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(7, 85, 85, 1)),
                          // ignore: prefer_const_constructors
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(255, 28, 33, 201))),
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  const Text(
                    "Forgot password?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 110),
                    child: SizedBox(
                      height: 30,
                      width: 380,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(7, 85, 85, 1)),
                            // ignore: prefer_const_constructors
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                                    Color.fromARGB(255, 224, 224, 235))),
                        child: const Text(
                          'Create account',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
