import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_dubai/core/constants/app_text_theme.dart';
import 'package:test_dubai/core/router/go_router.dart';
import 'package:test_dubai/features/auth/presentation/view/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(textTheme: AppTextTheme.textTheme),
      ),
    );
  }
}
