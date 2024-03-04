import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/routing/app_routing.dart';
import 'app/routing/inavigation_util.dart';
import 'app/routing/navigation_util.dart';
import 'app/services/auth/auth_service.dart';
import 'app/services/auth/iauth_service.dart';
import 'app/services/network/firebase_service.dart';
import 'app/services/network/inetwork_service.dart';
import 'app/services/user/iuser_service.dart';
import 'app/services/user/user_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final IAuthService authService =
      AuthService(firebaseAuth: FirebaseAuth.instance);
  final INavigationUtil navigationUtil = NavigationUtil();
  final IUserService userService = UserService(authService: authService);
  final INetworkService networkService = FirebaseService();

  runApp(MultiProvider(
    providers: [
      Provider.value(value: authService),
      Provider.value(value: navigationUtil),
      Provider.value(value: userService),
      Provider.value(value: networkService),
    ],
    child: App(
      userService: userService,
      appRouter: AppRouter(),
    ),
  ));
}
