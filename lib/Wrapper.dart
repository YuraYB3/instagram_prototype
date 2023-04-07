// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:instagram_prototype/View/Authorizathion/SignIn.dart';
import 'package:provider/provider.dart';

import 'Model/UserModel.dart';
import 'View/Home/HomePage.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return LoginPage();
    } else {
      return const MyHomePage();
    }
  }
}
