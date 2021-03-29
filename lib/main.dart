import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Store()),
      ],
      child: App(),
    ),
  );

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        //设置状态栏的图标和字体的颜色
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      dismissOtherOnShow: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppTitle',
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white,
          ),
          primaryColor: Color(0xff3fdabf),
          backgroundColor: Color(0xffF7F8F9),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        initialRoute: '/',
        // initialRoute: '/find',
        routes: {
          '/': (context) => AppHomeScreen(),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/food': (context) => FoodPage(),
          '/find': (context) => FindPage(),
          '/me': (context) => MePage(),
        },
      ),
    );
  }
}
