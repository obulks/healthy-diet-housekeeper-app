import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './routes/app_home_screen.dart';
import './routes/home_page.dart';
import './routes/food_page.dart';
import './routes/my_page.dart';
import './routes/find_page.dart';
import './routes/login_page.dart';
import './common/store.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalStore()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'AppTitle',
      theme: ThemeData(
        primaryColor: Color(0xff3fdabf),
        backgroundColor: Color(0xffF7F8F9),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      // initialRoute: '/login',
      initialRoute: '/',
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


