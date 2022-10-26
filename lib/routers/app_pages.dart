import 'package:flutter/material.dart';
import 'package:my_first_project/list_main_screen.dart';
import 'package:my_first_project/main.dart';

import '../get_start.dart';
import '../listview_demo.dart';
import '../login_page.dart';
import 'app_routes.dart';


class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.getstart: ((context) => GetStart()),
      AppRoutes.login: ((context) => LoginPage()),
      AppRoutes.listviewdemo: ((context) => ListviewDemo()),
      AppRoutes.listFirstScreen: ((context) => ListMainScreen()),


    };
  }
}
