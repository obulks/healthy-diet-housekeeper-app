import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/routes/login_page.dart';
import 'package:provider/provider.dart';
import './common/global.dart';
import './routes/home_page.dart';
import './routes/login_page.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '健康饮食管家',
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),

      },
    );
  }
}

