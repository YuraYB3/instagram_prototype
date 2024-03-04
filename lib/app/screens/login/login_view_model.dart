import 'package:flutter/material.dart';
import 'package:instagram_prototype/app/services/user/iuser_service.dart';

import '../../routing/inavigation_util.dart';

class LoginViewModel extends ChangeNotifier {
  final INavigationUtil _navigationUtil;
  final IUserService _userService;

  LoginViewModel({
    required IUserService userService,
    required INavigationUtil navigationUtil,
  })  : _navigationUtil = navigationUtil,
        _userService = userService;
}
