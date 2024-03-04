import 'package:flutter/material.dart';

import '../../routing/inavigation_util.dart';

class HomeViewModel extends ChangeNotifier {
  final INavigationUtil _navigationUtil;

  HomeViewModel({
    required INavigationUtil navigationUtil,
  }) : _navigationUtil = navigationUtil;
}
