import 'package:flutter/material.dart';
import 'package:flutter_myghmc/ui/grievances/groupedlist.dart';
import 'package:flutter_myghmc/ui/login_activity.dart';
import 'package:flutter_myghmc/ui/otp_activity.dart';
import 'package:flutter_myghmc/ui/providers/add_emp_data.dart';
import 'package:image_picker/image_picker.dart';
import '../ui/cameragallerypics.dart';
import '../ui/grievances/checkstatus_activity.dart';
import '../ui/loginscreen.dart';
import '../ui/providers/employee_list.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      //AppRoutes.getstart: ((context) => GetStart()),
      AppRoutes.login: ((context) => LoginActivity()),
      AppRoutes.otpactivitity: ((context) => OTPActivity()),
      AppRoutes.checkStatusActivity: ((context) => CheckStatusList()),
      AppRoutes.groupedList: ((context) => Groupedlist()),
      AppRoutes.camerygalleryactivity: ((context) => CameraGalleryPics()),
      AppRoutes.loginscreen: ((context) => LoginScreen()),
      AppRoutes.EmployeeListactivity: ((context) => EmployeeList()),
      AppRoutes.AddEmpDetails: ((context) => AddEmpDetails())
    };
  }
}
