import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './routes/app_home_screen.dart';
import './routes/home_page.dart';
import './routes/food_page.dart';
import './routes/me_page.dart';
import './routes/find_page.dart';
import './routes/login_page.dart';
import './common/store.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Store()),
      ],
      child: App(),
    ),
  );
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //设置状态栏的图标和字体的颜色
      statusBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppTitle',
      theme: ThemeData(
        primaryColor: Color(0xff3fdabf),
        backgroundColor: Color(0xffF7F8F9),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        cursorColor: Colors.white,
      ),
      initialRoute: '/',
      // initialRoute: '/',
      routes: {
        '/': (context) => AppHomeScreen(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/food': (context) => FoodPage(),
        '/find': (context) => FindPage(),
        '/my': (context) => MyPage(),
      },
    );
  }
}
