import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routing/inavigation_util.dart';
import 'home_view.dart';
import 'home_view_model.dart';

class HomeFactory {
  static Widget build() {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        navigationUtil: context.read<INavigationUtil>(),
      ),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => const HomeView(),
      ),
    );
  }
}
