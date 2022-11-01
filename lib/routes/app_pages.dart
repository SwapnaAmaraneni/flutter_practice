import 'package:flutter/material.dart';
import 'package:flutter_myghmc/ui/login_activity.dart';
import 'package:flutter_myghmc/ui/otp_activity.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      //AppRoutes.getstart: ((context) => GetStart()),
      AppRoutes.login: ((context) => LoginActivity()),
      AppRoutes.otpactivitity: ((context) => OTPActivity())
    };
  }
}
