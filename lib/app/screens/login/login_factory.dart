import 'package:flutter/material.dart';
import 'package:instagram_prototype/app/services/user/iuser_service.dart';
import 'package:provider/provider.dart';

import '../../routing/inavigation_util.dart';
import 'login_view_model.dart';
import 'sign_in.dart';

class LoginFactory {
  static Widget build() {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(
        userService: context.read<IUserService>(),
        navigationUtil: context.read<INavigationUtil>(),
      ),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => LoginView(model: model),
      ),
    );
  }
}
