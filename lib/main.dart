import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_prototype/wrapper.dart';
import 'package:provider/provider.dart';

import 'Model/UserModel.dart';
import 'Services/Auth.dart';
import 'View/Authorizathion/SignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
        value: AuthService().user,
        initialData: null,
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          initialRoute: '/',
          routes: {
            '/signup': (context) => SignUp(),
          },
          home: const Wrapper(),
        ));
  }
}
