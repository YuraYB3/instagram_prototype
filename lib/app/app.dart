import 'package:flutter/material.dart';
import 'package:instagram_prototype/app/screens/home/home_factory.dart';
import 'package:provider/provider.dart';

import 'routing/app_routing.dart';
import 'routing/inavigation_util.dart';
import 'screens/login/login_factory.dart';
import 'services/user/iuser_service.dart';
import 'services/user/user_service.dart';

class App extends StatefulWidget {
  final AppRouter _appRouter;
  final IUserService _userService;
  const App({
    Key? key,
    required IUserService userService,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        _userService = userService,
        super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: context.read<INavigationUtil>().navigatorKey,
      onGenerateRoute: widget._appRouter.onGenerateRoute,
      home: StreamBuilder<UserState>(
        stream: widget._userService.userStateStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }
            switch (snapshot.data) {
              case UserState.notAuthorized:
                return LoginFactory.build();
              case UserState.readyToWork:
                return HomeFactory.build();
              default:
                return const Scaffold(
                  body: Center(
                    child: Text(
                      'default',
                      style: TextStyle(color: Colors.black, fontSize: 36),
                    ),
                  ),
                );
            }
          }
        },
      ),
    );
  }
}
