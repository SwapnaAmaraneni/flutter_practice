import 'package:flutter/material.dart';
import 'package:flutter_myghmc/routes/app_pages.dart';
import 'package:flutter_myghmc/routes/app_routes.dart';
import 'package:flutter_myghmc/ui/providers/emp_list_provider.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => EmpListProvider()),
        ],
   child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: AppRoutes.initial,
          routes: AppPages.routes,
        ));
  }
}
