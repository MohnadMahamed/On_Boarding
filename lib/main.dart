import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/modules/login/loginScreen.dart';
import 'package:task1/modules/on_boarding/on_boarding_screen.dart';
import 'package:task1/modules/sign_up/sign_up_screen.dart';
import 'package:task1/shared/network/local/cashe_helper.dart';

void main() {
  CacheHelper.init();
  runApp(const MyApp());
//   Widget widget;

//   bool onBoarding = CacheHelper.getData(key: 'onBoarding');

//   // ignore: unnecessary_null_comparison
//   if (onBoarding != null) {
//     widget = const LoginScreen();
//   } else {
//     widget = const OnBoardingScreen();
//   }

//   print('$onBoarding');
}

class MyApp extends StatelessWidget {
  //final Widget startWidget;

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white10,
              statusBarIconBrightness: Brightness.dark,
            ),
            elevation: 0.0,
            backgroundColor: Colors.white60,
          ),
          scaffoldBackgroundColor: Colors.white),
      home: const OnBoardingScreen(),
    );
  }
}
