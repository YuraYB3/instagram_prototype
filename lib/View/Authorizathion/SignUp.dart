import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/UserModel.dart';
import '../../Services/Auth.dart';
import '../../Services/DatabaseUser.dart';
import '../../Shared/Constants.dart';

// ignore: use_key_in_widget_constructors
class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
  String repeatedPassword = '';
  String error = '';
  String name = '';
  String surname = '';
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return StreamProvider<List<UserModel>?>.value(
        value: DatabaseUserService(uid: '').users,
        initialData: null,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(251, 220, 230, 230),
          // ignore: prefer_const_constructors
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: const Color.fromARGB(251, 220, 230, 230),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your name' : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Name"),
                      style: const TextStyle(),
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your surname' : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Surname"),
                      onChanged: (val) {
                        setState(() {
                          surname = val;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an email' : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Email"),
                      style: const TextStyle(),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) => value!.length < 8
                          ? 'Enter a password 8+ charactercs'
                          : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Password"),
                      obscureText: true,
                      style: const TextStyle(),
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) => value != password
                          ? 'Difference between password!'
                          : null,
                      decoration: textInputDecoration.copyWith(
                          hintText: "Repeat password"),
                      obscureText: true,
                      style: const TextStyle(),
                      onChanged: (val) {
                        setState(() {
                          repeatedPassword = val;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 180,
                      height: 40,
                      child: TextButton(
                        onPressed: () async {
                          try {
                            if (_formKey.currentState!.validate()) {
                              dynamic result = await _auth.register(
                                  email, password, surname, name);
                              if (result == null) {
                                setState(() {
                                  error = "ERROR";
                                });
                              } else {
                                Navigator.pop(context);
                              }
                            }
                            // ignore: empty_catches
                          } catch (e) {}
                        },
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(7, 85, 85, 1)),
                            // ignore: prefer_const_constructors
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                                    Colors.white)),
                        child: const Text(
                          'SIGN UP',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
/*
 
                        */